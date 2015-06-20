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


	///// Functions
	/*baseClass (int x_temp, int y_temp, int z_temp, int w_temp, int h_temp, int d_temp, int state_temp, int velocity_temp, String team_temp) {
		
		x = x_temp;
		y = y_temp;
		z = z_temp;
		width = w_temp;
		height = h_temp;
		depth = d_temp;
		state = state_temp;
		velocity = velocity_temp;
		team = team_temp;
	}
*/

 /*
	setPosition(int x,int y,int z) {

	}

	setVelocity(iint v) {

	}

	setColour(color c) {

	}

	setState(int s) {

	}
*/

}
