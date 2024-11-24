obj_player_manager.player_2_respawn = true;
obj_lives_manager.player_2_lives--;
audio_play_sound(snd_blast, 1, false, 0.5);
instance_destroy();