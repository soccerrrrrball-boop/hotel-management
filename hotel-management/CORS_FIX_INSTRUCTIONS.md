# CORS Fix Instructions

## Problem
Login requests are stuck in "Pending" status because the backend is not responding to CORS preflight (OPTIONS) requests properly. The error shows:
- "No 'Access-Control-Allow-Origin' header is present"
- "Response to preflight doesn't pass access control check"

## Solution Applied
1. ✅ Created `CorsFilter.java` - A dedicated filter that runs BEFORE Spring Security to handle CORS
2. ✅ Updated `CorsConfig.java` to use `CorsConfigurationSource` bean that Spring Security will use
3. ✅ Updated `SecurityConfig.java` to inject and use the custom CORS configuration AND the CorsFilter
4. ✅ Updated `JWTAuthFilter.java` to skip OPTIONS requests
5. ✅ Updated `netlify.toml` with correct backend URL: `https://hotel-management-system-5iby.onrender.com`

## Backend Deployment Configuration

### For Render/EC2/Any Backend Hosting:

**Set the `CORS_ALLOWED_ORIGINS` environment variable** in your backend deployment:

```
CORS_ALLOWED_ORIGINS=https://classy-faloodeh-88ef5c.netlify.app,http://localhost:3000
```

**Important Notes:**
- Include your Netlify frontend URL: `https://classy-faloodeh-88ef5c.netlify.app`
- Include localhost for local development: `http://localhost:3000`
- Use comma-separated values (no spaces after commas)
- Use `https://` for production Netlify URLs
- Use `http://` for localhost

### Example for Render:
1. Go to your Render dashboard
2. Select your backend service
3. Go to "Environment" tab
4. Add/Update: `CORS_ALLOWED_ORIGINS` = `https://classy-faloodeh-88ef5c.netlify.app,http://localhost:3000`
5. Save and redeploy

### Example for EC2:
1. SSH into your EC2 instance
2. Edit your environment variables or systemd service file
3. Add: `CORS_ALLOWED_ORIGINS=https://classy-faloodeh-88ef5c.netlify.app,http://localhost:3000`
4. Restart your Spring Boot application

## Frontend Configuration

The `netlify.toml` has been updated to include the backend API URL. Make sure to:

1. Update `REACT_APP_API_URL` in `netlify.toml` if your backend URL changes
2. Or set it in Netlify dashboard under Site Settings → Environment Variables

## Testing

After deploying:

1. **Check OPTIONS request:**
   - Open browser DevTools → Network tab
   - Try to login
   - Look for `OPTIONS /auth/login` request
   - It should return `200 OK` with CORS headers

2. **Check CORS headers in response:**
   - Look for these headers in the OPTIONS response:
     - `Access-Control-Allow-Origin: https://classy-faloodeh-88ef5c.netlify.app`
     - `Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS, PATCH`
     - `Access-Control-Allow-Headers: *`
     - `Access-Control-Allow-Credentials: true`

3. **If still failing:**
   - Check backend logs for CORS errors
   - Verify `CORS_ALLOWED_ORIGINS` environment variable is set correctly
   - Ensure backend is accessible from the internet (not blocked by firewall)
   - Check that the backend URL in `netlify.toml` matches your actual backend URL

## Code Changes Summary

### Files Created:
1. `backend/src/main/java/com/hotelbooking/hotelmanagement/security/CorsFilter.java` ⭐ NEW
   - Dedicated CORS filter that runs BEFORE Spring Security
   - Handles OPTIONS preflight requests immediately
   - Sets all required CORS headers
   - Returns 200 OK for OPTIONS requests without continuing the filter chain

### Files Modified:
1. `backend/src/main/java/com/hotelbooking/hotelmanagement/security/CorsConfig.java`
   - Added `CorsConfigurationSource` bean for Spring Security
   - Properly configured OPTIONS handling
   - Added maxAge for preflight caching

2. `backend/src/main/java/com/hotelbooking/hotelmanagement/security/SecurityConfig.java`
   - Injected `CorsConfigurationSource` AND `CorsFilter`
   - Added `CorsFilter` to the filter chain BEFORE JWT filter
   - Updated to use custom CORS configuration instead of defaults

3. `backend/src/main/java/com/hotelbooking/hotelmanagement/security/JWTAuthFilter.java`
   - Added check to skip JWT validation for OPTIONS requests
   - Prevents JWT filter from interfering with CORS preflight

4. `frontend/netlify.toml`
   - Updated `REACT_APP_API_URL` to correct backend URL: `https://hotel-management-system-5iby.onrender.com`

## Quick Fix Checklist

- [ ] Set `CORS_ALLOWED_ORIGINS` environment variable in backend deployment
- [ ] Include Netlify URL: `https://classy-faloodeh-88ef5c.netlify.app`
- [ ] Include localhost for dev: `http://localhost:3000`
- [ ] Redeploy backend after setting environment variable
- [ ] Update `REACT_APP_API_URL` in `netlify.toml` if backend URL changed
- [ ] Test login from Netlify frontend
- [ ] Check browser DevTools Network tab for OPTIONS request success

