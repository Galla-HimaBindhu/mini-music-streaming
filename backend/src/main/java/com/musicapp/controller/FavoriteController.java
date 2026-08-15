package com.musicapp.controller;

import com.musicapp.entity.Favorite;
import com.musicapp.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/favorites")
@CrossOrigin(origins = "*")
public class FavoriteController {

    @Autowired
    private FavoriteService favoriteService;

    @GetMapping("/{userId}")
    public ResponseEntity<List<Favorite>> getUserFavorites(@PathVariable Long userId) {
        return ResponseEntity.ok(favoriteService.getUserFavorites(userId));
    }

    @PostMapping
    public ResponseEntity<?> addFavorite(@RequestBody Map<String, Long> payload) {
        Long userId = payload.get("userId");
        Long songId = payload.get("songId");

        if (userId == null || songId == null) {
            return ResponseEntity.badRequest().body(Map.of("error", "Missing userId or songId"));
        }

        Favorite favorite = favoriteService.addFavorite(userId, songId);
        if (favorite != null) {
            return ResponseEntity.ok(favorite);
        }
        return ResponseEntity.badRequest().body(Map.of("error", "User or Song not found"));
    }

    @DeleteMapping("/{userId}/{songId}")
    public ResponseEntity<?> removeFavorite(@PathVariable Long userId, @PathVariable Long songId) {
        favoriteService.removeFavorite(userId, songId);
        return ResponseEntity.ok().build();
    }
}
