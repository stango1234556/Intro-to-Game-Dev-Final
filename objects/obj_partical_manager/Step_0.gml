if(particle_1){
	part_particles_create(global.partSystem, obj_player_1.x, obj_player_1.y, global.basicPart, 10);
	particle_1 = false;
}
if(particle_2){
	part_particles_create(global.partSystem, obj_player_2.x, obj_player_2.y, global.basicPart, 10);
	particle_2 = false;
}
