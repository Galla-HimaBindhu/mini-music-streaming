document.addEventListener('DOMContentLoaded', () => {
    if (window.location.pathname.includes('playlist.html')) {
        loadPlaylists();

        const createBtn = document.getElementById('createPlaylistBtn');
        if (createBtn) {
            createBtn.addEventListener('click', createPlaylist);
        }
    }
});

async function loadPlaylists() {
    try {
        const res = await fetch(`${API_URL}/playlists/user/${currentUser.id}`);
        const playlists = await res.json();
        
        const container = document.getElementById('playlistsContainer');
        container.innerHTML = '';

        if (playlists.length === 0) {
            container.innerHTML = '<p style="color: #aaa; text-align: center; margin-top: 2rem;">You have no playlists yet.</p>';
            return;
        }

        playlists.forEach(playlist => {
            const item = document.createElement('div');
            item.className = 'premium-playlist-item';
            item.style.marginBottom = '3rem';
            item.style.background = 'linear-gradient(180deg, rgba(40,40,40,1) 0%, rgba(20,20,20,1) 100%)';
            item.style.borderRadius = '12px';
            item.style.padding = '2rem';
            item.style.boxShadow = '0 8px 24px rgba(0,0,0,0.5)';
            
            // Header for Playlist
            let headerHtml = `
                <div style="display: flex; align-items: flex-end; gap: 1.5rem; margin-bottom: 2rem; border-bottom: 1px solid #333; padding-bottom: 1.5rem;">
                    <div style="width: 150px; height: 150px; background: #333; box-shadow: 0 4px 15px rgba(0,0,0,0.6); display: flex; align-items: center; justify-content: center; font-size: 4rem;">
                        🎵
                    </div>
                    <div style="flex-grow: 1;">
                        <span style="text-transform: uppercase; font-size: 0.8rem; font-weight: bold; color: #aaa; letter-spacing: 1px;">Playlist</span>
                        <h2 style="font-size: 3rem; margin: 0.5rem 0; color: #fff; font-weight: 800;">${playlist.name}</h2>
                        <p style="color: #aaa; font-size: 0.9rem;">${playlist.songs ? playlist.songs.length : 0} songs</p>
                    </div>
                    <button onclick="deletePlaylist(${playlist.id})" class="btn btn-danger" style="padding: 10px 20px; border-radius: 20px; background: #e22134; border: none; font-weight: bold;">Delete Playlist</button>
                </div>
            `;

            // Generate songs HTML (List View)
            let songsHtml = '<div class="premium-songs-list" style="display: flex; flex-direction: column; gap: 0.5rem;">';
            if (playlist.songs && playlist.songs.length > 0) {
                playlist.songs.forEach((song, index) => {
                    songsHtml += `
                        <div class="premium-song-row" style="display: flex; align-items: center; justify-content: space-between; padding: 0.8rem 1rem; border-radius: 8px; transition: background 0.3s; cursor: pointer;"
                             onmouseover="this.style.background='rgba(255,255,255,0.1)'" onmouseout="this.style.background='transparent'"
                             onclick="playSong('${song.audioUrl}', '${song.title}', '${song.artist}', '${song.coverImage}', ${index}, ${JSON.stringify(playlist.songs).replace(/"/g, '&quot;')})">
                            
                            <div style="display: flex; align-items: center; gap: 1rem; flex-grow: 1;">
                                <span style="color: #aaa; width: 20px; text-align: right;">${index + 1}</span>
                                <img src="${song.coverImage || 'https://images.unsplash.com/photo-1614680376573-df3480f0c6ff?w=500&q=80'}" alt="Cover" style="width: 50px; height: 50px; border-radius: 4px; object-fit: cover;">
                                <div>
                                    <div style="color: #fff; font-weight: 600; font-size: 1rem;">${song.title}</div>
                                    <div style="color: #aaa; font-size: 0.85rem;">${song.artist}</div>
                                </div>
                            </div>
                            
                            <div style="color: #aaa; font-size: 0.9rem; flex-grow: 1; text-align: center;">
                                ${song.album || 'Unknown Album'}
                            </div>

                            <div>
                                <button onclick="event.stopPropagation(); removeSongFromPlaylist(${playlist.id}, ${song.id})" class="btn" style="background: transparent; color: #aaa; border: 1px solid #aaa; border-radius: 20px; padding: 5px 15px; font-size: 0.8rem; transition: all 0.2s;" onmouseover="this.style.borderColor='#fff'; this.style.color='#fff';" onmouseout="this.style.borderColor='#aaa'; this.style.color='#aaa';">Remove</button>
                            </div>
                        </div>
                    `;
                });
            } else {
                songsHtml += '<p style="color: #aaa; text-align: center; padding: 2rem;">No songs in this playlist. Go to Home to add some!</p>';
            }
            songsHtml += '</div>';

            item.innerHTML = headerHtml + songsHtml;
            container.appendChild(item);
        });
    } catch (err) {
        console.error('Error loading playlists', err);
    }
}

async function createPlaylist() {
    const input = document.getElementById('newPlaylistName');
    const name = input.value.trim();
    if (!name) return;

    try {
        const res = await fetch(`${API_URL}/playlists`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ userId: currentUser.id, name: name })
        });

        if (res.ok) {
            input.value = '';
            loadPlaylists();
        }
    } catch (err) {
        console.error('Error creating playlist', err);
    }
}

async function deletePlaylist(id) {
    if (confirm('Are you sure you want to delete this playlist?')) {
        try {
            await fetch(`${API_URL}/playlists/${id}`, { method: 'DELETE' });
            loadPlaylists();
        } catch (err) {
            console.error('Error deleting playlist', err);
        }
    }
}

async function removeSongFromPlaylist(playlistId, songId) {
    if (confirm('Remove this song from the playlist?')) {
        try {
            await fetch(`${API_URL}/playlists/${playlistId}/songs/${songId}`, { method: 'DELETE' });
            loadPlaylists();
        } catch (err) {
            console.error('Error removing song', err);
        }
    }
}
