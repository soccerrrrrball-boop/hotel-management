# 🔴 URGENT: Fix Netlify Backend URL

Your Netlify frontend is still using the **OLD** backend URL, causing all API calls to fail.

## Quick Fix (5 minutes):

### Step 1: Update Environment Variable in Netlify
1. Go to: **https://app.netlify.com**
2. Click on your site: **beautiful-naiad-2ac0bc**
3. Go to: **Site settings** (gear icon in top right)
4. Click: **Environment variables** (in left sidebar)
5. Find `REACT_APP_API_URL` in the list
   - If it exists: Click it → Change value to: `https://hotel-management-gv03.onrender.com` → **Save**
   - If it doesn't exist: Click **"Add a variable"** → 
     - Key: `REACT_APP_API_URL`
     - Value: `https://hotel-management-gv03.onrender.com`
     - Scope: **All scopes** → **Save**

### Step 2: Clear Cache and Redeploy
1. Go to: **Deploys** tab (top navigation)
2. Click: **"Trigger deploy"** button (top right)
3. Select: **"Clear cache and deploy site"**
4. Wait 2-3 minutes for build to complete

### Step 3: Verify
1. After deploy finishes, open: **https://beautiful-naiad-2ac0bc.netlify.app**
2. Open browser console (F12)
3. You should see: `🔍 API Base URL configured: https://hotel-management-gv03.onrender.com`
4. Try logging in - it should work now!

## Why This Happens:
- Netlify environment variables in the **Dashboard** override `netlify.toml`
- The old URL was set in the dashboard, so even though `netlify.toml` is correct, the dashboard value takes precedence
- You MUST update it in the dashboard for it to work

## Current Status:
- ✅ Local database: 57 rooms added
- ✅ Local backend: Working correctly
- ✅ Code: Updated correctly
- ❌ Netlify deployment: Still using old URL (needs dashboard update)

