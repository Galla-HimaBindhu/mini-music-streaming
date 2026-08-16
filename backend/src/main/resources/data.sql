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
('Butta Bomma', 'Armaan Malik', 'Ala Vaikunthapurramuloo', 'Feel Good', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500&q=80'),
('Samajavaragamana', 'Sid Sriram', 'Ala Vaikunthapurramuloo', 'Feel Good', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3', 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500&q=80'),
('Inkem Inkem', 'Sid Sriram', 'Geetha Govindam', 'Feel Good', 'audio/Inkem%20Inkem%20Inkem%20Kaavaale%20-%20SenSongsMp3.Co.mp3', 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500&q=80'),
('Vachindamma', 'Sid Sriram', 'Geetha Govindam', 'Feel Good', 'audio/Vachindamma%20-%20SenSongsMp3.Co.mp3', 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500&q=80'),
('Choti Choti Baatein', 'DSP', 'Maharshi', 'Feel Good', 'audio/Choti%20Choti%20Baatein%20-%20SenSongsMp3.Co.mp3', 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500&q=80'),
('Life of Ram', 'Pradeep Kumar', 'Jaanu', 'Feel Good', 'audio/The%20Life%20Of%20Ram%20-%20SenSongsMp3.Co%20(1).mp3', 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500&q=80'),
('Nuvvunte Naa Jathaga', 'Sid Sriram', 'I', 'Feel Good', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3', 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500&q=80'),
('Naa Roja Nuvve', 'Hesham Abdul Wahab', 'Kushi', 'Feel Good', 'audio/Na%20Roja%20Nuvve.mp3', 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500&q=80'),
('Emai Poyave', 'Sid Sriram', 'Padi Padi Leche Manasu', 'Feel Good', 'audio/Emai%20Poyave%20-%20SenSongsmp3.Co.mp3', 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500&q=80'),
('Aura Amour', 'Hariharan', 'Aura', 'Feel Good', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3', 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500&q=80'),
('Oo Antava', 'Indravathi Chauhan', 'Pushpa', 'Item Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', 'https://images.unsplash.com/photo-1493225457124-a1a2f595a51c?w=500&q=80'),
('Ramuloo Ramulaa', 'Anurag Kulkarni', 'Ala Vaikunthapurramuloo', 'Item Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3', 'https://images.unsplash.com/photo-1493225457124-a1a2f595a51c?w=500&q=80'),
('Saami Saami', 'Mounika Yadav', 'Pushpa', 'Item Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3', 'https://images.unsplash.com/photo-1493225457124-a1a2f595a51c?w=500&q=80'),
('Blockbuster', 'Shreya Ghoshal', 'Sarrainodu', 'Item Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3', 'https://images.unsplash.com/photo-1493225457124-a1a2f595a51c?w=500&q=80'),
('Jigelu Rani', 'Rela Kumar', 'Rangasthalam', 'Item Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3', 'https://images.unsplash.com/photo-1493225457124-a1a2f595a51c?w=500&q=80'),
('Swing Zara', 'Neha Bhasin', 'Jai Lava Kusa', 'Item Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3', 'https://images.unsplash.com/photo-1493225457124-a1a2f595a51c?w=500&q=80'),
('Aakalesthe Annam Pedtha', 'Shreya Ghoshal', 'Shankar Dada Zindabad', 'Item Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3', 'https://images.unsplash.com/photo-1493225457124-a1a2f595a51c?w=500&q=80'),
('Bhoom Bhaddhal', 'Mangli', 'Krack', 'Item Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3', 'https://images.unsplash.com/photo-1493225457124-a1a2f595a51c?w=500&q=80'),
('Dimaak Kharaab', 'Keerthana Sharma', 'iSmart Shankar', 'Item Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3', 'https://images.unsplash.com/photo-1493225457124-a1a2f595a51c?w=500&q=80'),
('Pakka Local', 'Sagar', 'Janatha Garage', 'Item Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3', 'https://images.unsplash.com/photo-1493225457124-a1a2f595a51c?w=500&q=80'),
('Undiporaadhey', 'Sid Sriram', 'Hushaaru', 'Melody Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500&q=80'),
('Nee Kannu Neeli Samudram', 'Javed Ali', 'Uppena', 'Melody Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500&q=80'),
('Pilla Raa', 'Anurag Kulkarni', 'RX 100', 'Melody Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500&q=80'),
('Kalaavathi', 'Sid Sriram', 'Sarkaru Vaari Paata', 'Melody Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500&q=80'),
('Kumkumala', 'Sid Sriram', 'Brahmastra', 'Melody Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500&q=80'),
('Mellaga Tattindi', 'Shreya Ghoshal', 'Varsham', 'Melody Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500&q=80'),
('Hoyna Hoyna', 'Anirudh', 'Nani s Gang Leader', 'Melody Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500&q=80'),
('Telusa Telusa', 'Jubin Nautiyal', 'Sarrainodu', 'Melody Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500&q=80'),
('Oke Oka Lokam', 'Sid Sriram', 'Sashi', 'Melody Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500&q=80'),
('Adiga Adiga', 'Sid Sriram', 'Ninnu Kori', 'Melody Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500&q=80'),
('Peniviti', 'Kaala Bhairava', 'Aravindha Sametha', 'Sad Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500&q=80'),
('Ninnu Kori', 'Karthik', 'Ninnu Kori', 'Sad Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3', 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500&q=80'),
('Manasa Manasa', 'Sid Sriram', 'Most Eligible Bachelor', 'Sad Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3', 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500&q=80'),
('Kallalona', 'Devi Sri Prasad', '100 Percent Love', 'Sad Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3', 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500&q=80'),
('Priyathama Priyathama', 'Chinmayi', 'Majili', 'Sad Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3', 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500&q=80'),
('O Yadhira', 'Anirudh', 'Jersey', 'Sad Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3', 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500&q=80'),
('Yemito', 'Haricharan', 'Andala Rakshasi', 'Sad Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3', 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500&q=80'),
('Em Sandeham Ledu', 'Kalyani Malik', 'Oohalu Gusagusalade', 'Sad Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3', 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500&q=80'),
('Naa Pranam', 'Sid Sriram', 'Vaanam', 'Sad Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3', 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500&q=80'),
('Okey Oka Lokam Nuve', 'Sid Sriram', 'Sashi', 'Sad Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3', 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500&q=80'),
('Ninnu Chuse Anandamlo', 'Sid Sriram', 'Gang Leader', 'Romantic Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', 'https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?w=500&q=80'),
('Padi Padi Leche Manasu', 'Armaan Malik', 'Padi Padi Leche Manasu', 'Romantic Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3', 'https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?w=500&q=80'),
('Arere Yekkada', 'Naresh Iyer', 'Nenu Local', 'Romantic Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3', 'https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?w=500&q=80'),
('Darshana', 'Hesham Abdul Wahab', 'Hridayam', 'Romantic Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3', 'https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?w=500&q=80'),
('Neeli Neeli Aakasam', 'Sid Sriram', '30 Rojullo Preminchadam Ela', 'Romantic Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3', 'https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?w=500&q=80'),
('Vellipomaakey', 'Sid Sriram', 'Sahasam Swasaga Sagipo', 'Romantic Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3', 'https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?w=500&q=80'),
('Nee Chiretu', 'Anurag Kulkarni', 'Fidaa', 'Romantic Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3', 'https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?w=500&q=80'),
('O Rendu Prema Meghaalila', 'Sreerama Chandra', 'Baby', 'Romantic Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3', 'https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?w=500&q=80'),
('Urike Urike', 'Sid Sriram', 'HIT 2', 'Romantic Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3', 'https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?w=500&q=80'),
('Gira Gira', 'Gowtham Bharadwaj', 'Dear Comrade', 'Romantic Songs', 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3', 'https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?w=500&q=80'),
('Endhan Nenjil', 'K J Yesudas', 'Unknown', 'Favourites', 'audio/favourites/Endhan%20Nenjil%20-%20K%20J%20Yesudas%2C%20S%20Janaki%20-%20MassTamilan.mp3', 'https://images.unsplash.com/photo-1493225457124-a1a2f595a51c?w=500&q=80'),
('Gundello Emundo', 'Unknown', 'Unknown', 'Favourites', 'audio/favourites/Gundello%20Emundo-SenSongsMp3.Co.mp3', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500&q=80'),
('Na Manasune', 'Unknown', 'Unknown', 'Favourites', 'audio/favourites/Na%20Manasune%20-SenSongsMp3.Co.mp3', 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500&q=80'),
('Nenu Nenuga', 'Unknown', 'Unknown', 'Favourites', 'audio/favourites/Nenu%20Nenuga%20-SenSongsMp3.Co.mp3', 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500&q=80'),
('Nuvvena', 'Unknown', 'Unknown', 'Favourites', 'audio/favourites/Nuvvena.mp3', 'https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=500&q=80'),
('Vache Vache', 'Unknown', 'Unknown', 'Favourites', 'audio/favourites/Vache%20Vache.mp3', 'https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?w=500&q=80');

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

-- 5. Insert Favorites (IDs 64 to 69 are the local favourites)
INSERT INTO favorites (user_id, song_id) VALUES
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69);

-- 6. Insert new Romantic Playlist Songs (Local Files)
INSERT INTO songs (title, artist, album, genre, audio_url, cover_image) VALUES
('Baby He Loves You', 'Unknown', 'Arya', 'Romantic Songs', 'audio/Playlist/romantic%20songs/3-Baby%20He%20Loves%20You-SenSongsMp3.Co.mp3', 'https://images.unsplash.com/photo-1518609878373-06d740f60d8b?w=500&q=80'),
('Feel My Love', 'Unknown', 'Arya', 'Romantic Songs', 'audio/Playlist/romantic%20songs/Feel%20My%20Love-SenSongsMp3.Com.mp3', 'https://images.unsplash.com/photo-1474552226712-ac0f0961a954?w=500&q=80'),
('Madhurame', 'Unknown', 'Unknown', 'Romantic Songs', 'audio/Playlist/romantic%20songs/Madhurame%20-%20SenSongsMp3.Co.mp3', 'https://images.unsplash.com/photo-1516589178581-6cd7833ae3b2?w=500&q=80'),
('Meri Jaan', 'Unknown', 'Gangubai Kathiawadi', 'Romantic Songs', 'audio/Playlist/romantic%20songs/Meri%20Jaan%20Gangubai%20Kathiawadi%20128%20Kbps.mp3', 'https://images.unsplash.com/photo-1494774157365-9e04c6720e47?w=500&q=80'),
('Zara Zara', 'Unknown', 'Rehnaa Hai Terre Dil Mein', 'Romantic Songs', 'audio/Playlist/romantic%20songs/Zara%20Zara%20Rehnaa%20Hai%20Terre%20Dil%20Mein%20128%20Kbps.mp3', 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500&q=80');

-- 7. Insert the new Playlist
INSERT INTO playlists (name, user_id) VALUES
('My Romantic Songs', 2);

-- 8. Add the new local songs (IDs 70, 71, 72, 73, 74) to the new playlist (ID 3)
INSERT INTO playlist_songs (playlist_id, song_id) VALUES
(3, 70),
(3, 71),
(3, 72),
(3, 73),
(3, 74);

