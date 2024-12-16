//Stop glow effect
if(keyboard_check(ord("A")) || keyboard_check(ord("D")) || keyboard_check(ord("W")) || keyboard_check(ord("V"))){
	respawned = false;
}

//Sprite direction
if(!launched_left && !launched_right){
	if(keyboard_check(ord("A"))){
		x_vel -= accel;
		walking = true;
		facing_right = false;
		if(!in_air && !attacked){
			sprite_index = spr_player_1_walking_right;
			if(!audio_is_playing(snd_walking_3)){
				audio_play_sound(snd_walking_3, 2, false, 2);
			}
			image_speed = 1;
		}
		image_xscale = -1;
	}
	else if(keyboard_check(ord("D"))){
		x_vel += accel;
		walking = true;
		facing_right = true;
		if(!in_air && !attacked){
			sprite_index = spr_player_1_walking_right;
			if(!audio_is_playing(snd_walking_3)){
				audio_play_sound(snd_walking_3, 2, false, 2);
			}
			image_speed = 1;
		}
		image_xscale = 1;
	}
	else if(keyboard_check_released(ord("D"))){
		walking = false;	
	}
	else if(keyboard_check_released(ord("A"))){
		walking = false;	
	}
}

//Attacking
if(!attacked && keyboard_check_pressed(ord("V"))){
	sprite_index = spr_player_1_attack_right;
	image_index = 0;
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
	if(image_index >= 3){
		sprite_index = spr_player_1_right;
		image_speed = 0;
		instance_destroy(obj_attack_hitbox_1);
	}
	attack_timer += 1;
	if(attack_timer >= attack_cooldown){
		attacked = false;	
		attack_timer = 0;
	}
}

if(!in_air && !attacked && !walking){
	sprite_index = spr_player_1_right;	
	image_speed = 0;
}

if(direction_going > 0){
	if(image_index >= 4 && sprite_index != spr_player_1_attack_right){
		image_speed = 0;
	}
	else{
		image_speed = 1;
	}
}
else if(direction_going < 0){
	if(image_index >= 2 && sprite_index != spr_player_1_attack_right){
		image_speed = 0;
	}
	else{
		image_speed = 1;
	}
}

// Inherit the parent event
event_inherited();


