-- SQL script to insert 20 rooms into Railway MySQL database
-- Database: railway
-- Run this after connecting to: gondola.proxy.rlwy.net:13594

USE railway;

INSERT INTO rooms (room_type, room_price, room_photo_url, room_description) VALUES
('Cozy Cabin', 189.00, 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&h=600&fit=crop', 'Rustic charm with wood paneling, fireplace, and mountain-inspired decor. Perfect for a peaceful retreat.'),
('Urban Loft', 259.00, 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&h=600&fit=crop', 'Industrial-chic loft with exposed brick, high ceilings, and city skyline views. Modern and stylish.'),
('Skyline Loft', 279.00, 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800&h=600&fit=crop', 'Loft-style room with open living area and kitchenette. Panoramic city views from floor-to-ceiling windows.'),
('Deluxe King', 199.00, 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800&h=600&fit=crop', 'Spacious room with a king bed, rainfall shower, and city skyline views. Premium comfort and elegance.'),
('Premium Twin', 159.00, 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&h=600&fit=crop', 'Two plush twin beds, ergonomic workspace, perfect for friends or colleagues traveling together.'),
('Executive Suite', 289.00, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&h=600&fit=crop', 'Separate living area, dining nook, and complimentary executive lounge access. Ideal for business travelers.'),
('Family Deluxe', 219.00, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&h=600&fit=crop', 'Ideal for families with two queen beds, sofa sleeper, and kid-friendly amenities. Spacious and comfortable.'),
('Ocean View King', 249.00, 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800&h=600&fit=crop', 'Panoramic ocean vistas, private balcony, and in-room espresso station. Wake up to stunning sea views.'),
('Garden Terrace', 189.00, 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&h=600&fit=crop', 'Ground-floor room with private terrace opening onto tranquil gardens. Perfect for nature lovers.'),
('Presidential Suite', 499.00, 'https://images.unsplash.com/photo-1595576508892-0b3a3e7a8b0e?w=800&h=600&fit=crop', 'Two-bedroom suite with grand living room, kitchenette, and butler service. Ultimate luxury experience.'),
('Wellness Retreat', 269.00, 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&h=600&fit=crop', 'In-room yoga gear, air purification, and complimentary spa hydrotherapy pass. Rejuvenate and relax.'),
('Business Studio', 179.00, 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800&h=600&fit=crop', 'Open-concept layout with sit-stand desk, fast Wi-Fi, and smart TV conferencing. Perfect for remote work.'),
('Loft Penthouse', 379.00, 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&h=600&fit=crop', 'Bi-level loft with floor-to-ceiling windows, soaking tub, and private rooftop deck. Exclusive and luxurious.'),
('Romantic Suite', 329.00, 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&h=600&fit=crop', 'Intimate suite with king bed, jacuzzi, champagne service, and sunset views. Perfect for couples.'),
('Spa Suite', 349.00, 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&h=600&fit=crop', 'Luxury suite with private sauna, steam room, and in-room massage area. Ultimate relaxation experience.'),
('Skyline Penthouse', 429.00, 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800&h=600&fit=crop', 'Top-floor penthouse with 360-degree views, private elevator, and rooftop access. The pinnacle of luxury.'),
('Art Deco Suite', 299.00, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&h=600&fit=crop', 'Elegantly designed suite with vintage furnishings and curated art collection. Timeless sophistication.'),
('Tropical Paradise', 239.00, 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&h=600&fit=crop', 'Caribbean-inspired room with bamboo accents, tropical plants, and ocean breeze. Island vibes in the city.'),
('Modern Minimalist', 199.00, 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800&h=600&fit=crop', 'Sleek contemporary design with smart home controls and minimalist aesthetics. Clean and modern.'),
('Vintage Classic', 219.00, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&h=600&fit=crop', 'Timeless elegance with antique furniture, four-poster bed, and period details. Classic charm and comfort.');

-- Verify rooms were added
SELECT COUNT(*) as total_rooms FROM rooms;
SELECT id, room_type, room_price, room_photo_url FROM rooms ORDER BY id DESC LIMIT 20;

