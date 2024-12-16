if(audio_is_playing(snd_fight)){
	audio_stop_sound(snd_fight);
}
if(!audio_is_playing(snd_winner)){
	audio_play_sound(snd_winner, 1, true, 0.05);
}