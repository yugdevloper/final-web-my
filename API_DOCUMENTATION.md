# API Documentation - UP Exam Mantra

Base URL: `http://localhost:5000/api` (Development)

## Authentication

All protected endpoints require a Bearer token in the Authorization header:

```
Authorization: Bearer <firebase_id_token>
```

Get the token from Firebase Authentication after login.

## Response Format

### Success Response
```json
{
  "data": {},
  "message": "Success message"
}
```

### Error Response
```json
{
  "error": "Error message"
}
```

## Endpoints

### Health Check

#### GET /api/health

Check if the server is running.

**Authentication:** Not required

**Response:**
```json
{
  "status": "OK",
  "message": "Server is running"
}
```

---

### Exams

#### GET /api/exams

Get all exams.

**Authentication:** Required

**Response:**
```json
[
  {
    "id": "exam123",
    "title": "UPSC Civil Services",
    "createdAt": "2024-01-01T00:00:00.000Z"
  }
]
```

---

### Test Series

#### GET /api/test-series/:examId

Get all test series for a specific exam.

**Authentication:** Required

**Parameters:**
- `examId` (path) - Exam ID

**Response:**
```json
[
  {
    "id": "test123",
    "examId": "exam123",
    "title": "General Studies Mock Test 1",
    "rules": {
      "marksPerQuestion": 2,
      "negativeMark": 0.66,
      "duration": 120
    },
    "createdAt": "2024-01-01T00:00:00.000Z"
  }
]
```

---

### Questions

#### GET /api/questions/:sectionId

Get all questions for a specific section.

**Authentication:** Required

**Parameters:**
- `sectionId` (path) - Section ID

**Response:**
```json
[
  {
    "id": "q123",
    "sectionId": "section123",
    "questionText": "What is the capital of India?",
    "options": ["Mumbai", "Delhi", "Kolkata", "Chennai"],
    "correctAnswer": "Delhi",
    "explanation": "Delhi is the capital of India.",
    "marks": 2,
    "negativeMarks": 0.66
  }
]
```

---

### Attempts

#### POST /api/attempts

Submit a test attempt.

**Authentication:** Required

**Request Body:**
```json
{
  "testSeriesId": "test123",
  "answers": {
    "q123": "Delhi",
    "q124": "Option B",
    "q125": "Option C"
  }
}
```

**Response:**
```json
{
  "id": "attempt123",
  "message": "Attempt submitted successfully"
}
```

---

### Results

#### GET /api/results/user/:userId

Get all results for a specific user.

**Authentication:** Required

**Parameters:**
- `userId` (path) - User ID

**Response:**
```json
[
  {
    "id": "result123",
    "userId": "user123",
    "testSeriesId": "test123",
    "attemptId": "attempt123",
    "score": 45,
    "accuracy": 75.5,
    "correctCount": 20,
    "wrongCount": 5,
    "unattemptedCount": 5,
    "rank": 15,
    "createdAt": "2024-01-01T00:00:00.000Z"
  }
]
```

---

### Leaderboard

#### GET /api/leaderboard/:testSeriesId

Get leaderboard for a specific test series.

**Authentication:** Required

**Parameters:**
- `testSeriesId` (path) - Test Series ID

**Query Parameters:**
- `limit` (optional) - Number of results (default: 100)

**Response:**
```json
[
  {
    "id": "result123",
    "rank": 1,
    "userId": "user123",
    "testSeriesId": "test123",
    "score": 95,
    "accuracy": 95.5,
    "correctCount": 48,
    "wrongCount": 2,
    "unattemptedCount": 0
  }
]
```

---

### Admin - Users

#### GET /api/admin/users

Get all users (Admin only).

**Authentication:** Required (Admin role)

**Response:**
```json
[
  {
    "id": "user123",
    "uid": "firebase_uid",
    "name": "John Doe",
    "email": "john@example.com",
    "gender": "Male",
    "targetedExam": "UPSC Civil Services",
    "role": "User",
    "createdAt": "2024-01-01T00:00:00.000Z"
  }
]
```

**Error Response (403):**
```json
{
  "error": "Forbidden: Admin access required"
}
```

---

### Admin - Statistics

#### GET /api/admin/stats

Get platform statistics (Admin only).

**Authentication:** Required (Admin role)

**Response:**
```json
{
  "totalExams": 10,
  "totalTestSeries": 50,
  "totalQuestions": 2500,
  "totalUsers": 1000,
  "totalAttempts": 5000
}
```

