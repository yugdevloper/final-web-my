# How to Run UP Exam Mantra - Step by Step

## ⚡ Quick Commands

### First Time Setup

```bash
# 1. Setup Frontend
cd frontend
npm install
cp .env.example .env
# Edit .env with your Firebase config
npm run dev

# 2. Setup Backend (in new terminal)
cd backend
npm install
cp .env.example .env
# Edit .env with Firebase Admin credentials
npm start
```

### Daily Development

```bash
# Terminal 1 - Frontend
cd frontend
npm run dev

# Terminal 2 - Backend
cd backend
npm run dev
```

## 📋 Prerequisites Checklist

Before you start, make sure you have:

- [ ] Node.js installed (v16+) - Check with `node --version`
- [ ] npm installed - Check with `npm --version`
- [ ] Firebase account created
- [ ] Firebase project created
- [ ] Email/Password authentication enabled in Firebase
- [ ] Firestore database created
- [ ] Firebase web config copied
- [ ] Firebase Admin SDK key downloaded

## 🔥 Firebase Configuration

### Get Firebase Web Config

1. Go to https://console.firebase.google.com/
2. Select your project
3. Click gear icon → Project Settings
4. Scroll to "Your apps" section
5. Click web icon (</>)
6. Copy the config object

### Get Firebase Admin Credentials

1. Go to Project Settings → Service Accounts
2. Click "Generate New Private Key"
3. Download the JSON file
4. Extract these values:
   - `project_id`
   - `client_email`
   - `private_key`

## 📝 Environment Setup

### Frontend .env

Create `frontend/.env`:

```env
VITE_FIREBASE_API_KEY=AIzaSyAnB9ykXTjFhsNwRlP7JUKpzI7wfCj3C1c
VITE_FIREBASE_AUTH_DOMAIN=mocktestwebsite-1047c.firebaseapp.com
VITE_FIREBASE_PROJECT_ID=mocktestwebsite-1047c
VITE_FIREBASE_STORAGE_BUCKET=mocktestwebsite-1047c.firebasestorage.app
VITE_FIREBASE_MESSAGING_SENDER_ID=240843988779
VITE_FIREBASE_APP_ID=1:240843988779:web:3cc93220988deb92462f6e
VITE_FIREBASE_MEASUREMENT_ID=G-PYW89DLP7M
VITE_API_URL=http://localhost:5000/api
```

### Backend .env

Create `backend/.env`:

```env
PORT=5000
FIREBASE_PROJECT_ID=mocktestwebsite-1047c
FIREBASE_CLIENT_EMAIL=firebase-adminsdk-xxxxx@mocktestwebsite-1047c.iam.gserviceaccount.com
FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nYour\nKey\nHere\n-----END PRIVATE KEY-----\n"
```

## 🚀 Running the Application

### Step 1: Start Backend

```bash
cd backend
npm start
```

You should see:
```
Server is running on port 5000
```

### Step 2: Start Frontend

Open a new terminal:

```bash
cd frontend
npm run dev
```

You should see:
```
  VITE v5.0.8  ready in 500 ms

  ➜  Local:   http://localhost:3000/
  ➜  Network: use --host to expose
```

### Step 3: Open Browser

Navigate to: http://localhost:3000

## 🎯 First Time Usage

### 1. Create Admin Account

1. Click "Register"
2. Fill in details:
   - Name: Your Name
   - Email: admin@example.com
   - Password: admin123 (or stronger)
   - Gender: Select
   - Targeted Exam: Select any
   - Role: **Admin** (Important!)
3. Click "Register"
4. Go back to login
5. Login with your credentials

### 2. Create Sample Data

#### Create Exam
1. Go to "Exams" from sidebar
2. Click "+ Add Exam"
3. Enter: "UPSC Civil Services"
4. Click "Save"

#### Create Test Series
1. Go to "Test Series"
2. Click "+ Add Test Series"
3. Fill in:
   - Exam: UPSC Civil Services
   - Title: General Studies Mock Test 1
   - Marks Per Question: 2
   - Negative Marking: 0.66
   - Duration: 120 (minutes)
4. Click "Save"

#### Create Section
1. Go to "Sections"
2. Click "+ Add Section"
3. Fill in:
   - Test Series: General Studies Mock Test 1
   - Title: Previous Year Questions
4. Click "Save"

#### Add Questions

**Option 1: Manual Entry**
1. Go to "Questions"
2. Click "+ Add Question"
3. Fill in all fields
4. Click "Save"

**Option 2: JSON Upload**
1. Go to "Questions"
2. Click "📄 Upload JSON"
3. Select section
4. Paste this JSON:

