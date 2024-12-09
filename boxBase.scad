use <utility.scad>;
use <dicePlacement.scad>
$fn = 120;

tol = 0.4;
tir = 4.2;
wallThickness = 2;
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
	}
}
boxBase();
