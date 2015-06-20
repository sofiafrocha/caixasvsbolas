// Game
int ammountAmmo = 10;

// Camera
int camPosX = 100;
int camPosY = 200;
int camPosZ = 100;

// Points
int healthCaixas = 100;
int healthBolas = 100;

// The Board
int boardWidth = 150;
int boardHeight = 300;
int boardDepth = 10;

// The Players
//Caixa player1 = new Caixa();
Bola player2 = new Bola(0,0,70, 10, 10, 10, 0, 0, "bolas");

// The Ammo Clips
//Caixa[] caixas = new Caixa[ammountAmmo];
//Bola[] bolas = new Bola[ammountAmmo];


void setup() {
	size(1000, 700, P3D);

	// The Ammo
	//for (int i = 0; i < caixas.length; ++i) {
		// é preciso?????
	//}
}

void draw() {
        background(255, 255, 255);
	camera(camPosX, camPosY, camPosZ, 0, 0, 0, 0, 0, -1);
	
	translate(0, 0, 0); 
	box(boardWidth, boardHeight, boardDepth);

	/*// Draw the Ammo
	for (int i = 0; i < caixas.length; ++i) {
		caixas[i].draw();
	}
	for (int i = 0; i < bolas.length; ++i) {
		bolas[i].draw();
	}

	// Draw the Players
	player1.draw();
	player2.draw();

	// Detect colision between things
	// // Ammo <-> Barriers
	for (int k = 0; k < caixas.length; ++k) {
		for (int j = 0; j < bolas.length; ++j) {
			if (dist(bolas, y1, z1, x2, y2, z2);) {
				
			}
		}
	}

	// // Players <-> Ammo

	*/
	player2.draw();

}

// Controls
void keyPressed() {
	
	switch (keyCode) {
		case DOWN:
			// plantar uma barreira

		case UP:
			// atirar ammo

		case RIGHT:
			//move right

		case LEFT:
			//move left

	}

	switch (key) {
		case 'W':
		case 'w':
			camPosY = camPosY - 10;
			break;

		case 'S':
		case 's':
			camPosY = camPosY + 10;
			break;

		case 'A':
		case 'a':
			camPosX = camPosX - 10;
			break;

		case 'D':
		case 'd':
			camPosX = camPosX + 10;
			break;

	}
}
