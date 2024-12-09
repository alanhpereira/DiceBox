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
		tz((baseThickness + diceRadius))
		    linear_extrude(height = baseThickness + diceRadius) {
			rsquare([ side, side ], 4.5);
		}
		difference() {
			tz((baseThickness + diceRadius) - baseThickness)
			    linear_extrude(height = baseThickness + diceRadius) {
				rsquare([ side - wallThickness * 2, side - wallThickness * 2 ],
				        diceRadius);
			}
			tz(baseThickness + diceRadius) lidMagnetPlacement() {
				union() {
					tz(-1) cylinder(d = 3 + tol + 1.6, h = 2.2);
					tz(1.2) cylinder(d1 = 3 + tol + 1.6, d2 = 0,
					                 h = (3 + tol + 1.6) / 2);
				}
				union() { tz(-1) cylinder(d = 6 + tol + 1.6, h = 6.2); };
			}
		}

		tz(baseThickness + diceRadius) lidMagnetPlacement() {
			tz(-0.8) cylinder(d = 3, h = 2);
			tz(-0.8) cylinder(d = 6, h = 6);
		}
	}
}
boxBase();
