int ptsW, ptsH;

PImage text_bolas;

int numPointsW;
int numPointsH_2pi; 
int numPointsH;

float[] coorX;
float[] coorY;
float[] coorZ;
float[] multXZ;

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
    
    if (team_temp == "caixas") {
            direction = -1;
        } else {
            direction = 1;
        }
  }

  void draw(){
        text_bolas = loadImage("data/neve.jpg");
        fill(c);
        noTint();
        pushMatrix();
            ptsW = 15;
            ptsH = 15;
            translate(x, y, z);
            desenhaBola(ptsW, ptsH);
            texturaBola(10, 10, 10, text_bolas);
        popMatrix();
  }

        //Adaptado do exemplo do Processing.org
        void desenhaBola(int numPtsW, int numPtsH_2pi){
           // The number of points around the width and height
          numPointsW=numPtsW+1;
          numPointsH_2pi=numPtsH_2pi;  // How many actual pts around the sphere (not just from top to bottom)
          numPointsH=ceil((float)numPointsH_2pi/2)+1;  // How many pts from top to bottom (abs(....) b/c of the possibility of an odd numPointsH_2pi)
        
          coorX=new float[numPointsW];   // All the x-coor in a horizontal circle radius 1
          coorY=new float[numPointsH];   // All the y-coor in a vertical circle radius 1
          coorZ=new float[numPointsW];   // All the z-coor in a horizontal circle radius 1
          multXZ=new float[numPointsH];  // The radius of each horizontal circle (that you will multiply with coorX and coorZ)
        
          for (int i=0; i<numPointsW ;i++) {  // For all the points around the width
            float thetaW=i*2*PI/(numPointsW-1);
            coorX[i]=sin(thetaW);
            coorZ[i]=cos(thetaW);
          }
          
          for (int i=0; i<numPointsH; i++) {  // For all points from top to bottom
            if (int(numPointsH_2pi/2) != (float)numPointsH_2pi/2 && i==numPointsH-1) {  // If the numPointsH_2pi is odd and it is at the last pt
              float thetaH=(i-1)*2*PI/(numPointsH_2pi);
              coorY[i]=cos(PI+thetaH); 
              multXZ[i]=0;
            } 
            else {
              //The numPointsH_2pi and 2 below allows there to be a flat bottom if the numPointsH is odd
              float thetaH=i*2*PI/(numPointsH_2pi);
        
              //PI+ below makes the top always the point instead of the bottom.
              coorY[i]=cos(PI+thetaH); 
              multXZ[i]=sin(thetaH);
            }
          }
          
        }

        //Adaptado do exemplo do Processing.org
        void texturaBola(float rx, float ry, float rz, PImage t){
          
          float changeU=t.width/(float)(numPointsW-1); 
          float changeV=t.height/(float)(numPointsH-1); 
          float u=0;  // Width variable for the texture
          float v=0;  // Height variable for the texture
        
          beginShape(TRIANGLE_STRIP);
          texture(t);
          for (int i=0; i<(numPointsH-1); i++) {  // For all the rings but top and bottom
            float coory=coorY[i];
            float cooryPlus=coorY[i+1];
        
            float multxz=multXZ[i];
            float multxzPlus=multXZ[i+1];
        
            for (int j=0; j<numPointsW; j++) {  // For all the pts in the ring
              normal(coorX[j]*multxz, coory, coorZ[j]*multxz);
              vertex(coorX[j]*multxz*rx, coory*ry, coorZ[j]*multxz*rz, u, v);
              normal(coorX[j]*multxzPlus, cooryPlus, coorZ[j]*multxzPlus);
              vertex(coorX[j]*multxzPlus*rx, cooryPlus*ry, coorZ[j]*multxzPlus*rz, u, v+changeV);
              u+=changeU;
            }
            v+=changeV;
            u=0;
          }
          endShape();
        }

}
