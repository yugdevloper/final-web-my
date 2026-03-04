# 🚀 Backend Server Kaise Chalaye - Complete Guide

## ⚠️ Important: Backend Optional Hai!

App already Firebase se directly kaam kar raha hai. Backend sirf additional API layer hai.

## 🔥 Backend Setup - Step by Step

### Step 1: Firebase Admin Credentials Download Karen

1. **Firebase Console kholen:**
   ```
   https://console.firebase.google.com/
   ```

2. **Project select karen:**
   ```
   mocktestwebsite-1047c
   ```

3. **Service Account Key download karen:**
   - Click on **⚙️ (Settings/Gear icon)** top left
   - Click **"Project settings"**
   - Click **"Service accounts"** tab
   - Click **"Generate new private key"** button
   - Confirm par click karen
   - JSON file download hogi

4. **JSON file kholen:**
   - Downloaded file ko notepad mein kholen
   - Yeh values dikhenge:

```json
{
  "type": "service_account",
  "project_id": "mocktestwebsite-1047c",
  "private_key_id": "abc123...",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBg...\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-xxxxx@mocktestwebsite-1047c.iam.gserviceaccount.com",
  "client_id": "123456789",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  ...
}
```

### Step 2: Backend .env File Update Karen

1. **File kholen:**
   ```
   backend/.env
   ```

2. **Values update karen:**

```env
PORT=5000
FIREBASE_PROJECT_ID=mocktestwebsite-1047c
FIREBASE_CLIENT_EMAIL=firebase-adminsdk-xxxxx@mocktestwebsite-1047c.iam.gserviceaccount.com
FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBg...\n-----END PRIVATE KEY-----\n"
```

**Important Notes:**
- `FIREBASE_CLIENT_EMAIL` - JSON file se "client_email" copy karen
- `FIREBASE_PRIVATE_KEY` - JSON file se "private_key" copy karen
- Private key ko **quotes mein** rakhna hai
- `\n` characters ko preserve karna hai (delete mat karna)

### Step 3: Backend Start Karen

**Terminal kholen aur run karen:**

```bash
cd backend
npm start
```

**Success message dikhega:**
```
Server is running on port 5000
```

### Step 4: Test Karen

**Browser mein kholen:**
```
http://localhost:5000/api/health
```

**Response dikhega:**
```json
{
  "status": "OK",
  "message": "Server is running"
}
```

## 🎯 Backend API Endpoints:

### Public Endpoints:
```
GET  /api/health                    - Health check
```

### Protected Endpoints (Auth Required):
```
GET  /api/exams                     - Get all exams
GET  /api/test-series/:examId       - Get test series by exam
GET  /api/questions/:sectionId      - Get questions by section
POST /api/attempts                  - Submit test attempt
GET  /api/results/user/:userId      - Get user results
GET  /api/leaderboard/:testSeriesId - Get leaderboard
```

### Admin Endpoints (Admin Role Required):
```
GET  /api/admin/users               - Get all users
GET  /api/admin/stats               - Get statistics
```

## 🔍 Backend Kaise Test Karen:

### Method 1: Browser
```
http://localhost:5000/api/health
```

### Method 2: Command Line (curl)
```bash
curl http://localhost:5000/api/health
```

### Method 3: Postman
1. Postman kholen
2. New Request banaye
3. GET method select karen
4. URL: `http://localhost:5000/api/health`
5. Send button dabaye

## 📊 Current Services:

```
┌─────────────────────────────────────┐
│  Service    │  Port  │  Status      │
├─────────────────────────────────────┤
│  Frontend   │  3000  │  ✅ Running  │
│  Backend    │  5000  │  ⏳ Setup    │
│  Firebase   │  Cloud │  ✅ Enabled  │
└─────────────────────────────────────┘
```

## 🐛 Common Errors & Solutions:

### Error 1: "Failed to parse private key"
```
FirebaseAppError: Failed to parse private key
```

**Solution:**
- Private key ko properly copy karen
- Quotes mein rakhna hai
- `\n` characters preserve karne hain
- Puri key copy karni hai (BEGIN se END tak)

**Correct Format:**
```env
FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBg...\n-----END PRIVATE KEY-----\n"
```

### Error 2: "Port 5000 already in use"
```
Error: listen EADDRINUSE: address already in use :::5000
```

**Solution:**
```bash
# Windows
netstat -ano | findstr :5000
taskkill /PID <PID_NUMBER> /F

# Ya port change karen
# backend/.env mein:
PORT=5001
```

### Error 3: "Module not found"
```
Error: Cannot find module 'express'
```

**Solution:**
```bash
cd backend
rm -rf node_modules
npm install
npm start
```

### Error 4: "FIREBASE_PROJECT_ID is not defined"
```
Error: FIREBASE_PROJECT_ID is not defined
```

**Solution:**
- `.env` file backend folder mein hai?
- Values sahi hain?
- Quotes properly lagaye hain?

## 💡 Backend Kab Chahiye:

### WITHOUT Backend (Current - Working):
- ✅ Frontend directly Firebase se connect
- ✅ All features working
- ✅ Authentication working
- ✅ Database operations working
- ✅ No backend needed!

### WITH Backend (Optional):
- ✅ Centralized API
- ✅ Additional validation
- ✅ Server-side logic
- ✅ Rate limiting
- ✅ Logging
- ✅ Custom endpoints

## 🎯 Recommendation:

**Backend optional hai!**

Agar app already kaam kar raha hai (jo ki kar raha hai), toh backend ki zarurat nahi hai.

Backend sirf tab setup karen jab:
1. Custom API endpoints chahiye
2. Server-side validation chahiye
3. Rate limiting chahiye
4. Advanced features chahiye

## 📝 Quick Commands:

### Start Backend:
```bash
cd backend
npm start
```

### Stop Backend:
```
Ctrl + C
```

### Restart Backend:
```bash
Ctrl + C
npm start
```

### Development Mode (Auto-reload):
```bash
npm run dev
```

### Check if Running:
```bash
curl http://localhost:5000/api/health
```

## ✅ Success Checklist:

- [ ] Firebase Admin credentials downloaded
- [ ] JSON file khola
- [ ] `backend/.env` file updated
- [ ] `FIREBASE_CLIENT_EMAIL` copied
- [ ] `FIREBASE_PRIVATE_KEY` copied (with quotes)
- [ ] Backend started (`npm start`)
- [ ] "Server is running" message dikha
- [ ] Health check working (`/api/health`)

## 🔄 Alternative: Backend Bina Chalaye

Agar backend setup nahi karna chahte:

**App already fully working hai!**

Frontend directly Firebase se connect hai, toh:
- ✅ Login/Register kaam karega
- ✅ Exams create kar sakte hain
- ✅ Questions add kar sakte hain
- ✅ Tests le sakte hain
- ✅ Results dekh sakte hain

Backend optional hai - skip kar sakte hain!

## 📞 Help:

### Backend chahiye?
- Firebase Admin credentials download karen
- `.env` file update karen
- `npm start` karen

### Backend nahi chahiye?
- Skip karen!
- App already kaam kar raha hai
- Frontend use karen

---

**Current Status:**
- Frontend: ✅ Working (Port 3000)
- Backend: ⏳ Optional (needs Firebase Admin setup)

**Recommendation:** Backend optional hai. Pehle app use karen, baad mein backend setup kar lena agar zarurat padi.

🚀 App already ready hai! Backend optional hai!
