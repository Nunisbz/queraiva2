INSERT INTO artists (nome, bio, "imageUrl", "createdAt", "updatedAt") VALUES
('Anitta', 'Cantora, compositora e empresária brasileira, conhecida por sua música pop e sucesso internacional.', 'https://example.com/anitta.jpg', NOW(), NOW()),
('Luan Santana', 'Cantor e compositor de música sertaneja, famoso por suas baladas românticas e grande popularidade no Brasil.', 'https://example.com/luan_santana.jpg', NOW(), NOW()),
('Ivete Sangalo', 'Cantora baiana de música pop, axé e samba, reconhecida por sua energia no palco e seu carisma.', 'https://example.com/ivete_sangalo.jpg', NOW(), NOW());


INSERT INTO albums (title, "releaseYear", "coverImageUrl", "createdAt", "updatedAt", artista_id) VALUES
('Vai Malandra', 2018, 'https://example.com/vaimalandra.jpg', NOW(), NOW(), 1),
('Versions of Me', 2022, 'https://example.com/versionsofme.jpg', NOW(), NOW(), 1),
('Viva', 2013, 'https://example.com/viva.jpg', NOW(), NOW(), 2),
('Ao Vivo no Maracanã', 2017, 'https://example.com/aovivonomaracana.jpg', NOW(), NOW(), 2),
('Festa no Mar', 2015, 'https://example.com/festanomart.jpg', NOW(), NOW(), 3),
('Ivete Sangalo Ao Vivo', 2007, 'https://example.com/ivetesangalovivo.jpg', NOW(), NOW(), 3);

INSERT INTO musicas (titulo, duracao, "fileUrl", "createdAt", "updatedAt", artista_id, album_id) VALUES
('Vai Malandra', 123, 'https://example.com/vaimalandra.mp3', NOW(), NOW(), 1, 1),
('Machika', 123, 'https://example.com/machika.mp3', NOW(), NOW(), 1, 1),
('Indecente', 312, 'https://example.com/indecente.mp3', NOW(), NOW(), 1, 1),
('Sim ou Não', 321, 'https://example.com/simounao.mp3', NOW(), NOW(), 1, 1),
('Na Sua Cara', 123, 'https://example.com/nasuacara.mp3', NOW(), NOW(), 1, 1),
('Me Gusta', 321, 'https://example.com/megusta.mp3', NOW(), NOW(), 2, 3),
('Girl From Rio', 123, 'https://example.com/girlfromrio.mp3', NOW(), NOW(), 2, 3),
('Loco', 321, 'https://example.com/loco.mp3', NOW(), NOW(), 2, 3),
('Tô Preocupada', 123, 'https://example.com/topreocupada.mp3', NOW(), NOW(), 2, 3),
('Como Anaconda', 321, 'https://example.com/comoanaconda.mp3', NOW(), NOW(), 2, 3),
('Te Esperando', 123, 'https://example.com/teesperando.mp3', NOW(), NOW(), 3, 5),
('Quando a Bad Bater', 321, 'https://example.com/quandobad.mp3', NOW(), NOW(), 3, 5),
('Escreve Aí', 123, 'https://example.com/escreveai.mp3', NOW(), NOW(), 3, 5),
('Coração Cigano', 321, 'https://example.com/coracaocigano.mp3', NOW(), NOW(), 3, 5),
('Acordando o Prédio', 123, 'https://example.com/acordandoopredio.mp3', NOW(), NOW(), 3, 5),
('Meteoro', 321, 'https://example.com/meteoro.mp3', NOW(), NOW(), 3, 6),
('Tô de Cara', 123, 'https://example.com/todecara.mp3', NOW(), NOW(), 3, 6),
('Sogrão Caprichou', 321, 'https://example.com/sograocaprichou.mp3', NOW(), NOW(), 3, 6),
('Lindo, Gostoso e Carinhoso', 123, 'https://example.com/lindogostosocarinhoso.mp3', NOW(), NOW(), 3, 6),
('Te Assumi Pro Brasil', 321, 'https://example.com/teassumiprobrasil.mp3', NOW(), NOW(), 3, 6),
('Festa no Mar', 123, 'https://example.com/festanomarb.mp3', NOW(), NOW(), 3, 6),
('Abalou', 321, 'https://example.com/abalou.mp3', NOW(), NOW(), 3, 6),
('Se Eu Não Te Amasse Tanto Assim', 123, 'https://example.com/senaonteamassetantoassim.mp3', NOW(), NOW(), 3, 6),
('Sorte Grande', 321, 'https://example.com/sortegrande.mp3', NOW(), NOW(), 3, 6),
('Céu da Boca', 123, 'https://example.com/ceudaboca.mp3', NOW(), NOW(), 3, 6),
('Real Fantasia', 321, 'https://example.com/realfantasia.mp3', NOW(), NOW(), 3, 5),
('Eva', 123, 'https://example.com/eva.mp3', NOW(), NOW(), 3, 5),
('Vem Morena', 321, 'https://example.com/vemmorena.mp3', NOW(), NOW(), 3, 5),
('Deixa a Vida Me Levar', 123, 'https://example.com/deixavida.mp3', NOW(), NOW(), 3, 5),
('Aquela dos 30', 321, 'https://example.com/aquelados30.mp3', NOW(), NOW(), 3, 5);
-- Expanded Database Schema

-- Table for Albums
CREATE TABLE IF NOT EXISTS albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    artist_id INT REFERENCES artists(id) ON DELETE CASCADE,
    release_date DATE,
    cover_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Table for Songs
CREATE TABLE IF NOT EXISTS songs (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    album_id INT REFERENCES albums(id) ON DELETE CASCADE,
    duration INT, -- Duration in seconds
    audio_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Sample Data for Albums
INSERT INTO albums (title, artist_id, release_date, cover_url)
VALUES
('Album 1', 1, '2022-01-01', 'https://example.com/album1.jpg'),
('Album 2', 2, '2023-01-01', 'https://example.com/album2.jpg')
ON CONFLICT DO NOTHING;

-- Sample Data for Songs
INSERT INTO songs (title, album_id, duration, audio_url)
VALUES
('Song 1', 1, 200, 'https://example.com/song1.mp3'),
('Song 2', 1, 250, 'https://example.com/song2.mp3'),
('Song 3', 2, 300, 'https://example.com/song3.mp3')
ON CONFLICT DO NOTHING;

-- Playback History Table

-- Create a playback history table
CREATE TABLE IF NOT EXISTS playback_history (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    song_id INT REFERENCES songs(id) ON DELETE CASCADE,
    played_at TIMESTAMP DEFAULT NOW()
);

-- Update the songs route to log playback in the history
-- This code will be added to the playSong handler in the backend

-- User Subscription Support

-- Add a subscription column to the users table
ALTER TABLE users ADD COLUMN IF NOT EXISTS is_subscriber BOOLEAN DEFAULT FALSE;

-- Route to simulate updating subscription status
-- This logic will be added to the auth routes
