use <utility.scad>;
$fn = 120;

diceDiameter = 25;
diceSpacing = 1.2;
diceRadius = diceDiameter / 2;
diceDistance = diceDiameter + diceSpacing;

module hexagonalPlacement() {
	h = sqrt(3) / 2 * diceDistance;
	for (i = [0:5]) rz(60 * i) {
			ty(diceDistance) children();
			txy(h, 1.5 * diceDistance) children();
			ty(2 * diceDistance) children();
			txy(h, 2.5 * diceDistance) children();
			txy(-h, 2.5 * diceDistance) children();
			ty(3 * diceDistance) children();
			txy(2 * h, 3 * diceDistance) children();
		}
}

module gridPlacement() {
	for (i = [-3:3], j = [-3:3])
		txy(diceDistance * i, diceDistance * j) children();
}

// hexagonalPlacement() sphere(r = diceRadius);
gridPlacement() sphere(r = diceRadius);
cube([ 190, 190, 0.1 ], center = true);
