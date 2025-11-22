# Add Rooms to Railway MySQL Database

## Connection Details (from your Railway dashboard):
- **Host:** `tramway.proxy.rlwy.net`
- **Port:** `24748`
- **Username:** `root`
- **Password:** `MhbAofDQQWQbCfsYTSuloAgkQtTzrodk`
- **Database:** `railway`

## Method 1: Railway MySQL Console (Easiest)

1. Go to Railway Dashboard → Your MySQL service
2. Click on **"Database"** tab (or look for "Query" or "Console" option)
3. Open the MySQL query console
4. Copy the SQL from `hotel-management/ADD_ROOMS_RAILWAY.sql`
5. Paste and execute it

## Method 2: MySQL Workbench

1. Open MySQL Workbench
2. Click **"+"** to create new connection
3. Enter:
   - **Connection Name:** Railway MySQL
   - **Hostname:** `tramway.proxy.rlwy.net`
   - **Port:** `24748`
   - **Username:** `root`
   - **Password:** `MhbAofDQQWQbCfsYTSuloAgkQtTzrodk`
4. Click **"Test Connection"** (you may get a version warning - click "Continue Anyway")
5. Click **"OK"** to save
6. Double-click the connection to connect
7. Open `hotel-management/ADD_ROOMS_RAILWAY.sql`
8. Select all SQL statements
9. Execute (Ctrl+Shift+Enter or click Execute button)

## Method 3: Command Line (if MySQL is installed)

```bash
mysql -h tramway.proxy.rlwy.net -P 24748 -u root -p'MhbAofDQQWQbCfsYTSuloAgkQtTzrodk' railway < hotel-management/ADD_ROOMS_RAILWAY.sql
```

Or on Windows PowerShell:
```powershell
Get-Content hotel-management/ADD_ROOMS_RAILWAY.sql | mysql -h tramway.proxy.rlwy.net -P 24748 -u root -p'MhbAofDQQWQbCfsYTSuloAgkQtTzrodk' railway
```

## After Adding Rooms:

1. Verify rooms were added:
   ```sql
   SELECT COUNT(*) FROM rooms;
   SELECT id, room_type, room_price FROM rooms ORDER BY id DESC LIMIT 5;
   ```

2. Refresh your Netlify site: https://peaceful-druid-0615e9.netlify.app/rooms
3. Rooms should now appear!

## Troubleshooting:

- **Connection timeout:** Railway may have firewall rules. Try the Railway console method instead.
- **Version warning:** Click "Continue Anyway" - it should still work.
- **No rooms showing:** Wait 10-30 seconds for the backend to refresh, then refresh the page.

