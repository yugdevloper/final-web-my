# 🔧 Blank Page Fix - UP Exam Mantra

## समस्या: Website पर blank page आ रहा है

## ✅ तुरंत करें:

### Step 1: Browser Console Check करें

1. **F12 दबाएं** (या Right Click → Inspect)
2. **Console tab** पर जाएं
3. कोई **red error** दिख रहा है?

### Common Errors और उनके Solutions:

#### Error 1: Firebase Configuration Error
```
Firebase: Error (auth/invalid-api-key)
```

**Solution:**
```bash
# frontend/.env file check करें
# सभी values सही हैं?
```

#### Error 2: Module Not Found
```
Failed to resolve module
```

**Solution:**
```bash
cd frontend
rm -rf node_modules
npm install
```

#### Error 3: CORS Error
```
Access to fetch blocked by CORS policy
```

**Solution:** Backend चालू नहीं है, पर frontend अभी बिना backend के भी काम करेगा

## 🚀 Quick Test:

### Test 1: Simple HTML Page
Open in browser:
```
http://localhost:3000/test.html
```

अगर यह page दिख रहा है, तो server सही काम कर रहा है!

### Test 2: Check Network Tab
1. F12 दबाएं
2. Network tab पर जाएं
3. Page reload करें (Ctrl+R)
4. कोई failed requests (red) हैं?

### Test 3: Check if React is Loading
Browser console में type करें:
```javascript
console.log('React loaded:', typeof React !== 'undefined')
```

## 🔍 Main Causes (मुख्य कारण):

### 1. Firebase Configuration Issue
**Check:** `frontend/.env` file exists और सही values हैं

**Fix:**
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

### 2. JavaScript Error
**Check:** Browser console में error है?

**Fix:** Error message share करें

### 3. Loading State Stuck
**Check:** "Loading..." text दिख रहा है?

**Fix:** मैंने AuthContext update कर दिया है, server restart करें

### 4. Build Issue
**Check:** Terminal में कोई error?

**Fix:**
```bash
cd frontend
npm run dev
```

## 🛠️ Complete Fix Steps:

### Method 1: Restart Everything
```bash
# Terminal में Ctrl+C दबाएं
# फिर:
cd frontend
npm run dev
```

### Method 2: Clear Cache
```bash
# Browser में:
Ctrl + Shift + Delete
# "Cached images and files" select करें
# Clear data
```

### Method 3: Fresh Install
```bash
cd frontend
rm -rf node_modules
rm package-lock.json
npm install
npm run dev
```

## 📱 What You Should See:

जब सब सही होगा, आपको दिखेगा:

```
┌─────────────────────────────┐
│    UP Exam Mantra           │  ← Blue header
│    Login to your account    │
│                             │
│  Email: [____________]      │
│  Password: [____________]   │
│                             │
│  [      Login      ]        │
│                             │
│  Forgot Password?           │
│  Don't have account?        │
│  Register                   │
└─────────────────────────────┘
```

## 🐛 Debug Commands:

### Check if server is running:
```bash
curl http://localhost:3000
```

### Check if files exist:
```bash
dir frontend\src\App.jsx
dir frontend\src\main.jsx
dir frontend\.env
```

### Check terminal output:
Terminal में कोई error message है?

## ✅ Checklist:

- [ ] Server running (terminal में "ready" message)
- [ ] .env file exists in frontend folder
- [ ] Browser console में no errors
- [ ] F12 → Console → No red errors
- [ ] F12 → Network → Files loading
- [ ] Test page works (http://localhost:3000/test.html)

## 🎯 Next Action:

1. **F12 दबाएं**
2. **Console tab** खोलें
3. **Error message** देखें
4. **Screenshot** लें या error copy करें
5. Error share करें for exact fix

## 💡 Pro Tip:

अगर console में यह error है:
```
Firebase: Error (auth/...)
```

तो Firebase Console में जाकर:
1. Authentication enable करें
2. Firestore Database बनाएं

## 🔄 Server Restart:

Terminal में:
```bash
Ctrl + C  (server stop)
npm run dev  (server start)
```

Wait for:
```
VITE v5.4.21  ready in XXX ms
➜  Local:   http://localhost:3000/
```

Then refresh browser!

---

**अभी करें:**
1. F12 दबाएं
2. Console check करें
3. Error message share करें
4. मैं exact solution दूंगा!

🚀 Let's fix this!
