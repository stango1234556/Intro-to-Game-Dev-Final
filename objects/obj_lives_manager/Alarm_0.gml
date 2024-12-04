//increment our screen shake counter
shake_screen--;

//find the camera's current position
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

//set our camera's position to a random spot nearby its current position
camera_set_view_pos(view_camera[0],
				cam_x + irandom_range(-shake_screen, shake_screen),
				cam_y + irandom_range(-shake_screen, shake_screen));

//if we reached the end of our counter
if(shake_screen <= 0) {
	//reset the counter
	shake_screen = 10;
} else {
	//reset the alarm
	alarm[0] = shake_screen;
}




