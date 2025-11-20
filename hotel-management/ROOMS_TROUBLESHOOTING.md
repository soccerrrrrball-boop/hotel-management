# Rooms Not Showing Images - Quick Troubleshooting

## ✅ Database Status
Your database **HAS** rooms with image URLs (confirmed from your SQL query). The issue is elsewhere.

## 🔍 Step-by-Step Debugging

### Step 1: Check Browser Console
1. Open your Netlify site: `https://classy-faloodeh-88ef5c.netlify.app`
2. Open DevTools (F12) → **Console** tab
3. Refresh the page
4. Look for these logs:
   ```
   Fetching rooms from: https://hotel-management-system-5iby.onrender.com
   Full API Response: {...}
   Extracted rooms count: X
   First room structure: {...}
   Rooms with images: X, Rooms without images: Y
   ```

### Step 2: Check Network Tab
1. DevTools → **Network** tab
2. Filter by "XHR" or "Fetch"
3. Look for request to `/rooms/all`
4. Check:
   - **Status**: Should be `200 OK` (not `pending`, `failed`, or `CORS error`)
   - **Response**: Click on the request → "Response" tab
   - Should see JSON with `roomList` array

### Step 3: Test API Directly
Open this URL in your browser:
```
https://hotel-management-system-5iby.onrender.com/rooms/all
```

**Expected Response:**
```json
{
  "statusCode": 200,
  "message": "successful",
  "roomList": [
    {
      "id": 1,
      "roomType": "Cozy Cabin",
      "roomPrice": 189.00,
      "roomPhotoUrl": "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&h=600&fit=crop",
      "roomDescription": "..."
    },
    ...
  ]
}
```

## 🐛 Common Issues & Fixes

### Issue 1: API Call Failing (Network Error)
**Symptoms:**
- Console shows: `Error loading rooms: Network Error`
- Network tab shows: `failed` or `(pending)` status

**Possible Causes:**
- Backend is down
- CORS not configured correctly
- Wrong API URL

**Fix:**
1. Verify backend is running: `https://hotel-management-system-5iby.onrender.com/health`
2. Check Render dashboard - is backend service running?
3. Verify `CORS_ALLOWED_ORIGINS` environment variable is set in Render

### Issue 2: API Returns Empty Array
**Symptoms:**
- API call succeeds (200 OK)
- But `roomList` is empty: `[]`

**Possible Causes:**
- Database query issue
- Rooms not being mapped correctly

**Fix:**
- Check backend logs in Render dashboard
- Verify database connection

### Issue 3: Images Not Loading (But Rooms Show)
**Symptoms:**
- Rooms display but images show placeholder
- Console shows: `Image failed to load: [URL]`

**Possible Causes:**
- Unsplash URLs blocked by CORS
- Invalid image URLs
- Network issue loading images

**Fix:**
- Unsplash images should work fine
- Check if URLs are complete (not truncated)
- Verify image URLs in database match what's returned

### Issue 4: Response Structure Mismatch
**Symptoms:**
- API returns data but frontend shows "No rooms available"
- Console shows: `Extracted rooms count: 0`

**Possible Causes:**
- Response structure different than expected
- `roomList` field name mismatch

**Fix:**
- Check console log: `Full API Response:`
- Verify response has `roomList` field (not `rooms` or `data`)

## 🧪 Quick Test

Run this in browser console on your Netlify site:
```javascript
fetch('https://hotel-management-system-5iby.onrender.com/rooms/all')
  .then(r => r.json())
  .then(data => {
    console.log('API Response:', data);
    console.log('Room Count:', data.roomList?.length || 0);
    console.log('First Room:', data.roomList?.[0]);
  })
  .catch(err => console.error('Error:', err));
```

## 📋 What to Share

If issue persists, share:
1. **Browser Console logs** (all logs from page load)
2. **Network tab screenshot** (showing `/rooms/all` request)
3. **API response** (from testing the URL directly)
4. **Backend logs** (from Render dashboard)

## ✅ Expected Behavior

When working correctly:
1. Page loads → `fetchRooms()` is called
2. API call to `/rooms/all` succeeds (200 OK)
3. Response contains `roomList` with 10+ rooms
4. Each room has `roomPhotoUrl` with Unsplash URL
5. Images load and display correctly
6. Console shows: `Rooms with images: 10, Rooms without images: 0`

