# UP Exam Mantra - Online Competitive Exam Mock Test Platform

🎓 A complete production-ready full-stack mobile-first web application for competitive exam preparation.

[![React](https://img.shields.io/badge/React-18.2.0-blue.svg)](https://reactjs.org/)
[![Node.js](https://img.shields.io/badge/Node.js-16+-green.svg)](https://nodejs.org/)
[![Firebase](https://img.shields.io/badge/Firebase-10.7.1-orange.svg)](https://firebase.google.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 🌟 Overview

UP Exam Mantra is a comprehensive online mock test platform designed for competitive exam preparation. It features a complete admin panel for managing exams, test series, and questions, along with a user-friendly interface for students to take tests and track their performance.

## ✨ Key Features

### 👨‍💼 Admin Panel
- **Exam Management** - Create and manage multiple exam categories
- **Test Series** - Configure test rules (marks, negative marking, duration)
- **Section Management** - Organize questions into sections
- **Question Bank** - Add questions manually or via JSON bulk upload
- **Analytics Dashboard** - View student performance and leaderboards
- **Real-time Updates** - All changes reflect instantly

### 👨‍🎓 User Panel
- **Browse Exams** - View available exams and test series
- **Take Tests** - Interactive test-taking interface with timer
- **Mark for Review** - Flag questions for later review
- **Auto-submit** - Automatic submission when time expires
- **Detailed Results** - View scores, accuracy, and solutions
- **Performance Tracking** - Track progress over time

### 🔐 Security Features
- Role-based access control (Admin/User)
- Firebase Authentication
- Environment variable configuration
- Firestore security rules
- Token-based API authentication

### 📱 Mobile-First Design
- Fully responsive interface
- Touch-friendly controls
- Optimized for all screen sizes
- Progressive Web App ready

## 🛠️ Tech Stack

### Frontend
- **React.js 18.2** - UI library
- **Vite** - Build tool
- **React Router 6** - Navigation
- **Context API** - State management
- **Firebase SDK** - Authentication & Database
- **Axios** - HTTP client

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **Firebase Admin SDK** - Server-side Firebase
- **REST API** - API architecture

### Database & Auth
- **Firebase Firestore** - NoSQL database
- **Firebase Authentication** - User authentication

## 📁 Project Structure

```
up-exam-mantra/
├── frontend/              # React application
│   ├── src/
│   │   ├── components/   # Reusable components
│   │   ├── context/      # React Context
│   │   ├── pages/        # Page components
│   │   ├── routes/       # Route configuration
│   │   └── services/     # External services
│   └── package.json
│
├── backend/              # Express API
│   ├── server.js        # Main server file
│   └── package.json
│
└── Documentation files
```

## 🚀 Quick Start

### Prerequisites
- Node.js (v16 or higher)
- npm or yarn
- Firebase account

### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd up-exam-mantra
```

2. **Setup Frontend**
```bash
cd frontend
npm install
cp .env.example .env
# Edit .env with your Firebase config
npm run dev
```

3. **Setup Backend**
```bash
cd backend
npm install
cp .env.example .env
# Edit .env with your Firebase Admin credentials
npm start
```

4. **Access the application**
- Frontend: http://localhost:3000
- Backend: http://localhost:5000

For detailed setup instructions, see [SETUP_INSTRUCTIONS.md](SETUP_INSTRUCTIONS.md)

For a quick 10-minute setup, see [QUICK_START.md](QUICK_START.md)

## 📚 Documentation

- **[Setup Instructions](SETUP_INSTRUCTIONS.md)** - Detailed setup guide
- **[Quick Start Guide](QUICK_START.md)** - Get started in 10 minutes
- **[Features Documentation](FEATURES.md)** - Complete features list
- **[API Documentation](API_DOCUMENTATION.md)** - API endpoints and usage
- **[Deployment Guide](DEPLOYMENT_GUIDE.md)** - Production deployment
- **[Project Structure](PROJECT_STRUCTURE.md)** - Code organization

## 🎯 Usage

### Creating Your First Test

1. **Register as Admin**
   - Go to registration page
   - Select "Admin" role
   - Complete registration

2. **Create Exam**
   - Login to admin panel
   - Navigate to "Exams"
   - Add new exam (e.g., "UPSC Civil Services")

3. **Create Test Series**
   - Go to "Test Series"
   - Select exam
   - Configure rules (marks, negative marking, duration)

4. **Add Sections**
   - Go to "Sections"
   - Create section (e.g., "General Studies")

5. **Add Questions**
   - Go to "Questions"
   - Add manually or upload JSON
   - JSON format:
   ```json
   [
     {
       "questionText": "What is 2+2?",
       "options": ["1","2","3","4"],
       "correctAnswer": "4",
       "explanation": "2+2=4",
       "marks": 1,
       "negativeMarks": 0.25
     }
   ]
   ```

### Taking a Test (User)

1. Register as User
2. Login to dashboard
3. Select exam and test
4. Click "Start Test"
5. Answer questions
6. Submit or wait for auto-submit
7. View detailed results

## 🌐 Deployment

### Frontend (Vercel/Netlify)
```bash
cd frontend
npm run build
# Deploy dist/ folder
```

### Backend (Railway/Render/Heroku)
```bash
cd backend
# Push to Git and connect to hosting platform
```

See [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) for detailed instructions.

## 🔒 Security

- ✅ Environment variables for sensitive data
- ✅ Firebase Authentication
- ✅ Firestore security rules
- ✅ Role-based access control
- ✅ Token-based API authentication
- ✅ Input validation
- ✅ XSS protection

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- Firebase for backend infrastructure
- React team for the amazing framework
- Vite for blazing fast builds

## 📧 Support

For issues or questions:
- Check [SETUP_INSTRUCTIONS.md](SETUP_INSTRUCTIONS.md) troubleshooting section
- Review [API_DOCUMENTATION.md](API_DOCUMENTATION.md)
- Check browser console for errors
- Verify Firebase configuration

## 🎉 Features Highlights

- ✅ Complete authentication system
- ✅ Role-based access control
- ✅ Real-time timer with auto-submit
- ✅ Question palette with status indicators
- ✅ Mark for review functionality
- ✅ Detailed solutions with explanations
- ✅ Performance analytics
- ✅ Leaderboard with rankings
- ✅ JSON bulk upload for questions
- ✅ Mobile-first responsive design
- ✅ Production-ready code
- ✅ Comprehensive documentation

## 🚀 Future Enhancements

- Email notifications
- Payment integration
- Certificate generation
- Advanced analytics
- Mobile apps (React Native)
- Dark mode
- Multiple languages
- AI-powered recommendations

---

Made with ❤️ for students preparing for competitive exams

**Star ⭐ this repository if you find it helpful!**
