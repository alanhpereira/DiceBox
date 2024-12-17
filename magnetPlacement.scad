use <utility.scad>;
$fn = 120;

tol = 0.4;
diceDiameter = 23;
diceHeight = 20;
diceSpacing = 1.2;
diceRadius = diceDiameter / 2;
diceDistance = diceDiameter + diceSpacing;

module lidMagnetPlacement() {
	txy(0, 0) children();
	/*
	mx() my() {
	    diag = diceDistance * 2.5;
	    txy(diag, diag) children();
	}*/
}

module baseMagnetPlacement() {
	txy(0, 0) children();
	/*
	mx() my() {
	    diag = diceDistance * 2.5;
	    txy(diag, diag) children();
	}*/
}

baseMagnetPlacement() { cylinder(d = 6, h = 5); }
