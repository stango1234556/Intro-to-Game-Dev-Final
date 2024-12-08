if(!obj_player_1.facing_right){
	launched_left = true;
	if(!audio_is_playing(snd_hit)){
		audio_play_sound(snd_hit, 1, false);
	}
	hit = true;
	obj_partical_manager.particle_3 = true;
}
else{
	if(!audio_is_playing(snd_hit)){
		audio_play_sound(snd_hit, 1, false);
	}
	hit = true;
	launched_right = true;
	obj_partical_manager.particle_3 = true;
}

