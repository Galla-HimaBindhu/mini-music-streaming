package com.musicapp.service;

import com.musicapp.entity.Favorite;
import com.musicapp.entity.Song;
import com.musicapp.entity.User;
import com.musicapp.repository.FavoriteRepository;
import com.musicapp.repository.SongRepository;
import com.musicapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FavoriteService {

    @Autowired
    private FavoriteRepository favoriteRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SongRepository songRepository;

    public List<Favorite> getUserFavorites(Long userId) {
        return favoriteRepository.findByUserId(userId);
    }

    public Favorite addFavorite(Long userId, Long songId) {
        Optional<Favorite> existing = favoriteRepository.findByUserIdAndSongId(userId, songId);
        if (existing.isPresent()) {
            return existing.get(); // already a favorite
        }

        Optional<User> userOpt = userRepository.findById(userId);
        Optional<Song> songOpt = songRepository.findById(songId);

        if (userOpt.isPresent() && songOpt.isPresent()) {
            Favorite favorite = new Favorite(userOpt.get(), songOpt.get());
            return favoriteRepository.save(favorite);
        }
        return null;
    }

    public void removeFavorite(Long userId, Long songId) {
        Optional<Favorite> existing = favoriteRepository.findByUserIdAndSongId(userId, songId);
        existing.ifPresent(favorite -> favoriteRepository.delete(favorite));
    }
}
