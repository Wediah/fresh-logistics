# Firebase Products & Categories Setup Guide

## Overview
This guide explains how to add products and categories to Firebase Firestore so they appear in your Fresh Logistics app.

## 🚀 Quick Setup (Recommended)

### Method 1: Using the Admin Panel (Easiest)
1. **Open the app** and navigate to **Settings** (Profile tab)
2. **Scroll down** to "App Settings" section
3. **Tap "Admin Panel"**
4. **Tap "Seed Database with Sample Data"** 
5. **Wait for success message**
6. **Tap "Refresh App Data"**
7. **Go back to Home screen** - you should see products loaded from Firebase!

### Method 2: Manual Firebase Console Setup

## 📋 Firebase Collections Structure

Your Firestore database should have these collections:

### 1. `categories` Collection
Each document should have these fields:
```json
{
  "name": "Vegetables",
  "description": "Fresh organic vegetables",
  "imageUrl": "https://your-image-url.com/vegetables.jpg",
  "iconUrl": "assets/icons/categories/vegetables.png",
  "isActive": true,
  "sortOrder": 1
}
```

### 2. `products` Collection
Each document should have these fields:
```json
{
  "name": "Fresh Spinach",
  "description": "Organic fresh spinach leaves, perfect for salads and cooking.",
  "imageUrl": "https://your-image-url.com/spinach.jpg",
  "price": 25.99,
  "brand": "Green Farms",
  "category": "vegetables",
  "availableColors": ["Green"],
  "availableSizes": ["100g", "250g", "500g"],
  "stockQuantity": 50,
  "rating": 4.5,
  "reviewCount": 120,
  "isInStock": true,
  "featured": false
}
```

## 🔧 Manual Setup Steps

### Step 1: Firebase Console Setup
1. Go to [Firebase Console](https://console.firebase.google.com)
2. Select your project
3. Go to **Firestore Database**
4. Click **"Start collection"**

### Step 2: Create Categories Collection
1. Collection ID: `categories`
2. Add documents with the structure shown above
3. Sample categories:
   - vegetables
   - fruits
   - dairy
   - meat
   - pantry

### Step 3: Create Products Collection
1. Collection ID: `products`
2. Add documents with the structure shown above
3. Make sure `category` field matches your category IDs

### Step 4: Set Firestore Security Rules
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow read access to categories and products
    match /categories/{document} {
      allow read: if true;
      allow write: if request.auth != null;
    }
    
    match /products/{document} {
      allow read: if true;
      allow write: if request.auth != null;
    }
    
    // Existing cart rules...
    match /users/{userId}/cart/{document} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

## 📱 Testing in the App

### Verify Setup:
1. **Home Screen**: Should show products from Firebase
2. **Store Screen**: Should display all products
3. **Wishlist Screen**: Should show product catalog
4. **Search Screen**: Should find products
5. **Admin Panel**: Should show correct counts

### Troubleshooting:
- **No products showing**: Check Firestore rules and internet connection
- **Loading forever**: Check console for Firebase errors
- **Images not loading**: Verify imageUrl fields are valid URLs

## 🖼️ Image Management

### Option 1: Using External URLs (Recommended for Testing)
Use free image services like:
- Unsplash: `https://images.unsplash.com/`
- Pixabay: `https://pixabay.com/`

### Option 2: Firebase Storage
1. Upload images to Firebase Storage
2. Get download URLs
3. Use these URLs in your product documents

## 🔄 Real-time Updates

The app automatically syncs with Firebase:
- ✅ New products appear instantly
- ✅ Price changes update in real-time
- ✅ Stock status updates automatically
- ✅ Category changes reflect immediately

## 📊 Sample Data Structure

### Categories Example:
```
categories/
├── doc1: { name: "Vegetables", isActive: true, sortOrder: 1, ... }
├── doc2: { name: "Fruits", isActive: true, sortOrder: 2, ... }
├── doc3: { name: "Dairy", isActive: true, sortOrder: 3, ... }
└── doc4: { name: "Meat", isActive: true, sortOrder: 4, ... }
```

### Products Example:
```
products/
├── doc1: { name: "Fresh Spinach", category: "vegetables", price: 25.99, ... }
├── doc2: { name: "Carrots", category: "vegetables", price: 18.50, ... }
├── doc3: { name: "Apples", category: "fruits", price: 120.00, ... }
└── doc4: { name: "Milk", category: "dairy", price: 65.00, ... }
```

## 🎯 Best Practices

1. **Use descriptive names** for products and categories
2. **Optimize images** - keep file sizes reasonable
3. **Set proper stock quantities** to avoid overselling
4. **Use consistent category IDs** across products
5. **Enable/disable products** using `isActive` field
6. **Mark featured products** with `featured: true`

## 🚨 Important Notes

- **Firestore Rules**: Make sure your rules allow reading products/categories
- **Authentication**: The app uses anonymous auth for cart functionality
- **Offline Support**: Data is cached locally for offline access
- **Real-time**: Changes in Firebase appear immediately in the app

## 📞 Support

If you encounter issues:
1. Check the console for error messages
2. Verify Firebase configuration
3. Ensure internet connectivity
4. Check Firestore security rules

Your Fresh Logistics app is now ready to display products from Firebase! 🎉
