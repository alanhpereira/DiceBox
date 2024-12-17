use <utility.scad>;
use <dicePlacement.scad>
use <magnetPlacement.scad>
use <indexingPlacement.scad>
$fn = 120;

tol = 0.4;
wallThickness = 2;
baseThickness = 2;
diceDiameter = 23;
diceHeight = 20;
diceSpacing = 1.2;
indexDiameter = 3;
diceRadius = diceDiameter / 2;
diceDistance = diceDiameter + diceSpacing;

module boxBase() {
	side = diceDistance * 7 - diceSpacing + wallThickness * 2;
	difference() {
		union() {
			linear_extrude(height = baseThickness + diceHeight / 2) {
				rsquare([ side, side ], 4.5);
			}
			tz(baseThickness + diceHeight / 2) indexingPlacement()
			    sphere(d = indexDiameter);
		}
		tz(baseThickness) gridPlacement()
		    cylinder(r = diceRadius, h = diceHeight);
		tz(baseThickness + diceHeight / 2) {
			lidMagnetPlacement() { tz(-5.6) cylinder(d = 6 + tol, h = 5.2); }
		}
		baseMagnetPlacement() { tz(0.4) cylinder(d = 6 + tol, h = 5.2); }
	}
}
boxBase();
