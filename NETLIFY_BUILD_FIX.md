# Netlify Build Fix - Final Solution

## Problem
Build command error: `hotel-management/frontend: Is a directory`

## Root Cause
The build command in Netlify UI is missing `cd` command.

## Solution

### Option 1: Use netlify.toml (Recommended - Automatic)

I've created `netlify.toml` in the repository root. After committing and pushing:

1. **In Netlify Dashboard:**
   - Go to Site settings → Build & deploy
   - **Clear/remove** the Build command field (leave it empty)
   - **Clear/remove** the Publish directory field (leave it empty)
   - Netlify will automatically detect and use `netlify.toml`

2. **Commit and push:**
   ```bash
   git add netlify.toml
   git commit -m "Add netlify.toml to repository root"
   git push
   ```

### Option 2: Manual Fix in Netlify UI (Quick Fix)

If you want to fix it immediately without waiting for git push:

1. **Go to Netlify Dashboard:**
   - Site settings → Build & deploy → Build settings

2. **Update Build command:**
   ```
   cd hotel-management/frontend && npm install && npm run build
   ```
   (Make sure it starts with `cd`)

3. **Update Publish directory:**
   ```
   hotel-management/frontend/build
   ```

4. **Save and redeploy**

## Important Notes

- The build command **MUST** include `cd` to change into the directory
- The `netlify.toml` file must be in the **repository root** (not in hotel-management/)
- After pushing `netlify.toml`, you can remove the manual build settings from Netlify UI

## Environment Variables

Make sure this is set in Netlify → Environment variables:
```
REACT_APP_API_URL=https://hotel-management-system-5iby.onrender.com
```

Or use `REACT_APP_API_BASE_URL` if that's what your code expects.

