from fastapi import FastAPI, HTTPException, Header, status, Depends
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Optional, Dict, Any
import pandas as pd
import random
import os

# Configuration
DATA_URL = "https://dst-de.s3.eu-west-3.amazonaws.com/fastapi_en/questions_en.xlsx"
ALLOWED_COUNTS = {5, 10, 20}

# Simple user store
USER_STORE = {
    "alice": "wonderland",
    "bob": "builder",
    "clementine": "mandarine",
}
ADMIN_PASSWORD = "4dm1N"

app = FastAPI(title="MCQ Questions API", version="1.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# In-memory questions store
QUESTIONS: List[Dict[str, Any]] = []

class QuestionCreate(BaseModel):
    question: str
    subject: str
    correct: str
    use: str
    answerA: Optional[str] = None
    answerB: Optional[str] = None
    answerC: Optional[str] = None
    answerD: Optional[str] = None

def parse_basic_auth(auth_header: Optional[str]) -> Optional[Dict[str, str]]:
    # Expecting: "Basic username:password" (not base64 encoded)
    if not auth_header:
        return None
    if not auth_header.startswith("Basic "):
        return None
    payload = auth_header[len("Basic "):]
    if ":" not in payload:
        return None
    username, password = payload.split(":", 1)
    return {"username": username, "password": password}

def require_auth(authorization: Optional[str] = Header(None)):
    creds = parse_basic_auth(authorization)
    if not creds:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid or missing Authorization header")
    username = creds["username"]
    password = creds["password"]
    if username not in USER_STORE or USER_STORE[username] != password:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid credentials")
    return username

def get_parsed_auth(authorization: Optional[str] = Header(None)):
    creds = parse_basic_auth(authorization)
    if not creds:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid or missing Authorization header")
    username = creds["username"]
    if username not in USER_STORE:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid username")
    return creds

@app.on_event("startup")
def load_data():
    global QUESTIONS
    try:
        df = pd.read_excel(DATA_URL, engine="openpyxl")
    except Exception as e:
        local_path = "questions_en.xlsx"
        if os.path.exists(local_path):
            df = pd.read_excel(local_path, engine="openpyxl")
        else:
            raise RuntimeError(f"Could not load data from {DATA_URL} and no local fallback found. Error: {e}")

    df.columns = [str(c).strip() for c in df.columns]
    lower_to_col = {c.lower(): c for c in df.columns}

    records = []
    for _, row in df.iterrows():
        rec = {}
        rec["question"] = row.get(lower_to_col.get("question", ""), "")
        rec["subject"] = row.get(lower_to_col.get("subject", ""), "")
        rec["correct"] = row.get(lower_to_col.get("correct", ""), "")
        rec["use"] = row.get(lower_to_col.get("use", ""), "")
        rec["answerA"] = row.get(lower_to_col.get("answera", ""), None)
        rec["answerB"] = row.get(lower_to_col.get("answerb", ""), None)
        rec["answerC"] = row.get(lower_to_col.get("answerc", ""), None)
        rec["answerD"] = row.get(lower_to_col.get("answerd", ""), None)
        # convert NaN to None
        records.append({k: (None if pd.isna(v) else v) for k, v in rec.items()})
    QUESTIONS = records

@app.get("/", summary="Health check")
def health():
    return {"status": "ok", "message": "MCQ Questions API is up"}

@app.get("/subjects", summary="List available subjects")
def list_subjects(username: str = Depends(require_auth)):
    subjects = sorted({str(q.get("subject", "")).strip() for q in QUESTIONS if q.get("subject", "") is not None})
    return {"subjects": subjects}

@app.get("/questions", summary="Get random questions")
def get_questions(
    use: Optional[str] = None,
    subjects: Optional[str] = None,
    count: int = 5,
    username: str = Depends(require_auth),
):
    if count not in ALLOWED_COUNTS:
        raise HTTPException(status_code=422, detail=f"count must be one of {sorted(ALLOWED_COUNTS)}")
    filtered = QUESTIONS
    if use:
        filtered = [q for q in filtered if str(q.get("use", "")).strip().lower() == str(use).strip().lower()]
    if subjects:
        subject_list = [s.strip().lower() for s in subjects.split(",") if s.strip()]
        if not subject_list:
            raise HTTPException(status_code=422, detail="subjects parameter is invalid")
        filtered = [q for q in filtered if str(q.get("subject", "")).strip().lower() in subject_list]
    if not filtered:
        raise HTTPException(status_code=404, detail="No questions match the requested filters")

    available = len(filtered)
    if available < count:
        chosen = random.sample(filtered, k=available)
        return JSONResponse(status_code=200, content={
            "warning": f"Only {available} questions available matching filters; returning {available}.",
            "count_requested": count,
            "count_returned": available,
            "questions": chosen
        })
    chosen = random.sample(filtered, k=count)
    random.shuffle(chosen)
    return {"count_requested": count, "count_returned": count, "questions": chosen}

@app.post("/admin/question", summary="Create a new question (admin only)", status_code=201)
def create_question(payload: QuestionCreate, creds: Dict[str, str] = Depends(get_parsed_auth)):
    username = creds["username"]
    password = creds["password"]
    if password != ADMIN_PASSWORD:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Admin password required to create questions")
    new_rec = payload.dict()
    QUESTIONS.append({k: (v if v != "" else None) for k, v in new_rec.items()})
    return {"message": "Question created", "question": new_rec}

@app.exception_handler(HTTPException)
def custom_http_exception_handler(request, exc: HTTPException):
    return JSONResponse(status_code=exc.status_code, content={"error": exc.detail})

@app.get("/_doc", include_in_schema=False)
def manual_docs():
    return {
        "endpoints": {
            "GET /": "Health check. No auth.",
            "GET /subjects": "List subjects. Requires auth.",
            "GET /questions?use=&subjects=&count=": "Get questions. Requires auth.",
            "POST /admin/question": "Create new question. Requires Basic username:4dm1N header."
        },
        "auth_scheme": "Pass header Authorization: Basic username:password (not base64 encoded)."
    }