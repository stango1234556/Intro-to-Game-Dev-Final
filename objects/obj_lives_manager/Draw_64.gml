if(player_1_lives == 3){
	draw_sprite(spr_lives_player_1, 0, 32, 32);
	draw_sprite(spr_lives_player_1, 0, 96, 32);
	draw_sprite(spr_lives_player_1, 0, 160, 32);
}
else if(player_1_lives == 2){
	draw_sprite(spr_lives_player_1, 0, 32, 32);
	draw_sprite(spr_lives_player_1, 0, 96, 32);
}
else if(player_1_lives == 1){
	draw_sprite(spr_lives_player_1, 0, 32, 32);
}

if(player_2_lives == 3){
	draw_sprite(spr_lives_player_2, 0, 1270, 32);
	draw_sprite(spr_lives_player_2, 0, 1206, 32);
	draw_sprite(spr_lives_player_2, 0, 1142, 32);
}
else if(player_2_lives == 2){
	draw_sprite(spr_lives_player_2, 0, 1270, 32);
	draw_sprite(spr_lives_player_2, 0, 1206, 32);
}
else if(player_2_lives == 1){
	draw_sprite(spr_lives_player_2, 0, 1270, 32);
}
