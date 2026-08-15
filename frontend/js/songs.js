// For Home and Favorites pages
document.addEventListener('DOMContentLoaded', () => {
    if (window.location.pathname.includes('home.html')) {
        loadSongs();
        
        const searchInput = document.getElementById('searchInput');
        if (searchInput) {
            searchInput.addEventListener('input', (e) => {
                const query = e.target.value;
                if (query.trim() === '') {
                    loadSongs();
                } else {
                    searchSongs(query);
                }
            });
        }
    } else if (window.location.pathname.includes('favorites.html')) {
        loadFavorites();
    }
});

let globalAllSongs = [];
let globalFavSongIds = [];

async function loadSongs() {
    try {
        const res = await fetch(`${API_URL}/songs`);
        const songs = await res.json();
        const favsRes = await fetch(`${API_URL}/favorites/${currentUser.id}`);
        const favs = await favsRes.json();
        const favSongIds = favs.map(f => f.song.id);
        
        globalAllSongs = songs;
        globalFavSongIds = favSongIds;
        
        renderSongs(songs, favSongIds, 'songsGrid');
        
        // Render dashboard favorites
        const dashFavSection = document.getElementById('dashboardFavoritesSection');
        if (dashFavSection) {
            const favSongsList = favs.map(f => f.song);
            if (favSongsList.length > 0) {
                dashFavSection.style.display = 'block';
                renderSongs(favSongsList, favSongIds, 'dashboardFavoritesGrid');
            } else {
                dashFavSection.style.display = 'none';
            }
        }
        
        setupGenreFilters();
    } catch (err) {
        console.error('Error loading songs', err);
    }
}

function setupGenreFilters() {
    const stickers = document.querySelectorAll('.genre-sticker');
    if (!stickers) return;
    
    stickers.forEach(sticker => {
        sticker.addEventListener('click', (e) => {
            stickers.forEach(s => s.classList.remove('active'));
            e.target.classList.add('active');
            
            const genre = e.target.getAttribute('data-genre');
            const dashFavSection = document.getElementById('dashboardFavoritesSection');
            const mainSectionTitle = document.getElementById('mainSectionTitle');
            
            if (genre === 'all') {
                if (dashFavSection && globalFavSongIds.length > 0) dashFavSection.style.display = 'block';
                if (mainSectionTitle) mainSectionTitle.textContent = 'Popular Songs';
                renderSongs(globalAllSongs, globalFavSongIds, 'songsGrid');
            } else {
                if (dashFavSection) dashFavSection.style.display = 'none';
                if (mainSectionTitle) mainSectionTitle.textContent = genre + ' Songs';
                const filtered = globalAllSongs.filter(s => s.genre && s.genre.toLowerCase() === genre.toLowerCase());
                renderSongs(filtered, globalFavSongIds, 'songsGrid');
            }
        });
    });
}

async function searchSongs(query) {
    try {
        const res = await fetch(`${API_URL}/songs/search?query=${query}`);
        const songs = await res.json();
        const favsRes = await fetch(`${API_URL}/favorites/${currentUser.id}`);
        const favs = await favsRes.json();
        const favSongIds = favs.map(f => f.song.id);
        
        renderSongs(songs, favSongIds, 'songsGrid');
    } catch (err) {
        console.error('Error searching songs', err);
    }
}

async function loadFavorites() {
    try {
        const res = await fetch(`${API_URL}/favorites/${currentUser.id}`);
        const favorites = await res.json();
        let songs = favorites.map(f => f.song);
        let favSongIds = songs.map(s => s.id);
        
        // Fallback: If they just registered and have 0 favorites, load the uploaded ones!
        if (songs.length === 0) {
            const allRes = await fetch(`${API_URL}/songs`);
            const allSongs = await allRes.json();
            songs = allSongs.filter(s => s.genre === 'Favourites');
            favSongIds = songs.map(s => s.id);
        }
        
        renderSongs(songs, favSongIds, 'favoritesGrid');
    } catch (err) {
        console.error('Error loading favorites', err);
    }
}

function renderSongs(songs, favSongIds, containerId) {
    const container = document.getElementById(containerId);
    if (!container) return;
    
    container.innerHTML = '';
    
    if (songs.length === 0) {
        container.innerHTML = '<p>No songs found.</p>';
        return;
    }

    songs.forEach((song, index) => {
        const isFav = favSongIds.includes(song.id);
        
        const card = document.createElement('div');
        card.className = 'song-card';
        card.innerHTML = `
            <img src="${song.coverImage || 'https://images.unsplash.com/photo-1614680376573-df3480f0c6ff?w=500&q=80'}" alt="Cover">
            <div class="song-title">${song.title}</div>
            <div class="song-artist">${song.artist}</div>
            <div class="play-btn-overlay" onclick="event.stopPropagation(); playSong('${song.audioUrl}', '${song.title}', '${song.artist}', '${song.coverImage}', ${index}, ${JSON.stringify(songs).replace(/"/g, '&quot;')})">
                <span style="color: black; font-size: 1.2rem;">▶</span>
            </div>
            <button class="fav-btn ${isFav ? 'active' : ''}" onclick="event.stopPropagation(); toggleFavorite(${song.id}, this)">
                ${isFav ? '♥' : '♡'}
            </button>
            ${window.location.pathname.includes('playlist.html') ? '' : `
            <button onclick="event.stopPropagation(); showAddToPlaylistModal(${song.id})" style="background: none; border: none; color: var(--text-secondary); cursor: pointer; margin-left: 10px;" title="Add to Playlist">
                ➕
            </button>
            `}
        `;
        
        // Make the whole card clickable to play
        card.addEventListener('click', () => {
            playSong(song.audioUrl, song.title, song.artist, song.coverImage, index, songs);
        });

        container.appendChild(card);
    });
}

async function toggleFavorite(songId, btnElement) {
    const isFav = btnElement.classList.contains('active');
    
    try {
        if (isFav) {
            // Remove
            await fetch(`${API_URL}/favorites/${currentUser.id}/${songId}`, { method: 'DELETE' });
            btnElement.classList.remove('active');
            btnElement.textContent = '♡';
            
            // If on favorites page, reload
            if (window.location.pathname.includes('favorites.html')) {
                loadFavorites();
            }
        } else {
            // Add
            await fetch(`${API_URL}/favorites`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ userId: currentUser.id, songId: songId })
            });
            btnElement.classList.add('active');
            btnElement.textContent = '♥';
        }
    } catch (err) {
        console.error('Error toggling favorite', err);
    }
}

// Simple modal logic for adding to playlist
async function showAddToPlaylistModal(songId) {
    try {
        const res = await fetch(`${API_URL}/playlists/user/${currentUser.id}`);
        const playlists = await res.json();
        
        if (playlists.length === 0) {
            alert('You have no playlists. Create one first!');
            return;
        }

        let options = playlists.map(p => `${p.id}: ${p.name}`).join('\n');
        let choice = prompt(`Enter the Playlist ID to add this song:\n\n${options}`);
        
        if (choice) {
            const playlistId = parseInt(choice.split(':')[0]);
            const addRes = await fetch(`${API_URL}/playlists/${playlistId}/songs/${songId}`, { method: 'POST' });
            if (addRes.ok) {
                alert('Song added to playlist!');
            } else {
                alert('Failed to add song.');
            }
        }
    } catch (err) {
        console.error(err);
    }
}
