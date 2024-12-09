use <utility.scad>;
$fn = 120;

tol = 0.4;
diceDiameter = 25;
diceSpacing = 1.2;
diceRadius = diceDiameter / 2;
diceDistance = diceDiameter + diceSpacing;

module lidMagnetPlacement() {
	mx() my() {
		diag = diceDistance * 3 + sqrt(2) / 2 * (25 / 2 + 1.2 + 3 + tol / 2);
		txy(diag, diag) children(1);
		txy(diceDistance * 3.5, diceDistance * 1.5) children(0);
		txy(diceDistance * 1.5, diceDistance * 3.5) children(0);
	}
}

module baseMagnetPlacement() {
	mx() my() {
		diag = diceDistance * 3 + sqrt(2) / 2 * (25 / 2 + 1.2 + 3 + tol / 2);
		txy(diag, diag) children();
	}
}

baseMagnetPlacement() { cylinder(d = 6, h = 5); }
