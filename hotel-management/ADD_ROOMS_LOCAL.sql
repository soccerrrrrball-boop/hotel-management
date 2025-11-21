-- SQL script to add rooms to the local hotel_booking database
-- Run this in MySQL: mysql -u root -p123456789 hotel_booking < ADD_ROOMS_LOCAL.sql
-- Or copy and paste into MySQL Workbench/command line

USE hotel_booking;

-- Insert 20 diverse rooms with high-quality images
-- Note: price, room_number, capacity, and is_available are required fields
INSERT INTO rooms (room_type, room_price, room_photo_url, room_description, price, room_number, capacity, is_available, status) VALUES
('Deluxe King', 199.00, 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800&h=600&fit=crop', 'Spacious room with a king bed, rainfall shower, and city skyline views. Premium comfort and elegance.', 199.00, 101, 2, 1, 'AVAILABLE'),
('Premium Twin', 159.00, 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&h=600&fit=crop', 'Two plush twin beds, ergonomic workspace, perfect for friends or colleagues traveling together.', 159.00, 102, 2, 1, 'AVAILABLE'),
('Executive Suite', 289.00, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&h=600&fit=crop', 'Separate living area, dining nook, and complimentary executive lounge access. Ideal for business travelers.', 289.00, 201, 2, 1, 'AVAILABLE'),
('Family Deluxe', 219.00, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&h=600&fit=crop', 'Ideal for families with two queen beds, sofa sleeper, and kid-friendly amenities. Spacious and comfortable.', 219.00, 103, 4, 1, 'AVAILABLE'),
('Ocean View King', 249.00, 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800&h=600&fit=crop', 'Panoramic ocean vistas, private balcony, and in-room espresso station. Wake up to stunning sea views.', 249.00, 301, 2, 1, 'AVAILABLE'),
('Garden Terrace', 189.00, 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&h=600&fit=crop', 'Ground-floor room with private terrace opening onto tranquil gardens. Perfect for nature lovers.', 189.00, 104, 2, 1, 'AVAILABLE'),
('Presidential Suite', 499.00, 'https://images.unsplash.com/photo-1595576508892-0b3a3e7a8b0e?w=800&h=600&fit=crop', 'Two-bedroom suite with grand living room, kitchenette, and butler service. Ultimate luxury experience.', 499.00, 501, 4, 1, 'AVAILABLE'),
('Wellness Retreat', 269.00, 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&h=600&fit=crop', 'In-room yoga gear, air purification, and complimentary spa hydrotherapy pass. Rejuvenate and relax.', 269.00, 302, 2, 1, 'AVAILABLE'),
('Business Studio', 179.00, 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800&h=600&fit=crop', 'Open-concept layout with sit-stand desk, fast Wi-Fi, and smart TV conferencing. Perfect for remote work.', 179.00, 105, 1, 1, 'AVAILABLE'),
('Loft Penthouse', 379.00, 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&h=600&fit=crop', 'Bi-level loft with floor-to-ceiling windows, soaking tub, and private rooftop deck. Exclusive and luxurious.', 379.00, 502, 2, 1, 'AVAILABLE'),
('Romantic Suite', 329.00, 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&h=600&fit=crop', 'Intimate suite with king bed, jacuzzi, champagne service, and sunset views. Perfect for couples.', 329.00, 303, 2, 1, 'AVAILABLE'),
('Spa Suite', 349.00, 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&h=600&fit=crop', 'Luxury suite with private sauna, steam room, and in-room massage area. Ultimate relaxation experience.', 349.00, 401, 2, 1, 'AVAILABLE'),
('Skyline Penthouse', 429.00, 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800&h=600&fit=crop', 'Top-floor penthouse with 360-degree views, private elevator, and rooftop access. The pinnacle of luxury.', 429.00, 503, 2, 1, 'AVAILABLE'),
('Art Deco Suite', 299.00, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&h=600&fit=crop', 'Elegantly designed suite with vintage furnishings and curated art collection. Timeless sophistication.', 299.00, 304, 2, 1, 'AVAILABLE'),
('Tropical Paradise', 239.00, 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&h=600&fit=crop', 'Caribbean-inspired room with bamboo accents, tropical plants, and ocean breeze. Island vibes in the city.', 239.00, 106, 2, 1, 'AVAILABLE'),
('Modern Minimalist', 199.00, 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800&h=600&fit=crop', 'Sleek contemporary design with smart home controls and minimalist aesthetics. Clean and modern.', 199.00, 107, 2, 1, 'AVAILABLE'),
('Vintage Classic', 219.00, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&h=600&fit=crop', 'Timeless elegance with antique furniture, four-poster bed, and period details. Classic charm and comfort.', 219.00, 108, 2, 1, 'AVAILABLE'),
('Urban Loft', 259.00, 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&h=600&fit=crop', 'Industrial-chic loft with exposed brick, high ceilings, and city skyline views. Modern and stylish.', 259.00, 202, 2, 1, 'AVAILABLE'),
('Cozy Cabin', 189.00, 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&h=600&fit=crop', 'Rustic charm with wood paneling, fireplace, and mountain-inspired decor. Perfect for a peaceful retreat.', 189.00, 109, 2, 1, 'AVAILABLE'),
('Skyline Loft', 279.00, 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800&h=600&fit=crop', 'Loft-style room with open living area and kitchenette. Panoramic city views from floor-to-ceiling windows.', 279.00, 203, 2, 1, 'AVAILABLE');

-- Verify rooms were added
SELECT COUNT(*) AS total_rooms FROM rooms;
SELECT id, room_type, room_price FROM rooms ORDER BY id DESC LIMIT 5;

