# Project Structure - UP Exam Mantra

## Complete Directory Tree

```
up-exam-mantra/
├── frontend/                          # React frontend application
│   ├── src/
│   │   ├── components/               # Reusable components
│   │   │   ├── AdminSidebar.jsx     # Admin navigation sidebar
│   │   │   ├── Loader.jsx           # Loading spinner component
│   │   │   └── Modal.jsx            # Reusable modal component
│   │   │
│   │   ├── context/                 # React Context providers
│   │   │   └── AuthContext.jsx     # Authentication context & provider
│   │   │
│   │   ├── pages/                   # Page components
│   │   │   ├── admin/              # Admin panel pages
│   │   │   │   ├── Dashboard.jsx           # Admin dashboard
│   │   │   │   ├── ExamManagement.jsx      # Exam CRUD operations
│   │   │   │   ├── TestSeriesManagement.jsx # Test series CRUD
│   │   │   │   ├── SectionManagement.jsx   # Section CRUD
│   │   │   │   ├── QuestionManagement.jsx  # Question CRUD & JSON upload
│   │   │   │   └── StudentAnalytics.jsx    # Analytics & leaderboard
│   │   │   │
│   │   │   ├── user/               # User panel pages
│   │   │   │   ├── Dashboard.jsx   # User dashboard
│   │   │   │   ├── TakeTest.jsx    # Test taking interface
│   │   │   │   └── TestResult.jsx  # Results & solutions
│   │   │   │
│   │   │   ├── Login.jsx           # Login page
│   │   │   ├── Register.jsx        # Registration page
│   │   │   └── ForgotPassword.jsx  # Password reset page
│   │   │
│   │   ├── routes/                 # Routing configuration
│   │   │   └── ProtectedRoute.jsx  # Route protection HOC
│   │   │
│   │   ├── services/               # External services
│   │   │   ├── firebase.js         # Firebase initialization
│   │   │   └── api.js              # Axios API configuration
│   │   │
│   │   ├── App.jsx                 # Main app component with routes
│   │   ├── main.jsx                # React entry point
│   │   └── index.css               # Global styles
│   │
│   ├── index.html                  # HTML template
│   ├── vite.config.js              # Vite configuration
│   ├── package.json                # Frontend dependencies
│   ├── .env.example                # Environment variables template
│   └── .env                        # Environment variables (gitignored)
│
├── backend/                        # Express backend API
│   ├── server.js                   # Main server file with all routes
│   ├── package.json                # Backend dependencies
│   ├── .env.example                # Environment variables template
│   └── .env                        # Environment variables (gitignored)
│
├── .gitignore                      # Git ignore rules
├── README.md                       # Project overview
├── SETUP_INSTRUCTIONS.md           # Detailed setup guide
├── DEPLOYMENT_GUIDE.md             # Production deployment guide
├── FEATURES.md                     # Complete features list
├── QUICK_START.md                  # Quick start guide
└── PROJECT_STRUCTURE.md            # This file
```

## File Descriptions

### Frontend Files

#### Components

**AdminSidebar.jsx**
- Navigation sidebar for admin panel
- Mobile-responsive with hamburger menu
- Active route highlighting
- Logout functionality
- Profile display

**Loader.jsx**
- Reusable loading spinner
- Animated CSS spinner
- Used across the application

**Modal.jsx**
- Reusable modal dialog
- Customizable title and content
- Confirm/Cancel actions
- Click outside to close
- Used for confirmations and forms

#### Context

**AuthContext.jsx**
- Authentication state management
- User registration function
- Login/logout functions
- Password reset function
- User profile fetching
- Token management
- Auth state persistence

#### Pages - Admin

**Dashboard.jsx**
- Statistics overview
- Total counts for exams, tests, questions, students
- Card-based layout
- Welcome message

**ExamManagement.jsx**
- List all exams
- Add new exam
- Edit exam
- Delete exam
- Modal-based forms

**TestSeriesManagement.jsx**
- Create test series
- Configure rules (marks, negative marking, duration)
- Link to exams
- Edit/delete test series

**SectionManagement.jsx**
- Create sections
- Link to test series
- Section types (Previous Year, Sectional, Full Length)
- Edit/delete sections

**QuestionManagement.jsx**
- Manual question entry
- JSON bulk upload
- Question editing
- Question deletion
- View all questions

**StudentAnalytics.jsx**
- Filter by exam/test
- Leaderboard display
- Rank calculation
- Performance metrics
- Student results

#### Pages - User

**Dashboard.jsx**
- Exam selection
- Test series display
- Profile card
- Start test button
- Bottom navigation

**TakeTest.jsx**
- Question display
- Timer countdown
- Answer selection
- Mark for review
- Question palette
- Navigation controls
- Auto-submit
- Manual submit

**TestResult.jsx**
- Score display
- Performance metrics
- Detailed solutions
- Question-by-question review
- Correct/wrong indicators
- Explanations

#### Pages - Auth

**Login.jsx**
- Email/password login
- Form validation
- Error handling
- Role-based redirect

**Register.jsx**
- User registration form
- Profile fields
- Role selection
- Password confirmation
- Validation

**ForgotPassword.jsx**
- Email input
- Password reset email
- Success message

#### Routes

