-- Check all rooms and their images
USE hotel_booking;

-- Show all rooms with their details
SELECT id, room_type, room_price, 
       CASE 
           WHEN room_photo_url IS NULL OR room_photo_url = '' THEN 'NO IMAGE'
           ELSE 'HAS IMAGE'
       END as image_status,
       LEFT(room_photo_url, 50) as image_url_preview
FROM rooms 
ORDER BY id DESC;

-- Count by room type
SELECT room_type, COUNT(*) as count 
FROM rooms 
GROUP BY room_type 
ORDER BY count DESC;

