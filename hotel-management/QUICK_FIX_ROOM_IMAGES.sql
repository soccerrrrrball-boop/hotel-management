-- Quick fix: Ensure ALL rooms have images
-- Copy and paste this into MySQL

USE hotel_booking;

-- Set images for all rooms that are missing them
UPDATE rooms 
SET room_photo_url = CASE 
    WHEN room_type LIKE '%King%' THEN 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Twin%' THEN 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Suite%' THEN 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Family%' THEN 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Ocean%' OR room_type LIKE '%View%' THEN 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Garden%' OR room_type LIKE '%Terrace%' OR room_type LIKE '%Pavilion%' THEN 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Presidential%' THEN 'https://images.unsplash.com/photo-1595576508892-0b3a3e7a8b0e?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Wellness%' OR room_type LIKE '%Spa%' THEN 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Business%' OR room_type LIKE '%Studio%' OR room_type LIKE '%Loft%' THEN 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Cabin%' OR room_type LIKE '%Penthouse%' THEN 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Romantic%' OR room_type LIKE '%Urban%' THEN 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Art%' OR room_type LIKE '%Deco%' THEN 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Tropical%' OR room_type LIKE '%Paradise%' THEN 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Modern%' OR room_type LIKE '%Minimalist%' THEN 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800&h=600&fit=crop'
    WHEN room_type LIKE '%Vintage%' OR room_type LIKE '%Classic%' THEN 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&h=600&fit=crop'
    ELSE 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800&h=600&fit=crop'
END
WHERE room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%';

-- Verify
SELECT COUNT(*) as total_rooms FROM rooms;
SELECT COUNT(*) as rooms_with_images FROM rooms WHERE room_photo_url IS NOT NULL AND room_photo_url != '' AND room_photo_url NOT LIKE '%placeholder%';
SELECT id, room_type, room_photo_url FROM rooms ORDER BY id DESC LIMIT 10;

