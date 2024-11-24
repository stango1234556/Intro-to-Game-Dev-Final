if(!obj_player_2.facing_right){
	launched_left = true;
	if(!audio_is_playing(snd_hit)){
		audio_play_sound(snd_hit, 1, false);
	}
	hit = true;
}
else{
	hit = true;
	if(!audio_is_playing(snd_hit)){
		audio_play_sound(snd_hit, 1, false);
	}
	launched_right = true;
}
