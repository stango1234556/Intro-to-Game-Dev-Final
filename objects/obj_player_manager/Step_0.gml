if(audio_is_playing(snd_menu)){
	audio_stop_sound(snd_menu);
}
if(!audio_is_playing(snd_fight)){
	audio_play_sound(snd_fight, 1, true, 0.05);
}

if(player_1_respawn){
	spawn_timer_1++;
	if(spawn_timer_1 >= spawn_timer_goal){
		instance_create_layer(480, 448, "Players", obj_player_1);
		player_1_respawn = false;
		spawn_timer_1 = 0;
	}
}
if(player_2_respawn){
	spawn_timer_2++;
	if(spawn_timer_2 >= spawn_timer_goal){
		instance_create_layer(900, 448, "Players", obj_player_2);
		player_2_respawn = false;
		spawn_timer_2 = 0;
	}
}

if(game_start){
	spawn_timer_3++;
	if(spawn_timer_3 >= first_spawn_timer_goal){
		instance_create_layer(480, 448, "Players", obj_player_1);
		instance_create_layer(900, 448, "Players", obj_player_2);
		game_start = false;
		spawn_timer_3 = 0;
	}
}