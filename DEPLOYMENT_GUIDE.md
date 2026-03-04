# Deployment Guide - UP Exam Mantra

## Overview

This guide covers deploying the UP Exam Mantra application to production environments.

## Deployment Options

### Frontend Deployment

#### Option 1: Vercel (Recommended)

1. Install Vercel CLI:
```bash
npm install -g vercel
```

2. Build and deploy:
```bash
cd frontend
vercel
```

3. Set environment variables in Vercel dashboard:
   - Go to Project Settings → Environment Variables
   - Add all VITE_* variables from your .env file

4. Redeploy after setting variables

#### Option 2: Netlify

1. Install Netlify CLI:
```bash
npm install -g netlify-cli
```

2. Build the project:
```bash
cd frontend
npm run build
```

3. Deploy:
```bash
netlify deploy --prod --dir=dist
```

4. Set environment variables in Netlify dashboard

#### Option 3: Firebase Hosting

1. Install Firebase CLI:
```bash
npm install -g firebase-tools
```

2. Login to Firebase:
```bash
firebase login
```

3. Initialize hosting:
```bash
cd frontend
firebase init hosting
```

4. Build and deploy:
```bash
npm run build
firebase deploy --only hosting
```

### Backend Deployment

#### Option 1: Railway (Recommended)

1. Create account at [Railway.app](https://railway.app)
2. Create new project
3. Connect your GitHub repository
4. Set environment variables:
   - PORT
   - FIREBASE_PROJECT_ID
   - FIREBASE_CLIENT_EMAIL
   - FIREBASE_PRIVATE_KEY
5. Deploy automatically on push

#### Option 2: Render

1. Create account at [Render.com](https://render.com)
2. Create new Web Service
3. Connect your repository
4. Set build command: `cd backend && npm install`
5. Set start command: `cd backend && npm start`
6. Add environment variables
7. Deploy

#### Option 3: Heroku

1. Install Heroku CLI:
```bash
npm install -g heroku
```

2. Login:
```bash
heroku login
```

3. Create app:
```bash
cd backend
heroku create your-app-name
```

4. Set environment variables:
```bash
heroku config:set FIREBASE_PROJECT_ID=your_project_id
heroku config:set FIREBASE_CLIENT_EMAIL=your_email
heroku config:set FIREBASE_PRIVATE_KEY="your_key"
```

5. Deploy:
```bash
git push heroku main
```

## Production Configuration

### Frontend Production Settings

Update `frontend/.env.production`:

```env
VITE_FIREBASE_API_KEY=your_production_api_key
VITE_FIREBASE_AUTH_DOMAIN=your_production_auth_domain
VITE_FIREBASE_PROJECT_ID=your_production_project_id
VITE_FIREBASE_STORAGE_BUCKET=your_production_storage_bucket
VITE_FIREBASE_MESSAGING_SENDER_ID=your_production_sender_id
VITE_FIREBASE_APP_ID=your_production_app_id
VITE_FIREBASE_MEASUREMENT_ID=your_production_measurement_id
VITE_API_URL=https://your-backend-url.com/api
```

### Backend Production Settings

Update CORS in `backend/server.js`:

```javascript
const corsOptions = {
  origin: process.env.FRONTEND_URL || 'https://your-frontend-domain.com',
  credentials: true,
  optionsSuccessStatus: 200
}

app.use(cors(corsOptions))
```

Add to `backend/.env`:

```env
NODE_ENV=production
FRONTEND_URL=https://your-frontend-domain.com
```

## Security Hardening

### 1. Environment Variables

Never commit:
- `.env` files
- Firebase service account keys
- API keys

### 2. Firestore Security Rules

Already configured in SETUP_INSTRUCTIONS.md

### 3. Rate Limiting

Add to `backend/server.js`:

```javascript
const rateLimit = require('express-rate-limit')

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100 // limit each IP to 100 requests per windowMs
})

app.use('/api/', limiter)
```

Install:
```bash
npm install express-rate-limit
```

### 4. Helmet for Security Headers

Add to `backend/server.js`:

```javascript
const helmet = require('helmet')
app.use(helmet())
```

Install:
```bash
npm install helmet
```

## Monitoring & Logging

### Frontend Monitoring

Add Google Analytics or similar:

```javascript
// In frontend/src/main.jsx
import ReactGA from 'react-ga4'

ReactGA.initialize('YOUR_GA_MEASUREMENT_ID')
```

### Backend Logging

Use Winston or similar:

```javascript
const winston = require('winston')

const logger = winston.createLogger({
  level: 'info',
  format: winston.format.json(),
  transports: [
    new winston.transports.File({ filename: 'error.log', level: 'error' }),
    new winston.transports.File({ filename: 'combined.log' })
  ]
})
```

## Performance Optimization

### Frontend

1. Enable compression in Vite:

```javascript
// vite.config.js
import compression from 'vite-plugin-compression'

export default defineConfig({
  plugins: [
    react(),
    compression()
  ]
})
```

2. Lazy load routes:

```javascript
const AdminDashboard = lazy(() => import('./pages/admin/Dashboard'))
```

### Backend

1. Enable compression:

```javascript
const compression = require('compression')
app.use(compression())
```

2. Cache responses:

```javascript
const apicache = require('apicache')
let cache = apicache.middleware

app.use(cache('5 minutes'))
```

## Backup Strategy

### Firestore Backup

1. Enable automatic backups in Firebase Console
2. Or use Firebase CLI:

```bash
firebase firestore:export gs://your-bucket/backups
```

### Scheduled Backups

Use Cloud Scheduler or cron jobs to automate backups.

## Domain Configuration

### Custom Domain Setup

1. Purchase domain from registrar
2. Add DNS records:
   - Frontend: CNAME to hosting provider
   - Backend: A record to server IP

3. Enable SSL/TLS certificates (automatic on most platforms)

## CI/CD Pipeline

### GitHub Actions Example

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy

on:
  push:
    branches: [ main ]

jobs:
  deploy-frontend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Install dependencies
        run: cd frontend && npm install
      - name: Build
        run: cd frontend && npm run build
      - name: Deploy to Vercel
        uses: amondnet/vercel-action@v20
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.ORG_ID }}
          vercel-project-id: ${{ secrets.PROJECT_ID }}

  deploy-backend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Deploy to Railway
        uses: bervProject/railway-deploy@main
        with:
          railway_token: ${{ secrets.RAILWAY_TOKEN }}
          service: backend
