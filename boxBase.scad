use <utility.scad>;
use <dicePlacement.scad>
use <magnetPlacement.scad>
$fn = 120;

tol = 0.4;
wallThickness = 3.9;
baseThickness = 2;
diceDiameter = 25;
diceSpacing = 1.2;
diceRadius = diceDiameter / 2;
diceDistance = diceDiameter + diceSpacing;

module boxBase() {
	side = diceDistance * 7 - diceSpacing + wallThickness * 2;
	difference() {
		linear_extrude(height = baseThickness + diceDiameter / 2) {
			rsquare([ side, side ], 4.5);
		}
		tz(baseThickness + diceDiameter / 2) gridPlacement()
		    sphere(r = diceRadius);
		tz(baseThickness + diceDiameter / 2) lidMagnetPlacement() {
			tz(-1.2) cylinder(d = 3, h = 2);
			tz(-5.2) cylinder(d = 6, h = 6);
		}
		baseMagnetPlacement() { tz(-1) cylinder(d = 6, h = 7); }
	}
}
boxBase();
