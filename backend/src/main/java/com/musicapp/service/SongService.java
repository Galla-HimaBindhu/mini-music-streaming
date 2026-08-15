package com.musicapp.service;

import com.musicapp.entity.Song;
import com.musicapp.repository.SongRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SongService {

    @Autowired
    private SongRepository songRepository;

    public List<Song> getAllSongs() {
        return songRepository.findAll();
    }

    public Song getSongById(Long id) {
        return songRepository.findById(id).orElse(null);
    }

    public List<Song> searchSongs(String query) {
        return songRepository.findByTitleContainingIgnoreCaseOrArtistContainingIgnoreCase(query, query);
    }

    public Song addSong(Song song) {
        return songRepository.save(song);
    }

    public Song updateSong(Long id, Song updatedSong) {
        Optional<Song> existing = songRepository.findById(id);
        if (existing.isPresent()) {
            Song song = existing.get();
            song.setTitle(updatedSong.getTitle());
            song.setArtist(updatedSong.getArtist());
            song.setAlbum(updatedSong.getAlbum());
            song.setGenre(updatedSong.getGenre());
            song.setAudioUrl(updatedSong.getAudioUrl());
            song.setCoverImage(updatedSong.getCoverImage());
            return songRepository.save(song);
        }
        return null;
    }

    public void deleteSong(Long id) {
        songRepository.deleteById(id);
    }
}
