#region Particle Types
var part = part_type_create();

part_type_sprite(part, spr_star, false, false, false);
part_type_life(part, 200, 300);
part_type_speed(part, 2, 4, 0.25, 0);
part_type_direction(part, 0, 359, 0, 0);
part_type_orientation(part, 0, 359, 0, 0, false);
part_type_size(part, 10, 5, -0.25, 0);

global.basicPart = part;

var hit_part = part_type_create();

part_type_sprite(hit_part, spr_star, false, false, false);
part_type_life(hit_part, 200, 300);
part_type_speed(hit_part, 1, 2, 0.20, 0);
part_type_direction(hit_part, 0, 359, 0, 0);
part_type_orientation(hit_part, 0, 359, 0, 0, false);
part_type_size(hit_part, 2, 1, -0.05, 0);

global.hitPart = hit_part;

#endregion