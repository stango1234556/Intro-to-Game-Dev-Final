obj_player_manager.player_1_respawn = true;
obj_lives_manager.player_1_lives--;
audio_play_sound(snd_blast, 1, false, 0.50);
instance_destroy();