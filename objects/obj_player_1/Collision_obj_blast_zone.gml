obj_player_manager.player_1_respawn = true;
obj_lives_manager.player_1_lives--;
obj_lives_manager.alarm[0] = obj_lives_manager.shake_screen;
obj_partical_manager.particle_1 = true;
audio_play_sound(snd_blast, 1, false, 0.50);