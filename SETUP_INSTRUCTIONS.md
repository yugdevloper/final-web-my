# UP Exam Mantra - Complete Setup Instructions

## Prerequisites

Before you begin, ensure you have the following installed:
- Node.js (v16 or higher) - [Download](https://nodejs.org/)
- npm (comes with Node.js)
- A Firebase account - [Create one](https://console.firebase.google.com/)

## Step 1: Firebase Project Setup

### 1.1 Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project"
3. Enter project name: "UP Exam Mantra" (or your preferred name)
4. Follow the setup wizard

### 1.2 Enable Authentication

1. In Firebase Console, go to "Authentication"
2. Click "Get Started"
3. Enable "Email/Password" sign-in method
4. Click "Save"

### 1.3 Create Firestore Database

1. In Firebase Console, go to "Firestore Database"
2. Click "Create database"
3. Choose "Start in production mode" (we'll add rules later)
4. Select your preferred location
5. Click "Enable"

### 1.4 Set Firestore Security Rules

Go to "Firestore Database" → "Rules" and paste:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users collection
    match /users/{userId} {
      allow read: if request.auth != null;
      allow write: if request.auth.uid == userId;
    }
    
    // Exams - read by all authenticated, write by admin
    match /exams/{examId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null && 
        get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'Admin';
    }
    
    // Test Series - read by all authenticated, write by admin
    match /testSeries/{testId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null && 
        get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'Admin';
    }
    
    // Sections - read by all authenticated, write by admin
    match /sections/{sectionId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null && 
        get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'Admin';
    }
    
    // Questions - read by all authenticated, write by admin
    match /questions/{questionId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null && 
        get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'Admin';
    }
    
    // Attempts - users can only read/write their own
    match /attempts/{attemptId} {
      allow read: if request.auth != null && resource.data.userId == request.auth.uid;
      allow create: if request.auth != null && request.resource.data.userId == request.auth.uid;
    }
    
    // Results - users can read their own, admin can read all
    match /results/{resultId} {
      allow read: if request.auth != null && 
        (resource.data.userId == request.auth.uid || 
         get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'Admin');
      allow create: if request.auth != null;
    }
  }
}
```

Click "Publish"

### 1.5 Get Firebase Web Configuration

1. In Firebase Console, go to Project Settings (gear icon)
2. Scroll down to "Your apps"
3. Click the web icon (</>)
4. Register your app with a nickname
5. Copy the configuration object - you'll need these values

### 1.6 Get Firebase Admin SDK Credentials

1. In Firebase Console, go to Project Settings → Service Accounts
2. Click "Generate New Private Key"
3. Download the JSON file
4. Keep this file secure - DO NOT commit to Git

## Step 2: Frontend Setup

### 2.1 Navigate to Frontend Directory

```bash
cd frontend
```

### 2.2 Install Dependencies

```bash
npm install
```

### 2.3 Create Environment File

Create a file named `.env` in the `frontend` directory:

```bash
# On Windows
copy .env.example .env

# On Mac/Linux
cp .env.example .env
```

### 2.4 Configure Environment Variables

Open `.env` and fill in your Firebase configuration:

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

Replace with your actual Firebase configuration values.

### 2.5 Run Frontend Development Server

```bash
npm run dev
```

The frontend will start at `http://localhost:3000`

## Step 3: Backend Setup

### 3.1 Navigate to Backend Directory

Open a new terminal window:

```bash
cd backend
```

### 3.2 Install Dependencies

```bash
npm install
```

### 3.3 Create Environment File

```bash
# On Windows
copy .env.example .env

# On Mac/Linux
cp .env.example .env
```

### 3.4 Configure Environment Variables

Open the downloaded Firebase Admin SDK JSON file and copy the values to `.env`:

```env
PORT=5000
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_CLIENT_EMAIL=firebase-adminsdk-xxxxx@your-project.iam.gserviceaccount.com
FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nYour\nPrivate\nKey\nHere\n-----END PRIVATE KEY-----\n"
```

Important: Keep the quotes around FIREBASE_PRIVATE_KEY and ensure the \n characters are preserved.

### 3.5 Run Backend Server

```bash
npm start
```

For development with auto-reload:

```bash
npm run dev
```

The backend will start at `http://localhost:5000`

## Step 4: First Time Usage

### 4.1 Create Admin Account

1. Open `http://localhost:3000` in your browser
2. Click "Register"
3. Fill in the registration form
4. Select "Admin" as the role
5. Complete registration
6. Login with your credentials

### 4.2 Create Sample Data

As an admin:

1. Go to "Exams" and create an exam (e.g., "UPSC Civil Services")
2. Go to "Test Series" and create a test series for that exam
3. Go to "Sections" and create a section (e.g., "General Studies")
4. Go to "Questions" and add questions manually or via JSON

### 4.3 Test as User

1. Logout from admin account
2. Register a new account with "User" role
3. Login and browse available tests
4. Take a test and view results

## Step 5: Production Deployment

### 5.1 Frontend Deployment (Vercel/Netlify)

1. Build the frontend:
```bash
cd frontend
npm run build
```

2. Deploy the `dist` folder to your hosting platform
3. Set environment variables in the hosting platform dashboard
4. Update VITE_API_URL to your production backend URL

### 5.2 Backend Deployment (Heroku/Railway/Render)

1. Push your code to a Git repository
2. Connect to your hosting platform
3. Set environment variables
4. Deploy

### 5.3 Update CORS Settings

In `backend/server.js`, update CORS to allow your production frontend URL:

```javascript
app.use(cors({
  origin: 'https://your-frontend-domain.com'
}))
```

## Troubleshooting

### Issue: Firebase Authentication Error

- Verify your Firebase configuration in `.env`
- Check that Email/Password authentication is enabled in Firebase Console
- Clear browser cache and try again

### Issue: Firestore Permission Denied

- Verify Firestore security rules are properly set
- Ensure user is authenticated
- Check that user role is correctly set in Firestore

### Issue: Backend Connection Error

- Verify backend is running on port 5000
- Check VITE_API_URL in frontend `.env`
- Verify Firebase Admin credentials are correct

### Issue: Questions Not Loading

- Verify questions are created under the correct section
- Check that section belongs to the correct test series
- Verify Firestore security rules allow reading questions

## Support

For issues or questions:
1. Check the troubleshooting section above
2. Review Firebase Console for errors
3. Check browser console for error messages
4. Verify all environment variables are set correctly

## Security Checklist

- [ ] Never commit `.env` files to Git
- [ ] Keep Firebase Admin SDK credentials secure
- [ ] Use environment variables for all sensitive data
- [ ] Enable Firestore security rules
- [ ] Use HTTPS in production
- [ ] Implement rate limiting for production
- [ ] Regular security audits

## Next Steps

1. Customize the UI to match your branding
2. Add more exam categories
3. Implement email notifications
4. Add payment integration (if needed)
5. Implement advanced analytics
6. Add social login options
7. Create mobile apps using React Native

Congratulations! Your UP Exam Mantra platform is now ready to use! 🎉
