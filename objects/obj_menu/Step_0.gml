if(audio_is_playing(snd_winner)){
	audio_stop_sound(snd_winner);
}
if(!audio_is_playing(snd_menu)){
	audio_play_sound(snd_menu, 1, true, 0.1);
}