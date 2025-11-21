# Fix Netlify Environment Variable

The frontend is still using the old backend URL. Follow these steps:

## Step 1: Update Environment Variable in Netlify Dashboard

1. Go to: https://app.netlify.com
2. Select your site: **beautiful-naiad-2ac0bc**
3. Go to: **Site settings** → **Environment variables**
4. Find `REACT_APP_API_URL` (or click **"Add a variable"** if it doesn't exist)
5. Set the value to: `https://hotel-management-gv03.onrender.com`
6. Click **"Save"**

## Step 2: Clear Build Cache and Redeploy

1. Go to: **Deploys** tab
2. Click **"Trigger deploy"** → **"Clear cache and deploy site"** (this ensures a fresh build)
3. Wait for the build to complete (2-3 minutes)

## Step 3: Verify

1. After deploy completes, open your site: https://beautiful-naiad-2ac0bc.netlify.app
2. Open browser console (F12)
3. You should see: `🔍 API Base URL configured: https://hotel-management-gv03.onrender.com`
4. Try logging in - it should work now!

## Alternative: Push to GitHub

If you prefer, you can push the code changes to trigger an auto-deploy:
```bash
git add .
git commit -m "Update API URL configuration"
git push
```

But you still need to update the environment variable in Netlify Dashboard (Step 1)!

