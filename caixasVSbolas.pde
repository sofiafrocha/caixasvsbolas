// Board
int boardWidth = 150;
int boardHeight = 300;
int boardDepth = 10;

// Camera
int camPosX = 100;
int camPosY = 200;
int camPosZ = 100;

void setup() {
	size(1000, 700, P3D);
}

void draw() {
	camera(camPosX, camPosY, camPosZ, 0, 0, 0, 0, 0, -1);
	translate(0, 0, 0); 
	box(boardWidth, boardHeight, boardDepth);
}
