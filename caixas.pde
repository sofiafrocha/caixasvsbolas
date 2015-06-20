class Caixa extends baseClass {
  
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
    
  }
  
    void draw() {
      pushMatrix();
        fill(0, 0, 255);
        translate(x, y, z);
        desenhaCaixa();
      popMatrix();
    } 

  void desenhaCaixa(){
    int Cx = 0;
    int Cy = 0;
    
    //Face 1 lado cima
    beginShape(QUADS);
      vertex( 0+Cx, 0+Cy, 100, 0, 0);
      vertex( 0+Cx, 100+Cy, 100, 0, 100);
      vertex( 100+Cx, 100+Cy, 100, 100, 100);
      vertex( 100+Cx, 0+Cy, 100, 100, 0);
    endShape();
    
    //Face 2 lado atrás
    beginShape(QUADS);
      vertex( 0+Cx, 0+Cy, 100, 0, 0);
      vertex( 0+Cx, 100+Cy, 100, 0, 100);
      vertex( 0+Cx, 100+Cy, 0, 100, 100);
      vertex( 0+Cx, 0+Cy, 0, 100, 0);
    endShape();
    
    //Face 3 frente
    beginShape(QUADS);
      vertex( 0+Cx, 100+Cy, 0, 0, 0);
      vertex( 0+Cx, 100+Cy, 100, 0, 100);
      vertex( 100+Cx, 100+Cy, 100, 100, 100);
      vertex( 100+Cx, 100+Cy, 0, 100, 0);
    endShape();
    
    //Face 4 lado baixo
    beginShape(QUADS);
      vertex( 0+Cx, 100+Cy, 0, 0, 0);
      vertex( 0+Cx, 0+Cy, 0, 0, 100);
      vertex( 100+Cx, 0+Cy, 0, 100, 100);
      vertex( 100+Cx, 100+Cy, 0, 100, 0);
    endShape();
    
    //Face 5 atrás
    beginShape(QUADS);
      vertex( 0+Cx, 0+Cy, 100, 0, 0);
      vertex( 0+Cx, 0+Cy, 0, 0, 100);
      vertex( 100+Cx, 0+Cy, 0, 100, 100);
      vertex( 100+Cx, 0+Cy, 100, 100, 0);
    endShape();
    
    //Face 6 lado frente
    beginShape(QUADS);
      vertex( 100+Cx, 100+Cy, 0, 0, 0);
      vertex( 100+Cx, 100+Cy, 100, 0, 100);
      vertex( 100+Cx, 0+Cy, 100, 100, 100);
      vertex( 100+Cx, 0+Cy, 0, 100, 0);
    endShape();
  }

}
