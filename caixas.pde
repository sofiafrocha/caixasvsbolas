class Caixa extends baseClass {
    
    PImage cubo;
    
  
  Caixa(int x_temp, int y_temp, int z_temp, int w_temp, int h_temp, int d_temp, int state_temp, int velocity_temp, String team_temp) {
    x = x_temp;
    y = y_temp;
    z = z_temp;
    width = w_temp;
    height = h_temp;
    depth = d_temp;
    state = state_temp;
    velocity = velocity_temp;
    team = team_temp;
    
    cubo = loadImage("neve.jpg");
    
    if (team_temp == "caixas") {
        direction = 1;
    } else {
        direction = -1;
    }
    
  }
  
    void draw() {
      pushMatrix();
        translate(x, y, z);
        desenhaCaixa();
      popMatrix();
    } 

  void desenhaCaixa(){
    
    textureMode(IMAGE);
    
    int Cx = 0;
    int Cy = 0;
    
    //Face 1 lado cima
    beginShape(QUADS);
    texture(cubo);
      vertex( 0+Cx, 0+Cy, 10, 0, 0);
      vertex( 0+Cx, 10+Cy, 10, 0, 100);
      vertex( 10+Cx, 10+Cy, 10, 100, 100);
      vertex( 10+Cx, 0+Cy, 10, 100, 0);
    endShape();
    
    //Face 2 lado atrás
    beginShape(QUADS);
    texture(cubo);
      vertex( 0+Cx, 0+Cy, 10, 0, 0);
      vertex( 0+Cx, 10+Cy, 10, 0, 100);
      vertex( 0+Cx, 10+Cy, 0, 100, 100);
      vertex( 0+Cx, 0+Cy, 0, 100, 0);
    endShape();
    
    //Face 3 frente
    beginShape(QUADS);
    texture(cubo);
      vertex( 0+Cx, 10+Cy, 0, 0, 0);
      vertex( 0+Cx, 10+Cy, 10, 0, 100);
      vertex( 10+Cx, 10+Cy, 10, 100, 100);
      vertex( 10+Cx, 10+Cy, 0, 100, 0);
    endShape();
    
    //Face 4 lado baixo
    beginShape(QUADS);
    texture(cubo);
      vertex( 0+Cx, 10+Cy, 0, 0, 0);
      vertex( 0+Cx, 0+Cy, 0, 0, 100);
      vertex( 10+Cx, 0+Cy, 0, 100, 100);
      vertex( 10+Cx, 10+Cy, 0, 100, 0);
    endShape();
    
    //Face 5 atrás
    beginShape(QUADS);
    texture(cubo);
      vertex( 0+Cx, 0+Cy, 10, 0, 0);
      vertex( 0+Cx, 0+Cy, 0, 0, 100);
      vertex( 10+Cx, 0+Cy, 0, 100, 100);
      vertex( 10+Cx, 0+Cy, 10, 100, 0);
    endShape();
    
    //Face 6 lado frente
    beginShape(QUADS);
    texture(cubo);
      vertex( 10+Cx, 10+Cy, 0, 0, 0);
      vertex( 10+Cx, 10+Cy, 10, 0, 100);
      vertex( 10+Cx, 0+Cy, 10, 100, 100);
      vertex( 10+Cx, 0+Cy, 0, 100, 0);
    endShape();
  }

}
