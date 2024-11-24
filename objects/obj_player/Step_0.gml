//Slowing player down on x-axis
if(launched_right && !hit){
	x_vel -= 0.4; 
	if(x_vel <= 0){
		launched_right = false;	
	}
}
else if(launched_left && !hit){
	x_vel += 0.4; 
	if(x_vel >= 0){
		launched_left = false;	
	}
}
else{
	x_vel *= 0.9;
}

//Gravity for y-axis
y_vel += grav;

//Add current speed to leftover speed from last frame
r_x += x_vel;
r_y += y_vel;

//Round velocity to find pixels moving this frame
var to_move_x = round(r_x);
var to_move_y = round(r_y);

//Remove rounded amount	to find leftover speed
r_x -= to_move_x;
r_y -= to_move_y;

//Find direction currently moving
var dir = sign(to_move_y);

//Move however much we need to move this frame
x += to_move_x;

while(to_move_y != 0){
	var colliding = false;
	var collide_with = noone;
	
	//Check for collisions while moving downwards
	if(dir >= 0){
		//Set to stage_block that might be one pixel beneath player
		collide_with = instance_place(x, y + dir, obj_stage_block);
		
		//If player collided with stage_block
		if(collide_with != noone){
			//If not already overlapping with stage_block
			if(place_meeting(x, y, collide_with) == false){
				colliding = true;
			}
		}
		collide_with = instance_place(x, y + dir, obj_cloud);
		if(collide_with != noone){
				if(collide_with != noone){
					if(place_meeting(x, y, collide_with) == false){
						cloud_bounce = true;
					}
				}
		}
		else{
			//Set to a platform that might be one pixel beneath player
			collide_with = instance_place(x, y + dir, obj_platform);
			//If player collided with platform
			if(collide_with != noone){
				//If not already overlapping with platform
				if(place_meeting(x, y, collide_with) == false){
					colliding = true;
				}
			}
		}	
	}
	//If not colliding with anything
	if(!colliding && !cloud_bounce){
		in_air = true;
		//Move one pixel in direction player is moving
		y += dir;
		//Remove that pixel from the pixels we're tracking this frame
		to_move_y -= dir;
	}
	else if(cloud_bounce){
		y = y + dir;
		y_vel = bounce_vel;
		r_y = 0;
		audio_play_sound(snd_walking_5, 1, false, 2);
		//Reset jumps
		jumped = false;
		double_jumped = false;
		cloud_bounce = false;
	}
	else{  
		//Reset jumps
		jumped = false;
		double_jumped = false;
		//Standing on something
		in_air = false;
		//Stop moving
		y_vel = 0;
		//Reset remaining pixels to move
		r_y = 0;
		break;
	}
}	

//Check if player is hit
if(hit && launched_left){
	r_x = 0;
	x_vel = -1 * abs(launch_vel_x * percentage);
	y = y + dir;
	y_vel = launch_vel_y * percentage;
	r_y = 0;
	percentage += irandom_range(10, 25) / 100;
	hit = false;
}
else if(hit && launched_right){
	r_x = 0;
	x_vel = launch_vel_x * percentage;
	y = y + dir;
	y_vel = launch_vel_y * percentage;
	r_y = 0;
	percentage += irandom_range(10, 25) / 100;
	hit = false;
}

if(dir > 0){
	if(image_index >= 4){
		image_speed = 0;
	}
	else{
		image_speed = 1;
	}
}
else if(dir < 0){
	if(image_index >= 2){
		image_speed = 0;
	}
	else{
		image_speed = 1;
	}
}

if(!jumped && keyboard_check_pressed(ord(jump_button))){
	sprite_index = jump_sprite_right;
	image_index = 0;
	audio_play_sound(snd_walking_5, 1, false, 2);
	in_air = true;
	y = y + dir;
	y_vel = bounce_vel;
	jumped = true;
	r_y = 0;
}
else if(in_air && jumped && !double_jumped && keyboard_check_pressed(ord(jump_button))){
	sprite_index = jump_sprite_right;
	image_index = 0;
	audio_play_sound(snd_walking_5, 1, false, 2);
	double_jumped = true;
	y = y + dir;
	y_vel = bounce_vel;
	r_y = 0;
}