```json
[
  {
    "questionText": "Who is known as the Father of the Nation in India?",
    "options": ["Jawaharlal Nehru", "Mahatma Gandhi", "Sardar Patel", "Subhas Chandra Bose"],
    "correctAnswer": "Mahatma Gandhi",
    "explanation": "Mahatma Gandhi is known as the Father of the Nation in India.",
    "marks": 2,
    "negativeMarks": 0.66
  },
  {
    "questionText": "What is the capital of India?",
    "options": ["Mumbai", "Delhi", "Kolkata", "Chennai"],
    "correctAnswer": "Delhi",
    "explanation": "Delhi is the capital of India.",
    "marks": 2,
    "negativeMarks": 0.66
  },
  {
    "questionText": "In which year did India gain independence?",
    "options": ["1945", "1946", "1947", "1948"],
    "correctAnswer": "1947",
    "explanation": "India gained independence on August 15, 1947.",
    "marks": 2,
    "negativeMarks": 0.66
  }
]
```

5. Click "Upload"

### 3. Test as User

1. Logout from admin account
2. Click "Register"
3. Create user account (Role: User)
4. Login
5. You'll see the dashboard with available tests
6. Click "Start Test"
7. Answer questions
8. Submit test
9. View results

## 🐛 Troubleshooting

### Port Already in Use

**Error:** `Port 3000 is already in use`

**Solution:**
```bash
# Windows
netstat -ano | findstr :3000
taskkill /PID <PID> /F

# Mac/Linux
lsof -ti:3000 | xargs kill -9
```

Or change port in `frontend/vite.config.js`:
```javascript
server: {
  port: 3001
}
```

### Firebase Connection Error

**Error:** `Firebase: Error (auth/invalid-api-key)`

**Solution:**
- Check your `.env` file
- Verify all Firebase config values are correct
- Ensure no extra spaces or quotes
- Restart the dev server

### Backend Not Connecting

**Error:** `Network Error` or `ERR_CONNECTION_REFUSED`

**Solution:**
- Check backend is running on port 5000
- Verify `VITE_API_URL` in frontend `.env`
- Check backend terminal for errors
- Verify Firebase Admin credentials

### Questions Not Loading

**Solution:**
- Verify questions are added to correct section
- Check section belongs to correct test series
- Check browser console for errors
- Verify Firestore security rules are set

### Authentication Issues

**Solution:**
- Clear browser cache and cookies
- Check Firebase Authentication is enabled
- Verify Email/Password provider is enabled
- Check browser console for errors

## 📱 Testing on Mobile

### Local Network Testing

1. Find your computer's IP address:
```bash
# Windows
ipconfig

# Mac/Linux
ifconfig
```

2. Update `frontend/vite.config.js`:
```javascript
server: {
  host: '0.0.0.0',
  port: 3000
}
```

3. Access from mobile: `http://YOUR_IP:3000`

## 🔄 Restarting Services

### Restart Frontend
```bash
# Press Ctrl+C in frontend terminal
# Then run:
npm run dev
```

### Restart Backend
```bash
# Press Ctrl+C in backend terminal
# Then run:
npm start
```

### Clean Restart
```bash
# Frontend
cd frontend
rm -rf node_modules
npm install
npm run dev

# Backend
cd backend
rm -rf node_modules
npm install
npm start
```

## 📊 Checking if Everything Works

### Backend Health Check

Open browser: http://localhost:5000/api/health

Should see:
```json
{
  "status": "OK",
  "message": "Server is running"
}
```

### Frontend Check

Open browser: http://localhost:3000

Should see the login page.

### Database Check

1. Go to Firebase Console
2. Click Firestore Database
3. You should see collections: users, exams, testSeries, etc.

## 🎓 Learning Path

1. **Day 1:** Setup and create admin account
2. **Day 2:** Create exams and test series
3. **Day 3:** Add questions (manual and JSON)
4. **Day 4:** Test as user, take tests
5. **Day 5:** Explore analytics and results
6. **Day 6:** Customize UI and features
7. **Day 7:** Deploy to production

## 📚 Next Steps

After successfully running locally:

1. Read [FEATURES.md](FEATURES.md) - Understand all features
2. Read [API_DOCUMENTATION.md](API_DOCUMENTATION.md) - Learn the API
3. Read [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) - Deploy to production
4. Customize the platform for your needs
5. Add more exams and questions
6. Invite users to test

## 💡 Tips

- Keep both terminals open while developing
- Use browser DevTools to debug issues
- Check Firebase Console for database changes
- Use Postman to test API endpoints
- Read error messages carefully
- Check all documentation files

## 🆘 Getting Help

If you're stuck:

1. Check error message in terminal
2. Check browser console (F12)
3. Review [SETUP_INSTRUCTIONS.md](SETUP_INSTRUCTIONS.md)
4. Check [API_DOCUMENTATION.md](API_DOCUMENTATION.md)
5. Verify Firebase configuration
6. Ensure all dependencies are installed

## ✅ Success Checklist

- [ ] Node.js and npm installed
- [ ] Firebase project created
- [ ] Frontend dependencies installed
- [ ] Backend dependencies installed
- [ ] Environment variables configured
- [ ] Frontend running on port 3000
- [ ] Backend running on port 5000
- [ ] Can access login page
- [ ] Can register admin account
- [ ] Can create exam
- [ ] Can create test series
- [ ] Can add questions
- [ ] Can register user account
- [ ] Can take test
- [ ] Can view results

Congratulations! You're now running UP Exam Mantra successfully! 🎉

For production deployment, see [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)
