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
		tz((baseThickness + diceDiameter / 2) / 2)
		    cube(size =
		             [
			             diceDistance * 7 - diceSpacing + wallThickness * 2,
			             diceDistance * 7 - diceSpacing + wallThickness * 2,
			             baseThickness + diceDiameter / 2
		             ],
		         center = true);
		tz(baseThickness + diceDiameter / 2) gridPlacement()
		    sphere(r = diceRadius);
		tz(baseThickness + diceDiameter / 2) lidMagnetPlacement()
		    cylinder(d = 3 + tol, h = 2.5, center = true);
	}
}
boxBase();
