if(abs(x - target_x) > 1){
	x = lerp(x, target_x, 0.2);
} 
else{
	x = target_x;
}
if(abs(y - target_y) > 1){
	y = lerp(y, target_y, 0.2);
} 
else{
	y = target_y;
}

//Set card face
if(face_up){
	sprite_index = spr_cards;
	image_index = face_index;
}

//Face down
if(!face_up){
	sprite_index = spr_card_back;
}

//Draw card
draw_sprite(sprite_index, image_index, x, y);






