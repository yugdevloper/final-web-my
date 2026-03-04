#!/bin/bash

# UP Exam Mantra - Quick Deployment Script
# Created by Yogendra Pratap Singh

echo "🚀 UP Exam Mantra - Deployment Script"
echo "======================================"
echo ""

# Check if we're in the right directory
if [ ! -d "frontend" ]; then
    echo "❌ Error: frontend directory not found!"
    echo "Please run this script from the project root directory."
    exit 1
fi

# Navigate to frontend
cd frontend

echo "📦 Installing dependencies..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ Error: npm install failed!"
    exit 1
fi

echo ""
echo "🔨 Building project..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Error: Build failed!"
    exit 1
fi

echo ""
echo "✅ Build successful!"
echo ""
echo "📁 Build output is in: frontend/dist"
echo ""
echo "🌐 Next Steps:"
echo "1. Deploy to Vercel: vercel --prod"
echo "2. Deploy to Netlify: netlify deploy --prod"
echo "3. Deploy to Firebase: firebase deploy --only hosting"
echo ""
echo "📖 For detailed instructions, see DEPLOYMENT_GUIDE_HINDI.md"
echo ""
echo "🎉 Ready to deploy!"