**Error Response (403):**
```json
{
  "error": "Forbidden: Admin access required"
}
```

---

## Error Codes

| Code | Description |
|------|-------------|
| 200 | Success |
| 201 | Created |
| 400 | Bad Request |
| 401 | Unauthorized (No token or invalid token) |
| 403 | Forbidden (Insufficient permissions) |
| 404 | Not Found |
| 500 | Internal Server Error |

## Common Error Responses

### 401 Unauthorized
```json
{
  "error": "No token provided"
}
```

```json
{
  "error": "Unauthorized"
}
```

### 403 Forbidden
```json
{
  "error": "Forbidden: Admin access required"
}
```

### 500 Internal Server Error
```json
{
  "error": "Failed to fetch exams"
}
```

## Rate Limiting

Currently no rate limiting is implemented. For production, implement rate limiting:

```javascript
const rateLimit = require('express-rate-limit')

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100 // limit each IP to 100 requests per windowMs
})

app.use('/api/', limiter)
```

## CORS Configuration

CORS is enabled for all origins in development. For production, configure specific origins:

```javascript
const corsOptions = {
  origin: 'https://your-frontend-domain.com',
  credentials: true
}

app.use(cors(corsOptions))
```

## Authentication Flow

1. User registers/logs in via Firebase Authentication
2. Frontend receives Firebase ID token
3. Token is stored in localStorage
4. Token is sent with every API request in Authorization header
5. Backend verifies token using Firebase Admin SDK
6. If valid, request proceeds; otherwise, 401 error

## Example API Calls

### Using Axios (Frontend)

```javascript
import axios from 'axios'

const api = axios.create({
  baseURL: 'http://localhost:5000/api'
})

// Add token to all requests
api.interceptors.request.use(async (config) => {
  const token = localStorage.getItem('authToken')
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})

// Get exams
const exams = await api.get('/exams')

// Submit attempt
const result = await api.post('/attempts', {
  testSeriesId: 'test123',
  answers: { q1: 'answer1' }
})
```

### Using Fetch

```javascript
const token = localStorage.getItem('authToken')

// Get exams
const response = await fetch('http://localhost:5000/api/exams', {
  headers: {
    'Authorization': `Bearer ${token}`
  }
})
const exams = await response.json()

// Submit attempt
const response = await fetch('http://localhost:5000/api/attempts', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    testSeriesId: 'test123',
    answers: { q1: 'answer1' }
  })
})
const result = await response.json()
```

### Using cURL

```bash
# Get exams
curl -H "Authorization: Bearer YOUR_TOKEN" \
  http://localhost:5000/api/exams

# Submit attempt
curl -X POST \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"testSeriesId":"test123","answers":{"q1":"answer1"}}' \
  http://localhost:5000/api/attempts
```

## Testing the API

### Using Postman

1. Create a new request
2. Set method (GET, POST, etc.)
3. Enter URL: `http://localhost:5000/api/endpoint`
4. Add Authorization header:
   - Key: `Authorization`
   - Value: `Bearer YOUR_TOKEN`
5. For POST requests, add JSON body
6. Send request

### Getting a Test Token

1. Register/login via the frontend
2. Open browser DevTools → Application → Local Storage
3. Copy the `authToken` value
4. Use this token in your API requests

## Database Direct Access

While the API provides all necessary endpoints, you can also access Firestore directly:

```javascript
import { collection, getDocs } from 'firebase/firestore'
import { db } from './firebase'

// Get all exams
const examsSnapshot = await getDocs(collection(db, 'exams'))
const exams = examsSnapshot.docs.map(doc => ({
  id: doc.id,
  ...doc.data()
}))
```

## Security Best Practices

1. Always use HTTPS in production
2. Implement rate limiting
3. Validate all input data
4. Use environment variables for sensitive data
5. Implement proper error handling
6. Log security events
7. Regular security audits
8. Keep dependencies updated

## API Versioning

Currently using v1 (implicit). For future versions:

```
/api/v1/exams
/api/v2/exams
```

## Webhooks (Future Enhancement)

For real-time notifications:

```javascript
POST /api/webhooks/test-completed
POST /api/webhooks/new-user
POST /api/webhooks/result-published
```

## GraphQL Alternative (Future Enhancement)

Consider implementing GraphQL for more flexible queries:

```graphql
query {
  exams {
    id
    title
    testSeries {
      id
      title
      questions {
        id
        questionText
      }
    }
  }
}
```

This API documentation covers all current endpoints and provides examples for integration.
