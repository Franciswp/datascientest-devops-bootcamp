MCQ Questions API — short architecture & usage

Overview
--------
This FastAPI application serves multiple-choice questions loaded from the provided Excel dataset (questions_en.xlsx) available at:
https://dst-de.s3.eu-west-3.amazonaws.com/fastapi_en/questions_en.xlsx

Main features
- Health check endpoint (GET /)
- Authenticated listing of subjects (GET /subjects)
- Authenticated retrieval of random questions with filters:
  - GET /questions
  - Query params:
    - use (optional) — exact match on 'use' field
    - subjects (optional) — comma-separated list of subjects
    - count (required) — number of questions to return (allowed values: 5, 10, 20)
- Admin create endpoint to add a new question (POST /admin/question)
  - Authentication header must be `Authorization: Basic username:4dm1N`
  - Username must exist in the user dictionary

Authentication
--------------
The exercise simplified Basic auth: the Authorization header must be exactly "Basic username:password" (no base64 encoding).
Valid users:
- alice : wonderland
- bob : builder
- clementine : mandarine

Admin create password
- Admin password (for creation) is: 4dm1N
  - Header must be: Authorization: Basic <username>:4dm1N

Design choices
--------------
- Single-file FastAPI app for simplicity and ease of testing.
- Data is loaded on startup into an in-memory list. This is suitable for the exercise and small dataset. For production, a persistent database should be used (Postgres, SQLite, etc).
- Filtering is case-insensitive and exact match for `use`. Subject matching uses a case-insensitive equality check for values present in the comma-separated subjects parameter.
- Random selection uses Python's random.sample with shuffle to guarantee random order and uniqueness in returned questions.
- The API returns appropriate status codes and JSON error messages if parameters are invalid or no data matches.

How to run
----------
1. Install dependencies:
   pip install -r requirements.txt

2. Run the app:
   uvicorn main:app --reload --port 8001

3. Test using the included test_commands.sh (or manual curl requests).

Notes and possible improvements
------------------------------
- Persist created questions to disk or a database so they survive restarts.
- Add pagination support for large datasets.
- Improve authentication by using standard Basic auth with base64 encoding and HTTPS in production.
- Add OpenAPI/Swagger docs (FastAPI already provides it at /docs and /redoc).