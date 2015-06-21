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
  // 1: next in use
  // 2: placed, being used as barrier
  // 3: on the move, being used as ammo
  // 4: in Limbo - needs to be placed
  int state;

  // Velocity
  int velocity;
  int direction;

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
  
  // // Fire
  void fire(int boardWidth, int boardHeight) {
      // se estiver ainda dentro do tabuleiro
      if (y < boardHeight*direction) {
          y = y + velocity*direction;
      }
      // else, mudar o state
      else {
          //por no limbo, para no outro lado ser posta no seu sitio
          state = 4;
      }
  }

}
