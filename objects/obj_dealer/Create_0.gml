//Set of game states
enum STATES{
	DEAL,
	PLAYER_CHOOSE,
	CPU_CHOOSE,
	RESOLVE,
	RESHUFFLE,
}

score_added = false;

//Managing game state
global.state = STATES.DEAL;

//Space between cards in hand
hand_x_offset = 100;

//Total number of cards in deck
num_cards = 52;

//Initialize lists that hold cards depending on game state
deck = ds_list_create();
player_hand = ds_list_create();
cpu_hand = ds_list_create();

move_timer = 0;
move_timer_2 = 0;
move_timer_3 = 0;
move_timer_4 = 0;

player_total = 0;
cpu_total = 0;

player_turn_end = false;

player_bust = false;
cpu_bust = false;

player_element_1_count = 0;
player_element_2_count = 0;
player_element_3_count = 0;
player_element_4_count = 0;

cpu_element_1_count = 0;
cpu_element_2_count = 0;
cpu_element_3_count = 0;
cpu_element_4_count = 0;

player_ace_count = 0;
cpu_ace_count = 0;

//Creating cards
for(var _i = 0; _i < num_cards; _i++){
	//Make a new card
	var _new_card = instance_create_layer(x, y, "Cards", obj_card);
	//Set face index
	_new_card.face_index = _i;
	//Set card value
	if(_i % 13 == 0){
		_new_card.card_value = 2;
	}
	else if(_i % 13 == 1){
		_new_card.card_value = 3;
	}
	else if(_i % 13 == 2){
		_new_card.card_value = 4;
	}
	else if(_i % 13 == 3){
		_new_card.card_value = 5;
	}
	else if(_i % 13 == 4){
		_new_card.card_value = 6;
	}
	else if(_i % 13 == 5){
		_new_card.card_value = 7;
	}
	else if(_i % 13 == 6){
		_new_card.card_value = 8;
	}
	else if(_i % 13 == 7){
		_new_card.card_value = 9;
	}
	else if(_i % 13 == 8){
		_new_card.card_value = 10;
	}
	else if(_i % 13 == 9){
		_new_card.card_value = 10;
	}
	else if(_i % 13 == 10){
		_new_card.card_value = 10;
	}
	else if(_i % 13 == 11){
		_new_card.card_value = 10;
	}
	else if(_i % 13 == 12){
		_new_card.card_value = 11;
	}
	//Set card type
	if(_i < 13){
		_new_card.card_type = 1;
	}
	else if(_i >= 13 && _i < 26){
		_new_card.card_type = 2;
	}
	else if(_i >= 26 && _i < 39){
		_new_card.card_type = 3;
	}
	else if(_i >= 39){
		_new_card.card_type = 4;
	}
	//Face up
	_new_card.face_up = false;
	//In player hand
	_new_card.in_player_hand = false;
	//In CPU hand
	_new_card.in_cpu_hand = false;
	_new_card.target_x = x;
	_new_card.target_y = y;
	//Add card to deck
	ds_list_add(deck, _new_card);
}

//Shuffle deck
randomize();
ds_list_shuffle(deck);

//Loop through and put cards at appropriate position
for(var _i = 0; _i < num_cards; _i++) {
	deck[| _i].depth = num_cards - _i;
	deck[| _i].target_y = y - (2 * _i);
}