-- Create Database
CREATE DATABASE IF NOT EXISTS music_app;
USE music_app;

-- Note: Tables are automatically created by Hibernate/Spring Boot.
-- The data below can be inserted AFTER the application runs for the first time
-- so that the tables exist.

-- Alternatively, run these INSERTs if you want some dummy data.

-- 1. Insert Users (Password is 'password' hashed with BCrypt: $2a$10$WqB8xY3b1K7H9lQ.6x1W8eyO9bYc4X/lV8dG9Q6j5L5v2o1V2L4jO )
INSERT INTO users (name, email, password, role) VALUES 
('Admin User', 'admin@musicapp.com', '$2a$10$WqB8xY3b1K7H9lQ.6x1W8eyO9bYc4X/lV8dG9Q6j5L5v2o1V2L4jO', 'ADMIN'),
('Test User', 'user@musicapp.com', '$2a$10$WqB8xY3b1K7H9lQ.6x1W8eyO9bYc4X/lV8dG9Q6j5L5v2o1V2L4jO', 'USER');

-- 2. Insert Songs (Using legal demo URLs or placeholder audio)
INSERT INTO songs (title, artist, album, genre, audio_url, cover_image) VALUES
('Creative Minds', 'Bensound', 'Free Music', 'Pop', 'https://www.bensound.com/bensound-music/bensound-creativeminds.mp3', 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500&q=80'),
('A New Beginning', 'Bensound', 'Royalty Free', 'Rock', 'https://www.bensound.com/bensound-music/bensound-anewbeginning.mp3', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500&q=80'),
('Summer', 'Bensound', 'Vibes', 'Electronic', 'https://www.bensound.com/bensound-music/bensound-summer.mp3', 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500&q=80'),
('Ukulele', 'Bensound', 'Acoustic', 'Folk', 'https://www.bensound.com/bensound-music/bensound-ukulele.mp3', 'https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=500&q=80'),
('Energy', 'Bensound', 'Action', 'Electronic', 'https://www.bensound.com/bensound-music/bensound-energy.mp3', 'https://images.unsplash.com/photo-1493225457124-a1a2f595a51c?w=500&q=80');

-- 3. Insert Playlists
INSERT INTO playlists (name, user_id) VALUES
('My Favorites', 2),
('Workout Mix', 2);

-- 4. Insert Playlist Songs
INSERT INTO playlist_songs (playlist_id, song_id) VALUES
(1, 1),
(1, 3),
(2, 5),
(2, 2);

-- 5. Insert Favorites
INSERT INTO favorites (user_id, song_id) VALUES
(2, 1),
(2, 3),
(2, 4);
