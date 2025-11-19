# Fix 403 Error on Render - CORS Configuration

## Problem
Getting "HTTP ERROR 403" when accessing the backend on Render. This is typically a CORS (Cross-Origin Resource Sharing) issue.

## Solution

### Step 1: Set CORS Environment Variable in Render

1. Go to your Render Dashboard
2. Select your backend service (`hotel-management-backend`)
3. Go to **Environment** tab
4. Add/Update the following environment variable:

```
CORS_ALLOWED_ORIGINS=https://your-netlify-site.netlify.app,https://your-netlify-site.netlify.app
```

**Important**: 
- Replace `your-netlify-site.netlify.app` with your actual Netlify frontend URL
- If you have multiple frontend URLs (production, preview), separate them with commas
- Include the protocol (`https://`)
- Do NOT use `*` if you need authentication (cookies/tokens)

### Step 2: For Development/Testing (Optional)

If you want to allow all origins temporarily for testing, set:

```
CORS_ALLOWED_ORIGINS=*
```

**Warning**: Using `*` disables credential support. Only use for testing.

### Step 3: Restart the Service

After setting the environment variable:
1. Go to **Manual Deploy** in Render
2. Click **Deploy latest commit**
3. Wait for the deployment to complete

### Step 4: Verify Frontend API URL

In your Netlify environment variables, make sure:

```
REACT_APP_API_URL=https://hotel-management-system-5iby.onrender.com
```

Replace with your actual Render backend URL.

## Common Issues

### Issue 1: Still getting 403
- Check that `CORS_ALLOWED_ORIGINS` is set correctly in Render
- Verify the frontend URL matches exactly (including `https://`)
- Check Render logs for CORS errors

### Issue 2: CORS preflight fails
- The code now handles OPTIONS requests automatically
- Make sure `CORS_ALLOWED_ORIGINS` includes your frontend domain

### Issue 3: Credentials not working
- If using `*` for origins, credentials won't work
- Use specific domain names instead of `*`

## Testing

After deployment, test with:

```bash
curl -X OPTIONS https://hotel-management-system-5iby.onrender.com/auth/login \
  -H "Origin: https://your-netlify-site.netlify.app" \
  -H "Access-Control-Request-Method: POST" \
  -v
```

You should see `Access-Control-Allow-Origin` in the response headers.