```

## Post-Deployment Checklist

- [ ] All environment variables set correctly
- [ ] CORS configured for production domain
- [ ] SSL/TLS certificates active
- [ ] Firestore security rules deployed
- [ ] Rate limiting enabled
- [ ] Monitoring and logging configured
- [ ] Backup strategy implemented
- [ ] Custom domain configured
- [ ] Performance optimization applied
- [ ] Security headers enabled
- [ ] Error tracking setup (Sentry, etc.)
- [ ] Test all features in production
- [ ] Create admin account
- [ ] Add sample data
- [ ] Test user registration and login
- [ ] Test taking a mock test
- [ ] Verify results and analytics

## Maintenance

### Regular Tasks

1. Monitor error logs daily
2. Check performance metrics weekly
3. Update dependencies monthly
4. Review security patches
5. Backup database regularly
6. Monitor user feedback
7. Update content as needed

### Scaling Considerations

1. Use Firebase's automatic scaling
2. Consider CDN for static assets
3. Implement caching strategies
4. Optimize database queries
5. Use connection pooling
6. Consider serverless functions for heavy operations

## Support & Resources

- Firebase Documentation: https://firebase.google.com/docs
- Vercel Documentation: https://vercel.com/docs
- Railway Documentation: https://docs.railway.app
- React Documentation: https://react.dev

## Rollback Procedure

If deployment fails:

1. Revert to previous version in hosting platform
2. Check error logs
3. Verify environment variables
4. Test locally before redeploying
5. Use staging environment for testing

## Success Metrics

Monitor these KPIs:
- User registration rate
- Test completion rate
- Average test scores
- User engagement time
- Error rates
- Page load times
- API response times

Congratulations on deploying UP Exam Mantra! 🚀
