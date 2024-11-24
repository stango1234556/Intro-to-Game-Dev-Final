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