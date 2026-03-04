# 🚀 Backend Setup - UP Exam Mantra

## ✅ Backend Install Ho Raha Hai!

Backend dependencies install ho rahi hain. Yeh 2-3 minute lega.

## 🔥 Important: Firebase Admin Credentials

Backend ko Firebase Admin SDK credentials chahiye. Abhi temporary values hain `.env` file mein.

### Firebase Admin Credentials Kaise Laye:

#### Step 1: Firebase Console Kholen
```
https://console.firebase.google.com/
```

#### Step 2: Project Select Karen
```
mocktestwebsite-1047c
```

#### Step 3: Service Account Key Download Karen

1. **Project Settings** (gear icon) par click karen
2. **Service Accounts** tab par jayen
3. **Generate New Private Key** button dabaye
4. JSON file download hogi
5. File kholen

#### Step 4: Values Copy Karen

Downloaded JSON file mein yeh values hongi:

```json
{
  "type": "service_account",
  "project_id": "mocktestwebsite-1047c",
  "private_key_id": "...",
  "private_key": "-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-xxxxx@mocktestwebsite-1047c.iam.gserviceaccount.com",
  ...
}
```

#### Step 5: Backend .env File Update Karen

`backend/.env` file ko edit karen:

```env
PORT=5000
FIREBASE_PROJECT_ID=mocktestwebsite-1047c
FIREBASE_CLIENT_EMAIL=firebase-adminsdk-xxxxx@mocktestwebsite-1047c.iam.gserviceaccount.com
FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nYour\nActual\nPrivate\nKey\nHere\n-----END PRIVATE KEY-----\n"
```

**Important Notes:**
- `FIREBASE_PRIVATE_KEY` ko quotes mein rakhna hai
- `\n` characters ko preserve karna hai
- Puri private key copy karni hai

## 🎯 Backend Kya Karta Hai:

Backend optional hai for basic features, lekin yeh provide karta hai:

### API Endpoints:
- `GET /api/health` - Server health check
- `GET /api/exams` - Get all exams
- `GET /api/test-series/:examId` - Get test series
- `GET /api/questions/:sectionId` - Get questions
- `POST /api/attempts` - Submit test attempt
- `GET /api/results/user/:userId` - Get user results
- `GET /api/leaderboard/:testSeriesId` - Get leaderboard
- `GET /api/admin/users` - Get all users (Admin only)
- `GET /api/admin/stats` - Get statistics (Admin only)

## 📊 Current Status:

### Frontend: ✅ Running
```
Port: 3000
URL: http://localhost:3000
Status: Active
```

### Backend: ⏳ Installing
```
Port: 5000
URL: http://localhost:5000
Status: Installing dependencies...
```

## 🔍 Backend Kab Chahiye:

### Without Backend (Direct Firebase):
- ✅ Login/Register
- ✅ Create Exams
- ✅ Add Questions
- ✅ Take Tests
- ✅ View Results
- ✅ All Admin Features

Frontend directly Firebase se connect hota hai, toh backend optional hai!

### With Backend (Extra Features):
- ✅ Centralized API
- ✅ Additional validation
- ✅ Server-side logic
- ✅ Better security
- ✅ Rate limiting
- ✅ Logging

## 💡 Recommendation:

**Abhi ke liye backend optional hai!**

App already Firebase se directly kaam kar raha hai. Backend sirf additional features ke liye hai.

### Agar Backend Chahiye:

1. Firebase Admin credentials download karen
2. `backend/.env` file update karen
3. Backend restart karen

### Agar Backend Nahi Chahiye:

App already kaam kar raha hai! Bas:
1. Firebase Authentication enable karen
2. Firestore Database banaye
3. Frontend use karen

## 🚀 Backend Start Hone Par:

Jab backend successfully start hoga, terminal mein dikhega:

```
Server is running on port 5000
```

Tab aap test kar sakte hain:

```
http://localhost:5000/api/health
```

Response:
```json
{
  "status": "OK",
  "message": "Server is running"
}
```

## 🛠️ Backend Commands:

### Start Backend:
```bash
cd backend
npm start
```

### Development Mode (Auto-reload):
```bash
cd backend
npm run dev
```

### Stop Backend:
```
Ctrl + C
```

## 📁 Backend Files:

```
backend/
├── server.js          # Main server file
├── package.json       # Dependencies
├── .env              # Environment variables
└── .env.example      # Example env file
```

## ✅ Success Checklist:

### Frontend (Already Done):
- [x] Dependencies installed
- [x] Server running on port 3000
- [x] Login page visible
- [x] No console errors

### Backend (In Progress):
- [ ] Dependencies installing
- [ ] Firebase Admin credentials configured
- [ ] Server running on port 5000
- [ ] Health check working

### Firebase (Required):
- [ ] Authentication enabled
- [ ] Firestore Database created
- [ ] Security rules set

## 🎯 Next Steps:

### Option 1: Use Without Backend (Recommended for Now)
1. ✅ Frontend already running
2. Enable Firebase Authentication
3. Create Firestore Database
4. Start using the app!

### Option 2: Setup Backend (Optional)
1. Download Firebase Admin credentials
2. Update `backend/.env` file
3. Restart backend
4. Test API endpoints

## 🔥 Firebase Console Setup:

### Step 1: Authentication
```
https://console.firebase.google.com/
→ Select: mocktestwebsite-1047c
→ Authentication
→ Get Started
→ Email/Password → Enable
→ Save
```

### Step 2: Firestore Database
```
→ Firestore Database
→ Create database
→ Production mode
→ Location: asia-south1
→ Enable
```

### Step 3: Security Rules (Optional)
```
→ Firestore Database
→ Rules tab
→ Copy rules from SETUP_INSTRUCTIONS.md
→ Publish
```

## 💻 Current Running Services:

```
┌─────────────────────────────────────┐
│  Service    │  Port  │  Status      │
├─────────────────────────────────────┤
│  Frontend   │  3000  │  ✅ Running  │
│  Backend    │  5000  │  ⏳ Starting │
└─────────────────────────────────────┘
```

## 🆘 Backend Errors?

### Error: Firebase credentials invalid
**Solution:** Update `backend/.env` with correct Firebase Admin credentials

### Error: Port 5000 already in use
**Solution:** 
```bash
# Windows
netstat -ano | findstr :5000
taskkill /PID <PID> /F
```

### Error: Module not found
**Solution:**
```bash
cd backend
rm -rf node_modules
npm install
```

## 📞 Help:

Backend optional hai! App already Firebase se directly kaam kar raha hai.

Agar backend chahiye toh:
1. Firebase Admin credentials download karen
2. `.env` file update karen
3. Backend restart karen

Agar nahi chahiye toh:
1. Frontend use karen (already running)
2. Firebase setup karen
3. Start using!

---

**Current Status:**
- Frontend: ✅ Running (Port 3000)
- Backend: ⏳ Installing (Port 5000)

**Recommendation:** Frontend already kaam kar raha hai! Backend optional hai.

🎉 App use karna shuru karen!
