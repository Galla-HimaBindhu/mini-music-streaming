package com.musicapp.service;

import com.musicapp.entity.Playlist;
import com.musicapp.entity.Song;
import com.musicapp.entity.User;
import com.musicapp.repository.PlaylistRepository;
import com.musicapp.repository.SongRepository;
import com.musicapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PlaylistService {

    @Autowired
    private PlaylistRepository playlistRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SongRepository songRepository;

    public List<Playlist> getUserPlaylists(Long userId) {
        return playlistRepository.findByUserId(userId);
    }

    public List<Playlist> getAllPlaylists() {
        return playlistRepository.findAll();
    }

    public Playlist createPlaylist(Long userId, String name) {
        Optional<User> userOpt = userRepository.findById(userId);
        if (userOpt.isPresent()) {
            Playlist playlist = new Playlist(name, userOpt.get());
            return playlistRepository.save(playlist);
        }
        return null;
    }

    public void deletePlaylist(Long id) {
        playlistRepository.deleteById(id);
    }

    public Playlist addSongToPlaylist(Long playlistId, Long songId) {
        Optional<Playlist> pOpt = playlistRepository.findById(playlistId);
        Optional<Song> sOpt = songRepository.findById(songId);

        if (pOpt.isPresent() && sOpt.isPresent()) {
            Playlist playlist = pOpt.get();
            playlist.addSong(sOpt.get());
            return playlistRepository.save(playlist);
        }
        return null;
    }

    public Playlist removeSongFromPlaylist(Long playlistId, Long songId) {
        Optional<Playlist> pOpt = playlistRepository.findById(playlistId);
        Optional<Song> sOpt = songRepository.findById(songId);

        if (pOpt.isPresent() && sOpt.isPresent()) {
            Playlist playlist = pOpt.get();
            playlist.removeSong(sOpt.get());
            return playlistRepository.save(playlist);
        }
        return null;
    }
}
