use <utility.scad>;
$fn = 120;

tol = 0.4;
wallThickness = 3.9;
baseThickness = 2;
diceDiameter = 23;
diceHeight = 20;
diceSpacing = 1.2;
indexDiameter = 3;
diceRadius = diceDiameter / 2;
diceDistance = diceDiameter + diceSpacing;

module indexingPlacement() {
	side = (diceDistance * 2 - diceSpacing) / 2 - tol;
	diag = diceDistance * 0.5 +
	       sqrt(2) / 2 * (diceRadius + diceSpacing + indexDiameter / 2 + tol);
	mx() my() {
		// txy(side, diceDistance * 0.5) children();
		txy(side, diceDistance * 0) children();
		// txy(diceDistance * 0.5, side) children();
		txy(diceDistance * 0, side) children();
		txy(diag, diag) children();
	}
}
indexingPlacement() sphere(3);
