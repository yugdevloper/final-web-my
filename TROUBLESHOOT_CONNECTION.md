# 🔧 Connection Troubleshooting Guide

## ✅ Good News: Server is Running!

Your Vite dev server is **successfully running** on port 3000!

```
VITE v5.4.21  ready in 2797 ms
➜  Local:   http://localhost:3000/
```

## 🐛 Why "Connection Refused" Error?

This usually happens due to:
1. Browser cache
2. Windows Firewall
3. Antivirus software
4. Browser security settings

## 🚀 Quick Fixes (Try in Order):

### Fix 1: Wait and Refresh (30 seconds)
Sometimes the server needs a moment to fully initialize.
1. Wait 30 seconds
2. Press `Ctrl + F5` (hard refresh)
3. Try again

### Fix 2: Try Different URL
Instead of `http://localhost:3000`, try:
```
http://127.0.0.1:3000
```

### Fix 3: Clear Browser Cache
1. Press `Ctrl + Shift + Delete`
2. Select "Cached images and files"
3. Click "Clear data"
4. Try again

### Fix 4: Try Different Browser
- Chrome
- Firefox
- Edge
- Brave

### Fix 5: Check Windows Firewall
1. Open Windows Security
2. Go to "Firewall & network protection"
3. Click "Allow an app through firewall"
4. Find "Node.js" and make sure it's checked
5. If not there, click "Change settings" → "Allow another app"
6. Browse to Node.js installation (usually `C:\Program Files\nodejs\node.exe`)
7. Add it and check both Private and Public

### Fix 6: Disable Antivirus Temporarily
Some antivirus software blocks localhost connections:
1. Temporarily disable antivirus
2. Try accessing http://localhost:3000
3. If it works, add Node.js to antivirus exceptions

### Fix 7: Check if Port is Actually Open
Open Command Prompt and run:
```bash
netstat -ano | findstr :3000
```

You should see something like:
```
TCP    0.0.0.0:3000    0.0.0.0:0    LISTENING    12345
```

If you see this, the server IS running!

### Fix 8: Test with curl
Open Command Prompt:
```bash
curl http://localhost:3000
```

If you see HTML output, the server is working!

### Fix 9: Restart the Server
1. In the terminal where server is running, press `Ctrl + C`
2. Run: `npm run dev`
3. Wait for "ready" message
4. Try accessing again

### Fix 10: Use the Test File
1. Open `TEST_CONNECTION.html` in your browser
2. Click "Test Connection" button
3. Follow the suggestions

## 🎯 Alternative: Open Test File

I've created a test file for you. Open this file in your browser:
```
TEST_CONNECTION.html
```

This will:
- Show server status
- Test the connection
- Provide direct links to open the app
- Give specific troubleshooting steps

## 📱 What You Should See When It Works:

When you successfully connect, you'll see:

```
┌─────────────────────────────┐
│    UP Exam Mantra           │  (Blue header)
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

## 🔍 Verify Server is Running

Check the terminal where you started the server. You should see:
```
VITE v5.4.21  ready in 2797 ms

➜  Local:   http://localhost:3000/
➜  Network: use --host to expose
➜  press h + enter to show help
```

If you see this, the server IS running!

## 💡 Pro Tips:

1. **Use 127.0.0.1 instead of localhost**
   - Some systems have DNS issues with "localhost"
   - 127.0.0.1 is the direct IP address

2. **Check Browser Console**
   - Press F12
   - Go to Console tab
   - Look for any error messages

3. **Try Incognito/Private Mode**
   - Opens without cache
   - Rules out extension conflicts

4. **Check Network Tab**
   - Press F12
   - Go to Network tab
   - Try to load the page
   - See what's failing

## 🆘 Still Not Working?

### Option A: Use a Different Port
Edit `frontend/vite.config.js`:
```javascript
export default defineConfig({
  plugins: [react()],
  server: {
    port: 3001,  // Change to 3001
    open: true
  }
})
```

Then restart the server.

### Option B: Check Hosts File
1. Open: `C:\Windows\System32\drivers\etc\hosts`
2. Make sure this line exists:
   ```
   127.0.0.1       localhost
   ```

### Option C: Restart Computer
Sometimes Windows networking needs a restart.

## ✅ Success Checklist:

- [ ] Server shows "ready" message in terminal
- [ ] No error messages in terminal
- [ ] Firewall allows Node.js
- [ ] Tried 127.0.0.1:3000
- [ ] Cleared browser cache
- [ ] Tried different browser
- [ ] Opened TEST_CONNECTION.html

## 📞 Next Steps:

Once you can access the app:
1. You'll see the login page
2. Click "Register" to create an account
3. Choose "Admin" role to access admin panel
4. Start creating exams and tests!

## 🔥 Firebase Setup (Don't Forget!):

Even if the app loads, you need Firebase configured:
1. Go to https://console.firebase.google.com/
2. Select: mocktestwebsite-1047c
3. Enable Authentication → Email/Password
4. Create Firestore Database

Without this, login/register won't work!

---

**Server Status:** ✅ Running on port 3000
**Your Task:** Get your browser to connect to it!

Try the fixes above in order. One of them will work! 🚀
