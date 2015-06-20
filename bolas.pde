class Bola extends baseClass {

	Bola(int x_temp, int y_temp, int z_temp, int w_temp, int h_temp, int d_temp, int state_temp, int velocity_temp, String team_temp) {
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

	void draw(){
		pushMatrix();
			translate(x, y, z);
			sphere(width);
		popMatrix();
	}

}