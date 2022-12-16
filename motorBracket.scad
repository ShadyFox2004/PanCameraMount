/**
 * @author ShadyFox2004
 * Simple model of a mount for a stepper motor, including clearance for the 3d printing
 */
 
clearance = 0.20;

$fn = 100;

module centerClearance() {
    cylinder(d=22+clearance, center = true, h = 2.00);
}    

module screwHole() {
    cylinder(d=2.5+clearance, center = true, h = 2.00);
}
    
SPTP = 30.50;
holeOffset = SPTP/2;

module holes() { 
        centerClearance();
        // Pitagore
        radius = sqrt(holeOffset^2 + holeOffset^2); 
        for(theta = [45:90:360]) {
            translate([cos(theta)*radius, sin(theta)*radius, 0]) {
                screwHole();
            }
        }
}
side = 42;
    
difference() { 
    cube([side, side, 1], center=true);
    holes();
}
// Cute animation for part show case
$vpr = [45+ 25*sin($t*180), 0, $t * 360];
