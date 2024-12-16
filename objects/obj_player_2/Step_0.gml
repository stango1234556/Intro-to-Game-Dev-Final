//Stop glow effect
if(keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("K"))){
	respawned = false;
}

//Sprite direction
if(!launched_left && !launched_right){
	if(keyboard_check(vk_left)){
		x_vel -= accel;
		walking = true;
		facing_right = false;
		if(!in_air && !attacked){
			sprite_index = spr_player_2_walking_left;
			if(!audio_is_playing(snd_walking_4)){
				audio_play_sound(snd_walking_4, 2, false, 2);
			}
			image_speed = 1;
		}
		image_xscale = 1;
	}
	else if(keyboard_check(vk_right)){
		x_vel += accel;
		walking = true;
		facing_right = true;
		if(!in_air && !attacked){
			sprite_index = spr_player_2_walking_left;
			if(!audio_is_playing(snd_walking_4)){
				audio_play_sound(snd_walking_4, 2, false, 2);
			}
			image_speed = 1;
		}
		image_xscale = -1;
	}
	else if(keyboard_check_released(vk_right)){
		walking = false;	
	}
	else if(keyboard_check_released(vk_left)){
		walking = false;	
	}
}

//Attacking
if(!attacked && keyboard_check_pressed(ord("K"))){
	sprite_index = spr_player_2_attack_left;
	image_index = 0;
	image_speed = 1;
	if(!facing_right){
		audio_play_sound(snd_attack, 1, false, 0.25);
		instance_create_layer(x - sprite_width / 2, y, "Attacks", obj_attack_hitbox_2);
	}
	else if(facing_right){
		audio_play_sound(snd_attack, 1, false, 0.25);
		instance_create_layer(x - sprite_width / 4, y, "Attacks", obj_attack_hitbox_2);
	}
	attacked = true;
}

//Get rid of hitbox
if(attacked){
	if(image_index >= 3){
		sprite_index = spr_player_2_left;
		image_speed = 0;
		instance_destroy(obj_attack_hitbox_2);
	}
	attack_timer += 1;
	if(attack_timer >= attack_cooldown){
		attacked = false;	
		attack_timer = 0;
	}
}

if(direction_going > 0){
	if(image_index >= 4 && sprite_index != spr_player_2_attack_left){
		image_speed = 0;
	}
	else{
		image_speed = 1;
	}
}
else if(direction_going < 0){
	if(image_index >= 2 && sprite_index != spr_player_2_attack_left){
		image_speed = 0;
	}
	else{
		image_speed = 1;
	}
}

if(!in_air && !attacked && !walking){
	sprite_index = spr_player_2_left;	
	image_speed = 0;
}

// Inherit the parent event
event_inherited();


