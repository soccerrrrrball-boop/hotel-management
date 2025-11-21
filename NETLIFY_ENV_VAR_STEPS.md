# How to Update Netlify Environment Variable

## Step-by-Step Instructions:

### 1. Go to Netlify Dashboard
- Open: https://app.netlify.com
- Sign in if needed

### 2. Select Your Site
- Click on: **beautiful-naiad-2ac0bc**

### 3. Open Site Settings
- Click the **gear icon** (⚙️) in the top right, OR
- Click **"Site settings"** from the left sidebar

### 4. Go to Environment Variables
- In the left sidebar, click: **"Environment variables"**
- (It's under "Build & deploy" section)

### 5. Find or Add the Variable
**If `REACT_APP_API_URL` exists:**
- Click on it
- Click **"Edit"** or change the value
- Set value to: `https://hotel-management-gv03.onrender.com`
- Click **"Save"**

**If it doesn't exist:**
- Click **"Add a variable"** button
- Key: `REACT_APP_API_URL`
- Value: `https://hotel-management-gv03.onrender.com`
- Scope: Select **"All scopes"** (or just "Production" if you prefer)
- Click **"Save variable"**

### 6. Trigger a New Deploy
- Go to **"Deploys"** tab (top navigation)
- Click **"Trigger deploy"** button (top right)
- Select **"Clear cache and deploy site"**
- Wait 2-3 minutes for build to complete

### 7. Verify It Worked
- After deploy finishes, open: https://beautiful-naiad-2ac0bc.netlify.app
- Open browser console (F12)
- Look for: `🔍 API Base URL configured: https://hotel-management-gv03.onrender.com`
- Try logging in - it should work!

## What You're Changing:
- **OLD (wrong):** `https://hotel-management-system-5iby.onrender.com`
- **NEW (correct):** `https://hotel-management-gv03.onrender.com`

## Why This Is Needed:
- Netlify environment variables in the Dashboard override `netlify.toml`
- The old URL was set in the dashboard
- You must update it in the dashboard for it to take effect

