# Why Netlify Still Uses Old URL - Troubleshooting

## Common Reasons:

### 1. **No New Deploy After Updating Environment Variable**
- Environment variables are only used during the BUILD process
- If you updated the variable but didn't trigger a new deploy, the old build is still live
- **Solution:** You MUST trigger a new deploy after changing environment variables

### 2. **Browser Cache**
- Your browser might be serving the old JavaScript bundle from cache
- **Solution:** Hard refresh (Ctrl+Shift+R or Cmd+Shift+R) or clear browser cache

### 3. **Multiple Environment Variables**
- Check if there are multiple `REACT_APP_API_URL` variables for different contexts
- **Solution:** Make sure "All scopes" is selected, or check each context individually

### 4. **Build Cache**
- Netlify might be using cached build artifacts
- **Solution:** Use "Clear cache and deploy site" option

## Step-by-Step Fix:

### Step 1: Verify Environment Variable
1. Go to Netlify → Your site → Site settings → Environment variables
2. Find `REACT_APP_API_URL`
3. Make sure it shows: `https://hotel-management-gv03.onrender.com`
4. Make sure "All scopes" is selected
5. Make sure "Same value for all deploy contexts" is selected
6. Click "Save variable" (even if it's already saved)

### Step 2: Clear Cache and Redeploy
1. Go to "Deploys" tab
2. Click "Trigger deploy" → "Clear cache and deploy site"
3. **Wait for build to complete** (2-3 minutes)
4. Check the build logs to ensure it completed successfully

### Step 3: Clear Browser Cache
1. Open your site
2. Hard refresh: **Ctrl+Shift+R** (Windows) or **Cmd+Shift+R** (Mac)
3. Or: Open DevTools (F12) → Right-click refresh button → "Empty Cache and Hard Reload"

### Step 4: Verify in Console
1. Open browser console (F12)
2. Look for: `🔍 API Base URL configured: https://hotel-management-gv03.onrender.com`
3. If you see the old URL, the deploy didn't pick up the new variable

## If Still Not Working:

### Check Build Logs
1. Go to "Deploys" tab
2. Click on the latest deploy
3. Check the build logs
4. Look for `REACT_APP_API_URL` in the logs
5. It should show the new URL during build

### Check for Multiple Variables
1. In Environment variables, search for `REACT_APP_API_URL`
2. Make sure there's only ONE variable with this name
3. If there are multiple, delete the old ones

### Force Rebuild
1. Go to "Deploys" tab
2. Click "Trigger deploy" → "Clear cache and deploy site"
3. Wait for completion
4. Test again

