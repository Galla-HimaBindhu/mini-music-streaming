const API_URL = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1' 
    ? 'http://localhost:8080/api' 
    : 'https://mini-music-streaming.onrender.com/api';

// Check Authentication
function checkAuth() {
    const user = JSON.parse(localStorage.getItem('musicAppUser'));
    if (!user && !window.location.pathname.includes('login.html') && !window.location.pathname.includes('register.html') && !window.location.pathname.endsWith('index.html') && window.location.pathname !== '/') {
        window.location.href = 'login.html';
        return null;
    }
    
    // Update UI if logged in
    if (user) {
        const userNameDisplay = document.getElementById('userNameDisplay');
        if (userNameDisplay) userNameDisplay.textContent = user.name;

        const adminLink = document.getElementById('adminLink');
        if (adminLink && user.role === 'ADMIN') {
            adminLink.style.display = 'block';
        }

        const logoutBtn = document.getElementById('logoutBtn');
        if (logoutBtn) {
            logoutBtn.addEventListener('click', (e) => {
                e.preventDefault();
                localStorage.removeItem('musicAppUser');
                window.location.href = 'login.html';
            });
        }
    }
    return user;
}

const currentUser = checkAuth();

// Music Player Logic
const audioPlayer = document.getElementById('audioPlayer');
const playPauseBtn = document.getElementById('playPauseBtn');
const progressBar = document.getElementById('progressBar');
const progress = document.getElementById('progress');
const currentTimeEl = document.getElementById('currentTime');
const durationTimeEl = document.getElementById('durationTime');
const volumeControl = document.getElementById('volumeControl');
const playerCover = document.getElementById('playerCover');
const playerTitle = document.getElementById('playerTitle');
const playerArtist = document.getElementById('playerArtist');

let isPlaying = false;
let currentSongsList = [];
let currentSongIndex = -1;

function playSong(songUrl, title, artist, coverUrl, index = -1, songList = []) {
    if (audioPlayer) {
        audioPlayer.src = songUrl;
        audioPlayer.play().catch(e => console.log('Playback prevented', e));
        isPlaying = true;
        updatePlayPauseIcon();
        
        playerCover.src = coverUrl || 'https://images.unsplash.com/photo-1614680376573-df3480f0c6ff?w=150&q=80';
        playerCover.style.display = 'block';
        playerTitle.textContent = title;
        playerArtist.textContent = artist;

        if (songList.length > 0) {
            currentSongsList = songList;
            currentSongIndex = index;
        }
    }
}

function togglePlay() {
    if (!audioPlayer || !audioPlayer.src) return;
    
    if (isPlaying) {
        audioPlayer.pause();
    } else {
        audioPlayer.play();
    }
    isPlaying = !isPlaying;
    updatePlayPauseIcon();
}

function updatePlayPauseIcon() {
    if (playPauseBtn) {
        playPauseBtn.textContent = isPlaying ? '⏸' : '▶';
    }
}

if (audioPlayer) {
    audioPlayer.addEventListener('timeupdate', () => {
        const percent = (audioPlayer.currentTime / audioPlayer.duration) * 100;
        progress.style.width = `${percent}%`;
        currentTimeEl.textContent = formatTime(audioPlayer.currentTime);
    });

    audioPlayer.addEventListener('loadedmetadata', () => {
        durationTimeEl.textContent = formatTime(audioPlayer.duration);
    });

    audioPlayer.addEventListener('ended', () => {
        if (currentSongIndex < currentSongsList.length - 1) {
            playNext();
        } else {
            isPlaying = false;
            updatePlayPauseIcon();
            progress.style.width = '0%';
            currentTimeEl.textContent = '0:00';
        }
    });
}

function formatTime(seconds) {
    if (isNaN(seconds)) return '0:00';
    const mins = Math.floor(seconds / 60);
    const secs = Math.floor(seconds % 60);
    return `${mins}:${secs < 10 ? '0' : ''}${secs}`;
}

if (playPauseBtn) {
    playPauseBtn.addEventListener('click', togglePlay);
}

if (progressBar) {
    progressBar.addEventListener('click', (e) => {
        if (!audioPlayer || !audioPlayer.src) return;
        const width = progressBar.clientWidth;
        const clickX = e.offsetX;
        const duration = audioPlayer.duration;
        audioPlayer.currentTime = (clickX / width) * duration;
    });
}

if (volumeControl && audioPlayer) {
    volumeControl.addEventListener('input', (e) => {
        audioPlayer.volume = e.target.value;
    });
}

function playNext() {
    if (currentSongIndex >= 0 && currentSongIndex < currentSongsList.length - 1) {
        currentSongIndex++;
        const nextSong = currentSongsList[currentSongIndex];
        playSong(nextSong.audioUrl, nextSong.title, nextSong.artist, nextSong.coverImage, currentSongIndex, currentSongsList);
    }
}

function playPrev() {
    if (currentSongIndex > 0) {
        currentSongIndex--;
        const prevSong = currentSongsList[currentSongIndex];
        playSong(prevSong.audioUrl, prevSong.title, prevSong.artist, prevSong.coverImage, currentSongIndex, currentSongsList);
    }
}

document.getElementById('nextBtn')?.addEventListener('click', playNext);
document.getElementById('prevBtn')?.addEventListener('click', playPrev);
