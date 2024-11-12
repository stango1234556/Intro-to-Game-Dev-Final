switch(global.state) {
	case STATES.DEAL:
		if(move_timer == 0) {
			//Find number of cards currently in player's hand
			var _player_num = ds_list_size(player_hand);
			var _cpu_num = ds_list_size(cpu_hand);
			//If less than 2 cards
			if(_cpu_num < 1) {
				//Grab top card
				var _dealt_card = ds_list_find_value(deck, ds_list_size(deck)-1);
				//Remove from deck and add to hand
				ds_list_delete(deck, ds_list_size(deck) - 1);
				ds_list_add(cpu_hand, _dealt_card);
				//Set card in hand's position
				_dealt_card.target_x = room_width/4 + _cpu_num * hand_x_offset - 100;
				_dealt_card.target_y = room_height * 0.1;
				audio_play_sound(snd_draw, 1, false, 0.8);
				//Set to in hand
				_dealt_card.in_cpu_hand = true;
				cpu_total += _dealt_card.card_value;
				if(_dealt_card.card_type == 1){
					cpu_element_1_count++;
				}
				else if(_dealt_card.card_type == 2){
					cpu_element_2_count++;
				}
				else if(_dealt_card.card_type == 3){
					cpu_element_3_count++;
				}
				else if(_dealt_card.card_type == 4){
					cpu_element_4_count++;
				}
				
				if(_dealt_card.card_value == 11){
					cpu_ace_count++;
				}
			} 
			else if(_cpu_num == 1) {
				//Grab top card
				var _dealt_card = ds_list_find_value(deck, ds_list_size(deck)-1);
				//Remove from deck and add to hand
				ds_list_delete(deck, ds_list_size(deck) - 1);
				ds_list_add(cpu_hand, _dealt_card);
				//Set card in hand's position
				_dealt_card.target_x = room_width/4 + _cpu_num * hand_x_offset - 100;
				_dealt_card.target_y = room_height * 0.1;
				audio_play_sound(snd_draw, 1, false, 0.8);
				//Set to in hand
				_dealt_card.in_cpu_hand = true;
				_dealt_card.face_up = true;
				cpu_total += _dealt_card.card_value;
				if(_dealt_card.card_type == 1){
					cpu_element_1_count++;
				}
				else if(_dealt_card.card_type == 2){
					cpu_element_2_count++;
				}
				else if(_dealt_card.card_type == 3){
					cpu_element_3_count++;
				}
				else if(_dealt_card.card_type == 4){
					cpu_element_4_count++;
				}
				
				if(_dealt_card.card_value == 11){
					cpu_ace_count++;
				}
			} 
			//If less than 2 cards
			else if(_player_num < 2) {
				//Grab top card
				var _dealt_card = ds_list_find_value(deck, ds_list_size(deck)-1);
				//Remove from deck and add to hand
				ds_list_delete(deck, ds_list_size(deck) - 1);
				ds_list_add(player_hand, _dealt_card);
				//Set card in hand's position
				_dealt_card.target_x = room_width/4 + _player_num * hand_x_offset - 100;
				_dealt_card.target_y = room_height * 0.8;
				audio_play_sound(snd_draw, 1, false, 0.8);
				//Set to in hand
				_dealt_card.in_player_hand = true;
				_dealt_card.face_up = true;
				player_total += _dealt_card.card_value;
				if(_dealt_card.card_type == 1){
					player_element_1_count++;
				}
				else if(_dealt_card.card_type == 2){
					player_element_2_count++;
				}
				else if(_dealt_card.card_type == 3){
					player_element_3_count++;
				}
				else if(_dealt_card.card_type == 4){
					player_element_4_count++;
				}
				
				if(_dealt_card.card_value == 11){
					player_ace_count++;
				}
			} 
			else {
				//Next game state
				global.state = STATES.PLAYER_CHOOSE;
			}
		}
		break;
		
	case STATES.PLAYER_CHOOSE:
		//Find number of cards currently in player's hand
		var _player_num = ds_list_size(player_hand);
		if(!player_turn_end){
			if(keyboard_check_pressed(ord("E"))){
				//Grab top card
				var _dealt_card = ds_list_find_value(deck, ds_list_size(deck)-1);
				//Remove from deck and add to hand
				ds_list_delete(deck, ds_list_size(deck) - 1);
				ds_list_add(player_hand, _dealt_card);
				//Set card in hand's position
				_dealt_card.target_x = room_width/4 + _player_num * hand_x_offset - 100;
				_dealt_card.target_y = room_height * 0.8;
				audio_play_sound(snd_draw, 1, false, 0.8);
				//Set to in hand
				_dealt_card.in_player_hand = true;
				_dealt_card.face_up = true;
				player_total += _dealt_card.card_value;
				if(_dealt_card.card_type == 1){
					player_element_1_count++;
				}
				else if(_dealt_card.card_type == 2){
					player_element_2_count++;
				}
				else if(_dealt_card.card_type == 3){
					player_element_3_count++;
				}
				else if(_dealt_card.card_type == 4){
					player_element_4_count++;
				}
				
				if(_dealt_card.card_value == 11){
					player_ace_count++;	
				}
			}
			else if(keyboard_check_pressed(ord("R"))){
				audio_play_sound(snd_hit, 1, false, 0.8);
				player_turn_end = true;
			}
			else if(player_total == 21){
				player_turn_end = true;
			}
			else if(player_total > 21 && player_ace_count > 0){
				player_ace_count--;
				player_total -= 10;
			}
			else if(player_total > 21 && player_ace_count == 0){
				player_bust = true;
				player_turn_end = true;
			}
			else if(player_element_1_count > 2 || player_element_2_count > 2 || player_element_3_count > 2 || player_element_4_count > 2){
				player_bust = true;
				player_turn_end = true;
			}
		}
		else if(player_turn_end && !player_bust){
			move_timer_2++;
			if(move_timer_2 >= 45){
				move_timer_2 = 0;
				player_turn_end = false;
				global.state = STATES.CPU_CHOOSE;
			}
		}
		else if(player_turn_end && player_bust){
			move_timer_2++;
			if(move_timer_2 >= 45){
				move_timer_2 = 0;
				player_turn_end = false;
				global.state = STATES.RESOLVE;
			}
		}
		break;
		
	case STATES.CPU_CHOOSE:
		//Find number of cards currently in dealer's hand
		var _cpu_num = ds_list_size(cpu_hand);
		cpu_hand[|0].face_up = true;
		if(cpu_total < 17 && move_timer_3 == 0){
			//Grab top card
			var _dealt_card = ds_list_find_value(deck, ds_list_size(deck)-1);
			//Remove from deck and add to hand
			ds_list_delete(deck, ds_list_size(deck) - 1);
			ds_list_add(cpu_hand, _dealt_card);
			//Set card in hand's position
			_dealt_card.target_x = room_width/4 + _cpu_num * hand_x_offset - 100;
			_dealt_card.target_y = room_height * 0.1;
			audio_play_sound(snd_draw, 1, false, 0.8);
			//Set to in hand
			_dealt_card.in_cpu_hand = true;
			_dealt_card.face_up = true;
			cpu_total += _dealt_card.card_value;
			if(_dealt_card.card_type == 1){
				cpu_element_1_count++;
			}
			else if(_dealt_card.card_type == 2){
				cpu_element_2_count++;
			}
			else if(_dealt_card.card_type == 3){
				cpu_element_3_count++;
			}
			else if(_dealt_card.card_type == 4){
				cpu_element_4_count++;
			}
			
			if(_dealt_card.card_value == 11){
				cpu_ace_count++;	
			}
		}
		else if(cpu_total >= player_total && cpu_total < 21){
			move_timer_2++;
			if(move_timer_2 >= 45){
				move_timer_2 = 0;
				global.state = STATES.RESOLVE;
			}
		}
		else if(cpu_total >= 17 && cpu_total <= 21){
			move_timer_2++;
			if(move_timer_2 >= 45){
				move_timer_2 = 0;
				global.state = STATES.RESOLVE;
			}
		}
		else if(cpu_total > 21 && cpu_ace_count > 0){
			cpu_ace_count--;
			cpu_total -= 10;
		}
		else if(cpu_total > 21 && cpu_ace_count == 0){
			cpu_bust = true;
			move_timer_2++;
			if(move_timer_2 >= 45){
				move_timer_2 = 0;
				global.state = STATES.RESOLVE;
			}
		}
		else if(cpu_element_1_count > 2 || cpu_element_2_count > 2 || cpu_element_3_count > 2 || cpu_element_4_count > 2){
			cpu_bust = true;
			move_timer_2++;
			if(move_timer_2 >= 45){
				move_timer_2 = 0;
				global.state = STATES.RESOLVE;
			}
		}
		break;
		
	case STATES.RESOLVE:
		if(!score_added){
			if(player_bust && !cpu_bust){
				obj_score.cpu_score++;
				audio_play_sound(snd_lose, 1, false, 0.8);
				player_bust = false;
				score_added = true;
			}
			else if(!player_bust && cpu_bust){
				obj_score.player_score++;
				audio_play_sound(snd_win, 1, false, 0.8);
				cpu_bust = false;
				score_added = true;
			}
			else{
				if(player_total > cpu_total){
					obj_score.player_score++;
					audio_play_sound(snd_win, 1, false, 0.8);
					score_added = true;
				}
				else if(cpu_total > player_total){
					obj_score.cpu_score++;
					audio_play_sound(snd_lose, 1, false, 0.8);
					score_added = true;
				}
				else if(cpu_total == player_total){
					score_added = true;
				}
			}
		}
		else if(score_added){
			move_timer_2++;
			if(move_timer_2 >= 90){
				move_timer_2 = 0;
				score_added = false;
				global.state = STATES.RESHUFFLE;
			}
		}
		break;
		
	case STATES.RESHUFFLE:
		player_total = 0;
		cpu_total = 0;
		
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
		
		//Loop through and put cards at appropriate position
		if(ds_list_size(cpu_hand) > 0 && move_timer_4 == 0){
			ds_list_find_value(cpu_hand, ds_list_size(cpu_hand) - 1).depth = ds_list_size(cpu_hand) - 1;
			ds_list_find_value(cpu_hand, ds_list_size(cpu_hand) - 1).target_y = y - 20 - 2 * (num_cards - ds_list_size(cpu_hand));
			ds_list_find_value(cpu_hand, ds_list_size(cpu_hand) - 1).target_x = x;
			audio_play_sound(snd_draw, 1, false, 0.8);
			ds_list_find_value(cpu_hand, ds_list_size(cpu_hand) - 1).face_up = false;
			ds_list_add(deck, ds_list_find_value(cpu_hand, ds_list_size(cpu_hand) - 1));
			ds_list_delete(cpu_hand, ds_list_size(cpu_hand) - 1);
		}
		else if(ds_list_size(player_hand) > 0 && move_timer_4 == 0){
			ds_list_find_value(player_hand, ds_list_size(player_hand) - 1).depth = ds_list_size(player_hand) - 1;
			ds_list_find_value(player_hand, ds_list_size(player_hand) - 1).target_y = y - 20 - 2 * (num_cards - ds_list_size(player_hand));
			ds_list_find_value(player_hand, ds_list_size(player_hand) - 1).target_x = x;
			audio_play_sound(snd_draw, 1, false, 0.8);
			ds_list_find_value(player_hand, ds_list_size(player_hand) - 1).face_up = false;
			ds_list_add(deck, ds_list_find_value(player_hand, ds_list_size(player_hand) - 1));
			ds_list_delete(player_hand, ds_list_size(player_hand) - 1);
		}
		else if(move_timer_4 == 0){
			ds_list_shuffle(deck);
			for(var _i = 0; _i < num_cards; _i++){
				ds_list_find_value(deck, _i).depth = num_cards - _i;
				ds_list_find_value(deck, _i).target_y = y - (2 * _i);
			}
			global.state = STATES.DEAL;
			break;
		}
}

move_timer++;
if(move_timer == 16) {
	move_timer = 0;
}


move_timer_4++;
if(move_timer_4 == 5) {
	move_timer_4 = 0;
}

move_timer_3++;
if(move_timer_3 == 30) {
	move_timer_3 = 0;
}






