use <utility.scad>;
use <dicePlacement.scad>
use <magnetPlacement.scad>
$fn = 120;

tol = 0.4;
wallThickness = 3.2;
baseThickness = 2;
diceDiameter = 25;
diceSpacing = 1.2;
diceRadius = diceDiameter / 2;
diceDistance = diceDiameter + diceSpacing;

module boxBase() {
	difference() {
		tz(3 * (baseThickness + diceDiameter / 2) / 2)
		    cube(size =
		             [
			             diceDistance * 7 - diceSpacing + wallThickness * 2,
			             diceDistance * 7 - diceSpacing + wallThickness * 2,
			             baseThickness + diceDiameter / 2
		             ],
		         center = true);
		difference() {
			tz(3 * (baseThickness + diceDiameter / 2) / 2 - baseThickness)
			    cube(size =
			             [
				             diceDistance * 7 - diceSpacing,
				             diceDistance * 7 - diceSpacing,
				             baseThickness + diceDiameter / 2
			             ],
			         center = true);
			tz(baseThickness + diceDiameter / 2) lidMagnetPlacement() {
				cylinder(d = 3 + tol + 1.6, h = 2.5, center = true);
				tz(1.25) cylinder(d1 = 3 + tol + 1.6, d2 = 0,
				                  h = (3 + tol + 1.6) / 2);
			}
		}

		tz(baseThickness + diceDiameter / 2) lidMagnetPlacement()
		    cylinder(d = 3 + tol, h = 2.5, center = true);
	}
}
boxBase();
