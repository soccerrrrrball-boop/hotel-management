# How to Add 20 Rooms to Database

## Option 1: Using MySQL Command Line (Recommended)

1. **Connect to your MySQL database:**
   ```bash
   mysql -u root -p
   ```

2. **Run the SQL script:**
   ```sql
   source hotel-management/ADD_20_ROOMS.sql
   ```
   
   OR copy and paste the contents of `ADD_20_ROOMS.sql` directly into MySQL.

## Option 2: Using MySQL Workbench or phpMyAdmin

1. Open MySQL Workbench or phpMyAdmin
2. Select the `hotel_booking` database
3. Open the SQL tab
4. Copy and paste the contents of `ADD_20_ROOMS.sql`
5. Execute the script

## Option 3: Using Render Database (If using Render's MySQL)

1. Go to Render Dashboard
2. Find your MySQL database service
3. Click on it to open the database dashboard
4. Use the SQL editor or connect via external tool
5. Run the SQL script

## Option 4: Using Railway Database (If using Railway)

1. Go to Railway Dashboard
2. Find your MySQL database
3. Click "Query" or "Connect" 
4. Run the SQL script

## Verification

After running the script, verify rooms were added:

```sql
SELECT COUNT(*) as total_rooms FROM rooms;
SELECT id, room_type, room_price FROM rooms ORDER BY id DESC LIMIT 20;
```

You should see 20 new rooms with IDs, types, prices, and image URLs.

## Notes

- All rooms use high-quality Unsplash images
- Images are set to 800x600 resolution for optimal loading
- Room prices range from $159 to $499
- All rooms have descriptive text
- Rooms will automatically get IDs when inserted

## Troubleshooting

If you get errors:
- Make sure you're using the correct database name (`hotel_booking`)
- Check that the `rooms` table exists
- Verify column names match your schema
- Ensure you have INSERT permissions

