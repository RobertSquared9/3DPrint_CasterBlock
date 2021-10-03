//$fn=90; // Make things more round for export
$fn=9; // Renders faster for dev

caster_diam = 67; //actually measures 65mm
caster_width = 53; //actually measures 51mm

chock_cyl_pad = 5;
chock_floor_pad = 2;

chock_x = caster_diam + (chock_cyl_pad * 2);
chock_y = caster_width + (chock_cyl_pad * 2);
chock_height = caster_diam * 0.45;

difference()
{
	rounded_cube([chock_x, chock_y, chock_height], chock_cyl_pad);
	translate([chock_x/2, chock_cyl_pad, (caster_diam / 2) + chock_floor_pad])
	{
		rotate([-90,0,0])
		#cylinder(h=caster_width, d=caster_diam);
	}
}


module rounded_cube(vector, rounded_rad=1)
{
	let(x = vector[0]-(2*rounded_rad), y = vector[1]-(2*rounded_rad), z = vector[2]-(2*rounded_rad))
	{
		hull()
		{
			translate([rounded_rad, rounded_rad, rounded_rad])
			{
				sphere(r=rounded_rad);
				
				translate([x, 0, 0])
				sphere(r=rounded_rad);
				
				translate([0, y, 0])
				sphere(r=rounded_rad);
				
				translate([0, 0, z])
				sphere(r=rounded_rad);
				
				
				translate([x, y, 0])
				sphere(r=rounded_rad);
				
				translate([0, y, z])
				sphere(r=rounded_rad);
				
				translate([x, 0, z])
				sphere(r=rounded_rad);
				
				translate([x, y, z])
				sphere(r=rounded_rad);
			}
		}
	}
}