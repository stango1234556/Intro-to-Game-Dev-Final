switch(global.player_1_state){
	case PlayerState.GROUND:
		if(keyboard_check(ord("A"))){
			x_vel -= accel;	
			global.player_1_facing = Facing.LEFT;
			sprite_index = spr_player_1_walking_left;
			image_speed = 1;
			if(!audio_is_playing(snd_walking_3)){
				audio_play_sound(snd_walking_3, 2, false, 2);
			}
		}
		else if(keyboard_check(ord("D"))){
			x_vel += accel;
			global.player_1_facing = Facing.RIGHT;
			sprite_index = spr_player_1_walking_right;
			image_speed = 1;
			if(!audio_is_playing(snd_walking_3)){
				audio_play_sound(snd_walking_3, 2, false, 2);
			}
				
		}
		else if(keyboard_check_released(ord("D"))){
			sprite_index = spr_player_1_right;
			image_speed = 0;
		}
		else if(keyboard_check_released(ord("A"))){
			sprite_index = spr_player_1_left;
			image_speed = 0;
		}
		break	
		
	case PlayerState.HIT:
		if(global.player_2_facing == Facing.LEFT){
			r_x = 0;
			x_vel = -1 * abs(launch_vel_x * percentage);
			y = y + dir;
			y_vel = launch_vel_y * percentage;
			r_y = 0;
			percentage += irandom_range(10, 25) / 100;
		}
		else if(global.player_2_facing == Facing.RIGHT){
			r_x = 0;
			x_vel = launch_vel_x * percentage;
			y = y + dir;
			y_vel = launch_vel_y * percentage;
			r_y = 0;
			percentage += irandom_range(10, 25) / 100;
		}
		global.player_1_state = PlayerState.IN_AIR_SLOWING
		break;
		
	case PlayerState.IN_AIR_SLOWING:
		if(x_vel > 0){
			x_vel -= 0.4; 
			if(x_vel <= 0){
				global.player_1_state = PlayerState.IN_AIR;
			}
		}
		else if(x_vel < 0){
			x_vel += 0.4; 
			if(x_vel >= 0){
				global.player_1_state = PlayerState.IN_AIR;
			}
		}
		break
	
	case PlayerState.IN_AIR:
}

//Attacking
if(!attacked && keyboard_check_pressed(ord("V"))){
	//if(facing_right){
	//	instance_create_layer(x + sprite_width / 2, y, "Attacks", obj_attack_hitbox_1);
	//	attacked = true;
	//}
	//else{
	//	instance_create_layer(x - spr_attack_hitbox.sprite_width * 3 / 4 - sprite_width / 2, y, "Attacks", obj_attack_hitbox_1);
	//	attacked = true;
	//}
	sprite_index = spr_player_1_attack_right;
	image_speed = 1;
	if(facing_right){
		audio_play_sound(snd_attack, 1, false, 0.25);
		instance_create_layer(x + sprite_width / 4, y, "Attacks", obj_attack_hitbox_1);
	}
	else if(!facing_right){
		audio_play_sound(snd_attack, 1, false, 0.25);
		instance_create_layer(x + sprite_width / 2, y, "Attacks", obj_attack_hitbox_1);
	}
	attacked = true;
}

//Get rid of hitbox
if(attacked){
	if(image_index >= 4){
		sprite_index = spr_player_1_right;
		image_speed = 0;
		attacked = false
		instance_destroy(obj_attack_hitbox_1);
	}
}

// Inherit the parent event
event_inherited();


