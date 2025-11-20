-- Update existing rooms that might be missing images
-- This will add high-quality Unsplash images to rooms that don't have them

USE hotel_booking;

-- First, check which rooms are missing images
SELECT id, room_type, room_photo_url FROM rooms WHERE room_photo_url IS NULL OR room_photo_url = '';

-- Update rooms with missing or placeholder images
-- Update rooms with diverse, high-quality Unsplash images
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND room_type LIKE '%King%';
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND room_type LIKE '%Twin%';
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND room_type LIKE '%Suite%';
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND room_type LIKE '%Family%';
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND (room_type LIKE '%Ocean%' OR room_type LIKE '%View%');
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND (room_type LIKE '%Garden%' OR room_type LIKE '%Terrace%' OR room_type LIKE '%Pavilion%');
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1595576508892-0b3a3e7a8b0e?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND room_type LIKE '%Presidential%';
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND (room_type LIKE '%Wellness%' OR room_type LIKE '%Spa%');
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND (room_type LIKE '%Business%' OR room_type LIKE '%Studio%' OR room_type LIKE '%Loft%');
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND (room_type LIKE '%Cabin%' OR room_type LIKE '%Penthouse%');
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND (room_type LIKE '%Romantic%' OR room_type LIKE '%Urban%');
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND (room_type LIKE '%Art%' OR room_type LIKE '%Deco%');
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND (room_type LIKE '%Tropical%' OR room_type LIKE '%Paradise%');
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND (room_type LIKE '%Modern%' OR room_type LIKE '%Minimalist%');
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&h=600&fit=crop' WHERE (room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%') AND (room_type LIKE '%Vintage%' OR room_type LIKE '%Classic%');

-- For any remaining rooms without images, assign a default image
UPDATE rooms SET room_photo_url = 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800&h=600&fit=crop' WHERE room_photo_url IS NULL OR room_photo_url = '' OR room_photo_url LIKE '%placeholder%';

-- Verify all rooms have images
SELECT id, room_type, room_photo_url FROM rooms WHERE room_photo_url IS NULL OR room_photo_url = '';
SELECT COUNT(*) as rooms_with_images FROM rooms WHERE room_photo_url IS NOT NULL AND room_photo_url != '';
SELECT COUNT(*) as total_rooms FROM rooms;

