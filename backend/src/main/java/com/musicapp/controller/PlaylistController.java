package com.musicapp.controller;

import com.musicapp.entity.Playlist;
import com.musicapp.service.PlaylistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/playlists")
@CrossOrigin(origins = "*")
public class PlaylistController {

    @Autowired
    private PlaylistService playlistService;

    @GetMapping("/user/{userId}")
    public ResponseEntity<List<Playlist>> getUserPlaylists(@PathVariable Long userId) {
        return ResponseEntity.ok(playlistService.getUserPlaylists(userId));
    }

    @GetMapping("/all")
    public ResponseEntity<List<Playlist>> getAllPlaylists() {
        return ResponseEntity.ok(playlistService.getAllPlaylists());
    }

    @PostMapping
    public ResponseEntity<?> createPlaylist(@RequestBody Map<String, Object> payload) {
        try {
            Long userId = Long.valueOf(payload.get("userId").toString());
            String name = payload.get("name").toString();
            Playlist playlist = playlistService.createPlaylist(userId, name);
            if (playlist != null) {
                return ResponseEntity.ok(playlist);
            }
            return ResponseEntity.badRequest().body(Map.of("error", "User not found"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", "Invalid request format"));
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deletePlaylist(@PathVariable Long id) {
        playlistService.deletePlaylist(id);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{playlistId}/songs/{songId}")
    public ResponseEntity<?> addSongToPlaylist(@PathVariable Long playlistId, @PathVariable Long songId) {
        Playlist playlist = playlistService.addSongToPlaylist(playlistId, songId);
        if (playlist != null) {
            return ResponseEntity.ok(playlist);
        }
        return ResponseEntity.badRequest().body(Map.of("error", "Playlist or Song not found"));
    }

    @DeleteMapping("/{playlistId}/songs/{songId}")
    public ResponseEntity<?> removeSongFromPlaylist(@PathVariable Long playlistId, @PathVariable Long songId) {
        Playlist playlist = playlistService.removeSongFromPlaylist(playlistId, songId);
        if (playlist != null) {
            return ResponseEntity.ok(playlist);
        }
        return ResponseEntity.badRequest().body(Map.of("error", "Playlist or Song not found"));
    }
}
