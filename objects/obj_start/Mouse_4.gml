if(!audio_is_playing(snd_click)){
	audio_play_sound(snd_click, 1, false, 0.25);
}
room_goto(rm_game);