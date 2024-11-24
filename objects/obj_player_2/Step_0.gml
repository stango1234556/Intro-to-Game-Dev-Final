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
	//if(facing_right){
	//	instance_create_layer(x + sprite_width / 2, y, "Attacks", obj_attack_hitbox_1);
	//	attacked = true;
	//}
	//else{
	//	instance_create_layer(x - spr_attack_hitbox.sprite_width * 3 / 4 - sprite_width / 2, y, "Attacks", obj_attack_hitbox_1);
	//	attacked = true;
	//}
	sprite_index = spr_player_2_attack_left;
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
	if(image_index >= 4){
		sprite_index = spr_player_2_left;
		image_speed = 0;
		attacked = false
		instance_destroy(obj_attack_hitbox_2);
	}
}

if(!in_air && !attacked && !walking){
	sprite_index = spr_player_2_left;	
	image_speed = 0;
}

// Inherit the parent event
event_inherited();


