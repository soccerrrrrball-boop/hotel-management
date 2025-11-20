# CORS Troubleshooting Guide

## Current CORS Error
The error shows:
- Frontend: `https://beautiful-naiad-2ac0bc.netlify.app`
- Backend: `https://hotel-management-system-5iby.onrender.com`
- Error: "No 'Access-Control-Allow-Origin' header is present"

## Solution

### Step 1: Update CORS_ALLOWED_ORIGINS in Render

1. Go to Render Dashboard: https://dashboard.render.com
2. Select your backend service: `hotel-management-backend`
3. Go to **Environment** tab
4. Find or add `CORS_ALLOWED_ORIGINS`
5. Set the value to include your Netlify URL:

```
https://beautiful-naiad-2ac0bc.netlify.app
```

**OR** if you have multiple Netlify URLs (production, preview, etc.), separate them with commas:

```
https://beautiful-naiad-2ac0bc.netlify.app,https://sprightly-medovik-10652d.netlify.app
```

**Important:**
- Include `https://` protocol
- NO trailing slash
- Separate multiple URLs with commas (no spaces)

### Step 2: Redeploy Backend

After updating the environment variable:
1. Go to **Manual Deploy** section
2. Click **Deploy latest commit**
3. Wait for deployment to complete (2-3 minutes)

### Step 3: Verify

After deployment, test:
1. Open your Netlify site
2. Try to login or register
3. Check browser console (F12) - CORS errors should be gone

## Alternative: Allow All Origins (For Testing Only)

If you want to allow all origins temporarily for testing:

1. In Render, set `CORS_ALLOWED_ORIGINS` to:
   ```
   *
   ```

**Warning:** Using `*` disables credential support, so authentication might not work properly. Only use for testing.

## Common Issues

### Issue 1: Still getting CORS errors after update
- Make sure you removed any trailing slashes from the URL
- Verify the environment variable name is exactly `CORS_ALLOWED_ORIGINS`
- Check that the backend was redeployed after the change

### Issue 2: Different Netlify URLs
- Netlify creates different URLs for production, preview, and branch deploys
- Add all URLs you need to `CORS_ALLOWED_ORIGINS`, separated by commas

### Issue 3: Preflight (OPTIONS) requests failing
- The code now allows OPTIONS requests
- Make sure the backend is redeployed with the latest code

## Current Netlify URL
Based on the error, your current Netlify URL is:
```
https://beautiful-naiad-2ac0bc.netlify.app
```

Make sure this is included in `CORS_ALLOWED_ORIGINS` in Render.

