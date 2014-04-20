use <MCAD/boxes.scad>;
$fn = 100;

boardWidth = 87;
boardDepth = 95;
boardHeight = 25;
holeRadius = 2;
holeOffset = 1;
lcdWidth = 65;
lcdDepth = 50;
lcdX = (boardWidth - lcdWidth) / 2;
lcdY =25;

difference() {
	translate([boardWidth / 2, boardDepth / 2, boardHeight / 2])
	roundedBox([boardWidth, boardDepth, boardHeight], 2);
	translate([lcdWidth / 2, lcdDepth / 2, boardHeight / 2])
	translate([lcdX, lcdY, -.5])
	roundedBox([lcdWidth, lcdDepth, boardHeight + 2], .5);
}
