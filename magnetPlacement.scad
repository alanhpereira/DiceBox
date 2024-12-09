use <utility.scad>;
$fn = 120;

diceDiameter = 25;
diceSpacing = 1.2;
diceRadius = diceDiameter / 2;
diceDistance = diceDiameter + diceSpacing;

module lidMagnetPlacement() {
	mx() my() {
		txy(diceDistance * 3.5, diceDistance * 3.5) children();
		txy(diceDistance * 3.5, diceDistance * 1.5) children();
		txy(diceDistance * 1.5, diceDistance * 3.5) children();
	}
}

lidMagnetPlacement() cylinder(d = 3, h = 1, center = true);