**ProtectedRoute.jsx**
- Route protection
- Authentication check
- Role-based access
- Redirect logic

#### Services

**firebase.js**
- Firebase initialization
- Auth instance export
- Firestore instance export
- Environment variable configuration

**api.js**
- Axios instance
- Base URL configuration
- Auth token interceptor
- Request/response handling

### Backend Files

**server.js**
- Express server setup
- Firebase Admin initialization
- CORS configuration
- Authentication middleware
- API routes:
  - Health check
  - Exams CRUD
  - Test series CRUD
  - Questions CRUD
  - Attempts submission
  - Results retrieval
  - Leaderboard
  - Admin statistics
- Error handling

### Configuration Files

**vite.config.js**
- Vite build configuration
- React plugin
- Server settings
- Port configuration

**package.json (Frontend)**
- React dependencies
- Firebase SDK
- React Router
- Axios
- Build scripts

**package.json (Backend)**
- Express
- Firebase Admin
- CORS
- dotenv
- Development scripts

### Documentation Files

**README.md**
- Project overview
- Tech stack
- Features summary
- Setup links

**SETUP_INSTRUCTIONS.md**
- Detailed setup guide
- Firebase configuration
- Environment setup
- Troubleshooting
- Security checklist

**DEPLOYMENT_GUIDE.md**
- Production deployment
- Hosting options
- Security hardening
- Performance optimization
- CI/CD setup

**FEATURES.md**
- Complete features list
- Technical features
- User experience features
- Future enhancements

**QUICK_START.md**
- 10-minute setup guide
- Quick commands
- Common issues
- Next steps

## Database Collections (Firestore)

### users
```javascript
{
  uid: string,
  name: string,
  email: string,
  gender: string,
  targetedExam: string,
  role: string, // 'Admin' or 'User'
  createdAt: string
}
```

### exams
```javascript
{
  title: string,
  createdAt: string
}
```

### testSeries
```javascript
{
  examId: string,
  title: string,
  rules: {
    marksPerQuestion: number,
    negativeMark: number,
    duration: number // in minutes
  },
  createdAt: string
}
```

### sections
```javascript
{
  testSeriesId: string,
  title: string // 'Previous Year', 'Sectional', 'Full Length'
}
```

### questions
```javascript
{
  sectionId: string,
  questionText: string,
  options: [string, string, string, string],
  correctAnswer: string,
  explanation: string,
  marks: number,
  negativeMarks: number
}
```

### attempts
```javascript
{
  userId: string,
  testSeriesId: string,
  answers: {
    [questionId]: selectedAnswer
  },
  submittedAt: string
}
```

### results
```javascript
{
  userId: string,
  testSeriesId: string,
  attemptId: string,
  score: number,
  accuracy: number,
  correctCount: number,
  wrongCount: number,
  unattemptedCount: number,
  rank: number,
  createdAt: string
}
```

## API Endpoints

### Public Routes
- `GET /api/health` - Health check

### Protected Routes (Require Authentication)
- `GET /api/exams` - Get all exams
- `GET /api/test-series/:examId` - Get test series by exam
- `GET /api/questions/:sectionId` - Get questions by section
- `POST /api/attempts` - Submit test attempt
- `GET /api/results/user/:userId` - Get user results
- `GET /api/leaderboard/:testSeriesId` - Get leaderboard

### Admin Routes (Require Admin Role)
- `GET /api/admin/users` - Get all users
- `GET /api/admin/stats` - Get statistics

## Environment Variables

### Frontend (.env)
```
VITE_FIREBASE_API_KEY
VITE_FIREBASE_AUTH_DOMAIN
VITE_FIREBASE_PROJECT_ID
VITE_FIREBASE_STORAGE_BUCKET
VITE_FIREBASE_MESSAGING_SENDER_ID
VITE_FIREBASE_APP_ID
VITE_FIREBASE_MEASUREMENT_ID
VITE_API_URL
```

### Backend (.env)
```
PORT
FIREBASE_PROJECT_ID
FIREBASE_CLIENT_EMAIL
FIREBASE_PRIVATE_KEY
```

## Technology Stack

### Frontend
- React 18.2.0
- React Router 6.20.0
- Firebase 10.7.1
- Axios 1.6.2
- Vite 5.0.8

### Backend
- Node.js
- Express 4.18.2
- Firebase Admin 12.0.0
- CORS 2.8.5
- dotenv 16.3.1

### Database
- Firebase Firestore (NoSQL)

### Authentication
- Firebase Authentication

### Hosting Options
- Frontend: Vercel, Netlify, Firebase Hosting
- Backend: Railway, Render, Heroku

## Development Workflow

1. Start backend: `cd backend && npm run dev`
2. Start frontend: `cd frontend && npm run dev`
3. Access at: http://localhost:3000
4. API at: http://localhost:5000

## Build Commands

### Frontend
```bash
cd frontend
npm run build  # Creates dist/ folder
```

### Backend
```bash
cd backend
npm start  # Production mode
```

## Code Organization Principles

- Component-based architecture
- Separation of concerns
- Reusable components
- Context for global state
- Service layer for external APIs
- Protected routes for security
- Environment-based configuration
- Mobile-first responsive design

This structure ensures maintainability, scalability, and ease of development.
