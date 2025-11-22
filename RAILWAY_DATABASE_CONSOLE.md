# Add Rooms Using Railway Database Console (Easiest Method)

Since external MySQL connections might be blocked, use Railway's built-in console:

## Steps:

1. **Go to Railway Dashboard**
   - Open your Railway project
   - Click on your **MySQL** service

2. **Open Database Tab**
   - Click on the **"Database"** tab (or look for "Query" or "Console" option)
   - Railway should have a built-in SQL query interface

3. **Run the SQL Script**
   - Copy the SQL from `hotel-management/ADD_ROOMS_RAILWAY_SIMPLE.sql`
   - Paste it into the Railway console
   - Click "Run" or "Execute"

4. **Verify**
   - You should see "20 rows affected"
   - Run: `SELECT COUNT(*) FROM rooms;` to verify

## Alternative: If Railway doesn't have a console

Try using the **Railway CLI** or check if there's a "Connect" button that opens a web-based MySQL client.

## If you must use MySQL Workbench:

The password might be case-sensitive. Try:
- Double-check the password from Railway Variables
- Make sure there are no extra spaces
- Try copying the password directly from Railway (don't type it)

Or check Railway's documentation for external connection setup.

