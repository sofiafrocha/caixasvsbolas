// Game
int ammountAmmo = 6;
int intervalBetweenAmmo = 16;
int size = 10;

// Camera
int camPosX = 100;
int camPosY = 200;
int camPosZ = 160;

// Points
int healthCaixas = 100;
int healthBolas = 100;

// The Board
int boardWidth = 150;
int boardHeight = 300;
int boardDepth = 8;

int temp_x = -1 * boardWidth/2;

// The Players
Caixa player1 = new Caixa(0, boardHeight/2-20, 14, 10, 10, 10, 0, 10, "caixas");
Bola player2 = new Bola(0, -boardHeight/2+20, 14, 10, 10, 10, 0, 10, "bolas");

// The Ammo Clips
Caixa[] caixas = new Caixa[ammountAmmo];
Bola[] bolas = new Bola[ammountAmmo];


void setup() {
  size(1000, 700, P3D);
  //Ajusta o numero de poligonos das esferas
  sphereDetail(8);

  // The Ammo
  //for (int i = 0; i < caixas.length; ++i) {
    // é preciso?????
  //}
  
  for (int k = 0; k < caixas.length; k++){
        temp_x = size* k + intervalBetweenAmmo*k;
        temp_x = temp_x - ammountAmmo * size - intervalBetweenAmmo/2;
        caixas[k] = new Caixa(temp_x, boardHeight/2+40, 14, size, size, size, 0, 0, "caixas");
        bolas[k] = new Bola(temp_x, -boardHeight/2-40, 14, size, size, size, 0, 0, "bolas");
    }
  
  
  /*for (int i=0; i < caixas.length; i++){

        if (caixas[i].state == 0) {
            pushMatrix();
                translate (temp_x, 20);
                caixas[i].draw();
                temp_x = temp_x + 11;
            popMatrix();
        }
              
        if (caixas[i].state == 1) {
            pushMatrix();
                translate (boardWidth/2, 200);
                caixas[i].draw();
            popMatrix();
        }
    }*/
    
}

void draw() {
    background(255, 255, 255);
  camera(camPosX, camPosY, camPosZ, 0, 0, 0, 0, 0, -1);
  
  translate(0, 0, 0); 
  box(boardWidth, boardHeight, boardDepth);
    
    

  // Draw the Ammo
  for (int i = 0; i < ammountAmmo; ++i) {
      if (caixas[i].state == 2) {
          caixas[i].fire(boardWidth, boardHeight);
      }
      
    caixas[i].draw();
    
    if (bolas[i].state == 2) {
          bolas[i].fire(boardWidth, boardHeight);
      }
      
      bolas[i].draw();
  }
  /*

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
  // Draw the Players
  player2.draw();
    player1.draw();
    
    //placeLimboAmmo();
}

// Controls
void keyPressed() {
  
  switch (keyCode) {
    case DOWN:
      player2.moveDown();
      println("moveDown - player2");
      break;

    case UP:
      player2.moveUp();
      println("moveUp - player2");
      break;

    case RIGHT:
      player2.moveRight();
      println("moveRight - player2");
      break;

    case LEFT:
      player2.moveLeft();
      println("moveLeft - player2");
      break;

  }

  switch (key) {
    case 'U':
    case 'u':
      camPosY = camPosY - 10;
      break;

    case 'J':
    case 'j':
      camPosY = camPosY + 10;
      break;

    case 'H':
    case 'h':
      camPosX = camPosX - 10;
      break;

    case 'K':
    case 'k':
      camPosX = camPosX + 10;
      break;

    // // Controlos do jogador 1

    case 'W':
    case 'w':
      player1.moveUp();
      println("moveUp - player1");
      break;

    case 'S':
    case 's':
        println("moveDown - player1");
      player1.moveDown();
      break;

    case 'A':
    case 'a':
        println("moveLeft - player1");
      player1.moveLeft();
      break;

    case 'D':
    case 'd':
        println("moveRight - player1");
      player1.moveRight();
      break;
      
    case 'F':
    case 'f':
        println("trigger! player1");
        trigger(caixas, 1);
        break;

  }
}

void trigger(Caixa[] ammo, int playerNumber) {
    
    for (int i = 0; i < ammo.length; i++) {
        if (ammo[i].state == 1) {
            
            //mudar o estado da ammo
            ammo[i].state = 2;
            
            //por a ammo á frente do seu jogador
            if (playerNumber == 1) {
                ammo[i].setPosition(player1.x, player1.y -10, ammo[i].z);
            }
            else {
                ammo[i].setPosition(player2.x, player2.y +10, ammo[i].z);
            }
            
            //marcar a proxima ammo como a seguinte
            if (i == ammo.length) {
                ammo[0].state = 1;
            } else {
                ammo[i+1].state = 1;
            }
            
            // chegar as ammos todas um bocado para o lado
            for (int k = 0; k < ammo.length; k++) {
                if (ammo[k].state == 0) {
                    ammo[k].x = ammo[k].x + intervalBetweenAmmo;
                }
            }
            break;
        }
    }
}

void placeLimboAmmo() {
    for (int i = 0; i < caixas.length; i++) {
        if (caixas[i].state == 4) {
            
            int mostLeft = 20000;
            int y_temp = 20000;
            
            // ve qual a ammo mais a esquerda
            for (int k = 0; k < caixas.length; k++) {
                if (caixas[k].x < mostLeft) {
                    mostLeft = caixas[k].x;
                }
                //encontra o y da linha das caixas
                if (caixas[k].state == 0) {
                    y_temp = caixas[k].y;
                }
            }
            
            //muda ammo para estar em espera
            caixas[i].state = 0;
            //poe na com as outras caixas
            caixas[i].setPosition(mostLeft-intervalBetweenAmmo, y_temp, caixas[i].z);
        }
    }
    
    for (int i = 0; i < bolas.length; i++) {
        if (bolas[i].state == 4) {
            
            int mostLeft = 20000;
            int y_temp = 20000;
            
            // ve qual a ammo mais a esquerda
            for (int k = 0; k < bolas.length; k++) {
                if (bolas[k].x < mostLeft) {
                    mostLeft = caixas[k].x;
                }
                //encontra o y da linha das caixas
                if (bolas[k].state == 0) {
                    y_temp = bolas[k].y;
                }
            }
            
            //muda ammo para estar em espera
            bolas[i].state = 0;
            //poe na com as outras caixas
            bolas[i].setPosition(mostLeft-intervalBetweenAmmo, y_temp, bolas[i].z);
        }
    }
}
