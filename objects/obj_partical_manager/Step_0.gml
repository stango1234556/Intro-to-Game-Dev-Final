if(particle_1){
	var player_1_x = obj_player_1.x;
	var player_1_y = obj_player_1.y;
	if(obj_player_1.x < 0){
		player_1_x += 250;
	}
	else if(obj_player_1.x > 1366){
		player_1_x -= 250;
	}
	if(obj_player_1.y < 0){
		player_1_y += 250;
	}
	else if(obj_player_1.y > 768){
		player_1_y -= 250;
	}
	part_particles_create(global.partSystem, player_1_x, player_1_y, global.basicPart, 10);
	particle_1 = false;
	instance_destroy(obj_player_1);
}
if(particle_2){
	var player_2_x = obj_player_2.x;
	var player_2_y = obj_player_2.y;
	if(obj_player_2.x < 0){
		player_2_x += 250;
	}
	else if(obj_player_2.x > 1366){
		player_2_x -= 250;
	}
	if(obj_player_2.y < 0){
		player_2_y += 250;
	}
	else if(obj_player_2.y > 768){
		player_2_y -= 250;
	}
	part_particles_create(global.partSystem, player_2_x, player_2_y, global.basicPart, 10);
	particle_2 = false;
	instance_destroy(obj_player_2);
}
if(particle_3){
	part_particles_create(global.partSystem, obj_player_1.x, obj_player_1.y, global.hitPart, 2);
	particle_3 = false;
}
if(particle_4){
	part_particles_create(global.partSystem, obj_player_2.x, obj_player_2.y, global.hitPart, 2);
	particle_4 = false;
}
