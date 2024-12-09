use <utility.scad>;
use <dicePlacement.scad>
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
		tz(3 * (baseThickness + diceDiameter / 2) / 2 - baseThickness)
		    cube(size =
		             [
			             diceDistance * 7 - diceSpacing,
			             diceDistance * 7 - diceSpacing,
			             baseThickness + diceDiameter / 2
		             ],
		         center = true);
	}
}
boxBase();
