# Rooms Not Fetching - Debugging Guide

## Problem
Rooms with images are not displaying on the frontend.

## Possible Causes

### 1. **Database Issue - Rooms Missing Images**
- The database might have rooms but without `roomPhotoUrl` values
- Check your Railway/MySQL database:
  ```sql
  SELECT id, room_type, room_photo_url FROM rooms LIMIT 10;
  ```
- If `room_photo_url` is NULL or empty, rooms won't show images

### 2. **API Call Failing**
- Check browser DevTools → Network tab
- Look for request to `/rooms/all`
- Check if it returns 200 OK or an error
- Verify the response contains `roomList` array

### 3. **CORS Issue (Less Likely Now)**
- If you see CORS errors in console, the CORS fix might not be deployed yet
- Make sure backend has `CORS_ALLOWED_ORIGINS` environment variable set

### 4. **Image URLs Invalid**
- If rooms have `roomPhotoUrl` but images don't load:
  - Check if URLs are valid (not broken links)
  - Check browser console for image loading errors
  - Images might be blocked by CORS if hosted externally

## Debugging Steps

### Step 1: Check Browser Console
1. Open browser DevTools (F12)
2. Go to Console tab
3. Look for logs starting with:
   - `Fetching rooms from:`
   - `Full API Response:`
   - `Extracted rooms count:`
   - `First room structure:`
   - `Rooms with images: X, Rooms without images: Y`

### Step 2: Check Network Tab
1. Open browser DevTools → Network tab
2. Filter by "XHR" or "Fetch"
3. Look for request to `/rooms/all`
4. Check:
   - Status code (should be 200)
   - Response body (should have `roomList` array)
   - Response headers (check for CORS headers)

### Step 3: Check Database
Connect to your Railway MySQL database and run:
```sql
-- Check total rooms
SELECT COUNT(*) FROM rooms;

-- Check rooms with images
SELECT COUNT(*) FROM rooms WHERE room_photo_url IS NOT NULL AND room_photo_url != '';

-- Check rooms without images
SELECT COUNT(*) FROM rooms WHERE room_photo_url IS NULL OR room_photo_url = '';

-- See sample rooms
SELECT id, room_type, room_photo_url, room_price FROM rooms LIMIT 10;
```

### Step 4: Verify Backend is Running
1. Check if backend is accessible:
   - Visit: `https://hotel-management-system-5iby.onrender.com/health`
   - Should return status 200
2. Test rooms endpoint directly:
   - Visit: `https://hotel-management-system-5iby.onrender.com/rooms/all`
   - Should return JSON with `roomList` array

## Solutions

### Solution 1: Add Images to Existing Rooms
If rooms exist but don't have images, update them:
```sql
-- Update rooms with Unsplash images (example)
UPDATE rooms 
SET room_photo_url = 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800&h=600&fit=crop'
WHERE room_photo_url IS NULL OR room_photo_url = ''
LIMIT 10;
```

### Solution 2: Insert Rooms with Images
If database is empty, insert rooms:
```sql
INSERT INTO rooms (room_type, room_price, room_photo_url, room_description) VALUES
('Deluxe King', 199.00, 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800&h=600&fit=crop', 'Spacious room with a king bed, rainfall shower, and city skyline views.'),
('Premium Twin', 159.00, 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&h=600&fit=crop', 'Two plush twin beds, ergonomic workspace, perfect for friends or colleagues.');
-- Add more rooms as needed
```

### Solution 3: Check API Response Structure
The backend should return:
```json
{
  "statusCode": 200,
  "message": "successful",
  "roomList": [
    {
      "id": 1,
      "roomType": "Deluxe King",
      "roomPrice": 199.00,
      "roomPhotoUrl": "https://...",
      "roomDescription": "..."
    }
  ]
}
```

### Solution 4: Verify Frontend API URL
Check that `REACT_APP_API_URL` is set correctly:
- In `netlify.toml`: Should be `https://hotel-management-system-5iby.onrender.com`
- In Netlify dashboard: Environment variables should match

## Code Changes Made

1. ✅ Added detailed logging in `AllRoomsPage.jsx`
   - Logs API response structure
   - Logs rooms with/without images
   - Better error messages

2. ✅ Improved error handling in `ApiService.js`
   - Logs API call details
   - Better error reporting

3. ✅ Enhanced image error handling in `RoomResult.jsx`
   - Logs which images fail to load
   - Shows placeholder for broken images

## Next Steps

1. **Check browser console** for the new debug logs
2. **Check Network tab** to see if API call succeeds
3. **Verify database** has rooms with images
4. **Test backend endpoint** directly in browser
5. **Share console logs** if issue persists

## Common Issues

### Issue: "No rooms available" alert
- **Cause**: API returned empty `roomList` or database is empty
- **Fix**: Insert rooms into database (see Solution 2)

### Issue: Images show placeholder
- **Cause**: `roomPhotoUrl` is null/empty or image URL is broken
- **Fix**: Update rooms with valid image URLs (see Solution 1)

### Issue: "Error loading rooms" alert
- **Cause**: API call failed (network error, CORS, backend down)
- **Fix**: Check backend is running, verify CORS configuration

### Issue: Rooms show but no images
- **Cause**: Image URLs are invalid or blocked
- **Fix**: Check browser console for image loading errors, verify URLs are accessible

