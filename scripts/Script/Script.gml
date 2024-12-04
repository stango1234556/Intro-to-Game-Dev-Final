#region Particle Types
var part = part_type_create();

part_type_sprite(part, spr_star, false, false, false);
part_type_life(part, 40, 80);
part_type_speed(part, 1, 3, 0.25, 0);
part_type_direction(part, 0, 359, 0, 0);
part_type_orientation(part, 0, 359, 0, 0, false);
part_type_size(part, 0, 1, -0.05, 0);

global.basicPart = part;

#endregion