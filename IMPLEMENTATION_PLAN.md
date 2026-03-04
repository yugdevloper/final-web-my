# UP Exam Mantra - Dynamic Hierarchical Implementation Plan

## Architecture Overview

### Hierarchy Structure
```
Test Series (Root Level)
  ├── Section 1
  │   ├── Test 1
  │   │   ├── Question 1
  │   │   ├── Question 2
  │   │   └── ...
  │   └── Test 2
  └── Section 2
      └── ...
```

### Firestore Structure
```
testSeries/ (collection)
  └── {seriesId}/ (document)
      ├── title
      ├── description
      ├── category
      ├── status (active/draft)
      ├── createdAt
      └── sections/ (subcollection)
          └── {sectionId}/ (document)
              ├── sectionTitle
              ├── description
              ├── order
              ├── createdAt
              └── tests/ (subcollection)
                  └── {testId}/ (document)
                      ├── testTitle
                      ├── totalQuestions
                      ├── duration
                      ├── marksPerQuestion
                      ├── negativeMarking
                      ├── instructions
                      ├── status
                      ├── createdAt
                      └── questions/ (subcollection)
                          └── {questionId}/ (document)
                              ├── questionText
                              ├── options[]
                              ├── correctAnswer
                              ├── explanation
                              ├── marks
                              ├── negativeMarks
                              └── order
```

## Implementation Steps

1. ✅ Backend API Routes & Controllers
2. ✅ Admin Pages (CRUD for each level)
3. ✅ User Panel (Dynamic rendering)
4. ✅ Security Rules
5. ✅ Real-time Updates

## Files to Create/Update

### Backend
- `backend/controllers/testSeriesController.js`
- `backend/controllers/sectionController.js`
- `backend/controllers/testController.js`
- `backend/controllers/questionController.js`
- `backend/routes/testSeries.js`
- `backend/routes/sections.js`
- `backend/routes/tests.js`
- `backend/routes/questions.js`
- `backend/middleware/auth.js`
- `backend/middleware/validation.js`

### Frontend - Admin
- `frontend/src/pages/admin/TestSeriesManagement.jsx` (Update)
- `frontend/src/pages/admin/SectionManagement.jsx` (Update)
- `frontend/src/pages/admin/TestManagement.jsx` (New)
- `frontend/src/pages/admin/QuestionManagement.jsx` (Update)
- `frontend/src/components/AdminSidebar.jsx` (Update)

### Frontend - User
- `frontend/src/pages/user/Dashboard.jsx` (Update)
- `frontend/src/pages/user/TestSeriesList.jsx` (New)
- `frontend/src/pages/user/SectionsList.jsx` (New)
- `frontend/src/pages/user/TestsList.jsx` (New)
- `frontend/src/pages/user/TakeTest.jsx` (Update)

### Context & Services
- `frontend/src/context/TestSeriesContext.jsx` (New)
- `frontend/src/services/testSeriesService.js` (New)

### Security
- `firestore.rules` (New)

Starting implementation...
