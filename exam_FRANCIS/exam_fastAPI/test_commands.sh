#!/usr/bin/env bash
# Start the server (in one terminal):
# uvicorn main:app --reload --port 8001

BASE_URL="http://127.0.0.1:8001"

echo "Health check"
curl -s "$BASE_URL/" | jq

echo
echo "Try to list subjects without auth (should fail)"
curl -s "$BASE_URL/subjects" | jq

echo
echo "List subjects with auth (alice:wonderland)"
curl -s -H "Authorization: Basic alice:wonderland" "$BASE_URL/subjects" | jq

echo
echo "Get 5 questions for use=exam and subject=mathematics (example)"
curl -s -H "Authorization: Basic alice:wonderland" \
  "$BASE_URL/questions?use=exam&subjects=mathematics&count=5" | jq

echo
echo "Get 10 questions across subjects math,history (example)"
curl -s -H "Authorization: Basic bob:builder" \
  "$BASE_URL/questions?subjects=mathematics,history&count=10" | jq

echo
echo "Create a new question as admin (username must exist; password must be 4dm1N)"
curl -s -X POST -H "Content-Type: application/json" \
  -H "Authorization: Basic alice:4dm1N" \
  -d '{
    "question": "Sample Q?",
    "subject": "sample",
    "correct": "A",
    "use": "practice",
    "answerA": "Option A",
    "answerB": "Option B",
    "answerC": "Option C",
    "answerD": "Option D"
  }' \
  "$BASE_URL/admin/question" | jq