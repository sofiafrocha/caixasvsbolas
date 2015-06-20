class baseClass {
	//Location
	int x, y, z;

	// Dimensions
	int width;
	int height;
	int depth;

	// Colour
	color c = color(255, 0, 0);

	// Textura
	// to-do

	// State
	// 0: waiting
	// 1: placed, being used as barrier
	// 2: on the move, being used as ammon
	int state;

	// Velocity
	int velocity;

	// Team
	String team;


	// // Functions
 
	void setPosition(int temp_x,int temp_y,int temp_z) {
		x = temp_x;
		y = temp_y;
		z = temp_z;
	}

	void setVelocity(int v) {
		velocity = v;
	}

	void setColour(color temp_c) {
		c = temp_c;
	}

	void setState(int s) {
		state = s;
	}

	// // Moving
	void moveRight() {
		x = x + velocity;
	}

	void moveLeft() {
		x = x - velocity;
	}

	void moveUp() {
		y = y - velocity;
	}

	void moveDown() {
		y = y + velocity;
	}

}