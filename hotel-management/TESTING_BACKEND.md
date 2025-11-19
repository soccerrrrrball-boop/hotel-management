# Testing Your Render Backend

## Understanding the 403 Error

When you access `https://hotel-management-system-5iby.onrender.com` directly in a browser, you'll get a 403 error. This is **normal and expected** because:

1. **The backend is an API**, not a website - it doesn't have a homepage
2. **Most endpoints require authentication** - you need a JWT token
3. **The root URL (`/`) has no endpoint** - there's nothing mapped to it

## How to Test Your Backend

### ✅ Test Public Endpoints (No Authentication Required)

These endpoints should work when accessed directly:

1. **Get Available Rooms:**
   ```
   https://hotel-management-system-5iby.onrender.com/rooms/all-available-rooms
   ```

2. **Get Room Types:**
   ```
   https://hotel-management-system-5iby.onrender.com/rooms/types
   ```

3. **Test Login Endpoint (POST - use Postman/curl):**
   ```
   POST https://hotel-management-system-5iby.onrender.com/auth/login
   Body: {"email": "adminhotel@gmail.com", "password": "adminhotel@123"}
   ```

### ❌ Protected Endpoints (Require Authentication)

These will return 403 without a valid JWT token:
- `/admin/dashboard/**` - Requires ADMIN role
- `/users/**` - Requires authentication
- `/bookings/**` (some endpoints)
- `/payments/**` (some endpoints)

## Testing CORS from Frontend

The **real test** is whether your Netlify frontend can communicate with the backend:

1. **Deploy your frontend to Netlify**
2. **Open your Netlify site** (e.g., `https://sprightly-medovik-10652d.netlify.app`)
3. **Open browser DevTools** (F12) → Console tab
4. **Try to use the app** - login, view rooms, etc.
5. **Check for CORS errors** in the console

If you see CORS errors like:
```
Access to fetch at '...' from origin '...' has been blocked by CORS policy
```

Then CORS is not configured correctly.

## Quick CORS Test

Test CORS with curl:

```bash
curl -X OPTIONS https://hotel-management-system-5iby.onrender.com/auth/login \
  -H "Origin: https://sprightly-medovik-10652d.netlify.app" \
  -H "Access-Control-Request-Method: POST" \
  -v
```

Look for `Access-Control-Allow-Origin` in the response headers.

## Expected Behavior

✅ **Working correctly:**
- Public endpoints return data (200 OK)
- Frontend can make API calls without CORS errors
- Login works and returns JWT token
- Authenticated requests work with token

❌ **Not working:**
- CORS errors in browser console
- 401 Unauthorized when using valid token
- 403 Forbidden on public endpoints
- Network errors when frontend tries to connect

## Next Steps

1. **Test a public endpoint** in browser:
   - Go to: `https://hotel-management-system-5iby.onrender.com/rooms/all-available-rooms`
   - Should return JSON data (not 403)

2. **Deploy frontend and test from there** - this is the real test

3. **If you still get 403 on public endpoints**, check:
   - Render environment variables are set correctly
   - Service has been redeployed after setting CORS_ALLOWED_ORIGINS
   - No trailing slash in CORS_ALLOWED_ORIGINS value

