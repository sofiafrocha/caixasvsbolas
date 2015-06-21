//Menu
boolean GameStoped = true;
boolean EnableKeys = false;
boolean MenuInicial = true;

PFont f,f2,f3,f4;

// Game
int ammountAmmo = 6;
int intervalBetweenAmmo = 16;
int size = 10;

// Camera
int camPosX = 100;
int camPosY = 280;
int camPosZ = 200;
boolean isOrtho = false;

// Points
int healthCaixas = 100;
int healthBolas = 100;
int hitDamage = 10;

// The Board
int boardWidth = 150;
int boardHeight = 300;
int boardDepth = 8;

int temp_x = -1 * boardWidth/2;

//Lights
int c1, c2, c3 = 255;
int d1, d2, d3 = 255;

// The Ammo Clips
Caixa[] caixas = new Caixa[ammountAmmo];
Bola[] bolas = new Bola[ammountAmmo];

// The Players
Caixa player1 = new Caixa(0, boardHeight/2-20, 14, 10, 10, 10, 0, 10, "caixas");
Bola player2 = new Bola(0, -boardHeight/2+20, 14, 10, 10, 10, 0, 10, "bolas");

void setup() {
  size(1000, 700, P3D);
  lights();
  //Ajusta o numero de poligonos das esferas
  //sphereDetail(8);

  // The Ammo
  //for (int i = 0; i < caixas.length; ++i) {
    // é preciso?????
  //}
  
  for (int k = 0; k < caixas.length; k++){
        temp_x = size* k + intervalBetweenAmmo*k;
        temp_x = temp_x - ammountAmmo * size - intervalBetweenAmmo/2;
        caixas[k] = new Caixa(temp_x, boardHeight/2+40, 14, size, size, size, 0, 8, "caixas");
        bolas[k] = new Bola(temp_x, -boardHeight/2-40, 14, size, size, size, 0, 8, "bolas");
    }
    
    caixas[0].state = 1;
    bolas[0].state = 1;
    
  f2 = createFont("Courier New", 80, true);
  f3 = createFont("Courier New", 30, true);
  f4 = createFont("Courier New", 20, true);
  textFont(f4);
  textAlign(CENTER);  
 
  smooth();
    
}

void draw() {
    if(MenuInicial==true){
    background(0,0,0,50);    
    fill(250, 250,250);
    textFont(f2);
    text("Caixas vs Bolas : Duelo Final", 0, 100, 1000, 700 );
    textFont(f3);
    text("Player1 - 'WASD to move / F to shoot'", 0, 400, 1000, 700);
    text("Player2 - 'Arrows to move / M to shoot'", 0, 450, 1000, 700);
    textFont(f4);
    text("Click anywhere to start", 0, 550, 1000, 700);
    noLoop();
    fill(0,0,100);
  }
  
  else {
    background(240, 240, 240);
    //ambientLight(0, 0, 180);
    
    if (isOrtho == true) {
        camera(camPosX, camPosY, camPosZ, 0, 0, 0, 0, 0, -1);
        ortho();
    }
    else {
        camera(camPosX, camPosY, camPosZ, 0, 0, 0, 0, 0, -1);
        perspective();
    }
    
  if (healthCaixas > 0 && healthBolas > 0) {
      pushMatrix();
          strokeWeight(2);
          stroke(0);
          
          fill(34,83,120);
          translate(0, 0, 0);
          box(boardWidth, boardHeight, boardDepth);
          
          translate(0,-50,-30);
          fill(172,240,242);
          box(400, 600, 10);
          
          fill(243,255,226);
          translate(0,0,0);
          sphere(1200);
          
          translate(0, boardHeight/4*30, -10);
          //box(boardWidth, 30, 10);
          
          noStroke();
        popMatrix();
        
        //Lights
        //Bolas
        if (healthBolas >= 80) {
            c1 = 142;
            c2 = 161;
            c3 = 6;
        }
        
        if (healthBolas >= 30 && healthBolas < 80) {
            c1 = 240;
            c2 = 198;
            c3 = 0;
        }
        
        if (healthBolas >= 0 && healthBolas < 30) {
            c1 = 255;
            c2 = 142;
            c3 = 0;
        }
        
       //pointLight(c1, c2, c3, 0, -boardHeight/2+40, 10);
       spotLight(c1, c2, c3, 5, -boardHeight/2-10, 50, 0, 0, -1, PI, 1);
       
       //Caixas
        if (healthCaixas >= 80) {
            d1 = 142;
            d2 = 161;
            d3 = 6;
        }
        
        if (healthCaixas >= 30 && healthCaixas < 80) {
            d1 = 240;
            d2 = 198;
            d3 = 0;
        }
        
        if (healthCaixas >= 0 && healthCaixas < 30) {
            d1 = 255;
            d2 = 144;
            d3 = 0;
        }
        
        
        
       //pointLight(d1, d2, d3, 0, boardHeight/2+60, 10);
       spotLight(d1, d2, d3, 5, boardHeight/2+50, 50, 0, 0, -1, PI, 1);
    
    
      // Draw the Ammo
      for (int i = 0; i < ammountAmmo; ++i) {
          if (caixas[i].state == 3) {
              caixas[i].fire(boardWidth, boardHeight);
          }
          
        caixas[i].draw();
        
        if (bolas[i].state == 3) {
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
        
        placeLimboAmmo();
        checkIfHit();
    
  }
  else {
      background(0,0,0);
      fill(255, 255, 255);
      rotateX(-PI/2);
      rotateY(PI/8);
      textSize(32);
      /*
        text("Vidas das Bolas: " + healthBolas, -140, 0);
        text("Vidas das Caixas: " + healthCaixas, -140, 50);
        */
  }
  }
}

// Controls
void keyPressed() {
    if(GameStoped==false){
    if(EnableKeys==true){
  
  switch (keyCode) {
    case DOWN:
        if (player2.y + player2.velocity*player2.direction > boardHeight/2) {
            player2.moveDown();
            player2.moveUp();
        }
      else {
          player2.moveDown();
      }
      println("moveDown - player2");
      break;

    case UP:
      if (player2.y + player2.velocity*player2.direction < -boardHeight/2+25) {
            player2.moveUp();
            player2.moveDown();
        }
      else {
          player2.moveUp();
      }
      println("moveUp - player2");
      break;

    case RIGHT:
        if (player2.x + player2.velocity*player2.direction > boardWidth/2) {
            player2.moveRight();
            player2.moveLeft();
        }
      else {
          player2.moveRight();
      }
      println("moveRight - player2");
      break;

    case LEFT:
        if (player2.x + player2.velocity*player2.direction < -boardWidth/2+25) {
            player2.moveLeft();
            player2.moveRight();
        }
      else {
          player2.moveLeft();
      }
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
        if (player1.y + player1.velocity*player1.direction > boardHeight/2-21) {
            player1.moveDown();
            player1.moveUp();
        }
      else {
          player1.moveDown();
      }
        println("moveDown - player1");
      break;

    case 'A':
    case 'a':
        if (player1.x + player1.velocity*player1.direction < -boardWidth/2+15) {
            player1.moveLeft();
            player1.moveRight();
        }
      else {
          player1.moveLeft();
      }
        println("moveLeft - player1");
      break;

    case 'D':
    case 'd':
        if (player1.x + player1.velocity*player1.direction > boardWidth/2-20) {
            player1.moveRight();
            player1.moveLeft();
        }
      else {
          player1.moveRight();
      }
        println("moveRight - player1");
      break;
      
    case 'F':
    case 'f':
        println("trigger! player1");
        trigger(1);
        break;
        
    case 'M':
    case 'm':
        println("trigger! player2");
        trigger(2);
        break;
        
    case 'T':
    case 't':
        healthBolas = healthBolas - 20;
        break;
        
    case 'G':
    case 'g':
        healthCaixas = healthCaixas - 20;
        break;
        
    case 'P':
    case 'p':
        isOrtho = !isOrtho;

  }
}
}
}

void mousePressed() {
  loop();  
  MenuInicial=false;
  GameStoped=false;
  EnableKeys=true;
}

void trigger(int playerNumber) {
    
    if (playerNumber == 1) {
        for (int i = 0; i < caixas.length; i++) {
            if (caixas[i].state == 1) {
                
                //println("trigger: existe uma ammo disponivel, é a " + i);
                
                //mudar o estado da ammo
                //println("trigger: mudar estado dessa ammo");
                caixas[i].state = 3;
                
                //println("trigger: o estado é agora: " + caixas[i].state);
                
                //por a ammo á frente do seu jogador
                caixas[i].setPosition(player1.x, player1.y -10, caixas[i].z);
                
                //marcar a proxima ammo como a seguinte
                /*if (i != caixas.length-1) {
                    caixas[i+1].state = 1;
                }*/
                
                //se nao houver um ammo que esteja em modo 1
                // E se houver um que esteja em modo 0
                boolean needAmmo = true;
                boolean ammoAvailable = false;
                
                for (int j = 0; j < ammountAmmo; j++) {
                    if (caixas[j].state == 1) {
                        needAmmo = false;
                    }
                }
                
                if (needAmmo == true) {
                    for (int j = 0; j < ammountAmmo; j++) {
                        if (caixas[j].state == 0) {
                            caixas[j].state = 1;
                        }
                    }
                }
                
                // chegar as ammos todas um bocado para o lado
                /*for (int k = 0; k < caixas.length; k++) {
                    if (caixas[k].state == 0) {
                        caixas[k].x = caixas[k].x - intervalBetweenAmmo;
                    }
                }
                */
                break;
            }
        }
    }
    
    if (playerNumber == 2) {
        for (int i = 0; i < bolas.length; i++) {
            if (bolas[i].state == 1) {
                
                //mudar o estado da ammo
                bolas[i].state = 3;
                
                //por a ammo á frente do seu jogador
                bolas[i].setPosition(player2.x, player2.y +10, bolas[i].z);
                
                //marcar a proxima ammo como a seguinte
                /*if (i != bolas.length-1) {
                    bolas[i+1].state = 1;
                }*/
                
                //se nao houver um ammo que esteja em modo 1
                // E se houver um que esteja em modo 0
                boolean needAmmo = true;
                boolean ammoAvailable = false;
                
                for (int j = 0; j < ammountAmmo; j++) {
                    if (bolas[j].state == 1) {
                        needAmmo = false;
                    }
                }
                
                if (needAmmo == true) {
                    for (int j = 0; j < ammountAmmo; j++) {
                        if (bolas[j].state == 0) {
                            bolas[j].state = 1;
                        }
                    }
                }
                
                // chegar as ammos todas um bocado para o lado
                /*for (int k = 0; k < bolas.length; k++) {
                    if (bolas[k].state == 0) {
                        bolas[k].x = bolas[k].x - intervalBetweenAmmo;
                    }
                }*/
                break;
            }
        }
    }
}

void placeLimboAmmo() {
    for (int i = 0; i < caixas.length; i++) {
        if (caixas[i].state == 4) {
            
            int mostLeft = 20000;
            int y_temp = 20000;
            
            println("existe uma caixa no limbo! a muda-la de sitio");
            
            //se estiverem todas em movimento
            // E se houver um que esteja em modo 0
            boolean allAreMoving = true;
                
            for (int j = 0; j < ammountAmmo; j++) {
                if (caixas[j].state == 0) {
                    allAreMoving = false;
                }
            }
            
            if (allAreMoving == true) {
                //println("todas as caixas estao a mexer-se!");
                caixas[i].setPosition(0,boardHeight/2+40,14);
                caixas[i].state = 0;
            }
            else {
                // ve qual a ammo mais a esquerda
                for (int k = 0; k < caixas.length; k++) {
                    if (caixas[k].x < mostLeft && caixas[k].state == 0) {
                        //println("a caixa em espera mais a esquerda esta no " + mostLeft);
                        mostLeft = caixas[k].x;
                    }
                    //encontra o y da linha das caixas
                    if (caixas[k].state == 0) {
                        y_temp = caixas[k].y;
                    }
                }
                
                //poe na com as outras caixas
                //println("mostLeft: " + mostLeft);
                //println("y_temp: " + y_temp);
                caixas[i].setPosition(mostLeft-intervalBetweenAmmo, y_temp, caixas[i].z);
            }
            
            
            
            //muda ammo para estar em espera
            caixas[i].state = 0;
            
            boolean needAmmo = true;
            for (int k = 0; k < ammountAmmo; k++) {
                if (caixas[k].state == 1) {
                    needAmmo = false;
                }
            }
            
            if (needAmmo == true) {
                caixas[i].state = 1;
            }
            
        }
        
    }
    
    for (int i = 0; i < bolas.length; i++) {
        if (bolas[i].state == 4) {
            int mostLeft = 20000;
            int y_temp = 20000;
            
            println("existe uma bolas no limbo! a muda-la de sitio");
            
            //se estiverem todas em movimento
            // E se houver um que esteja em modo 0
            boolean allAreMoving = true;
                
            for (int j = 0; j < ammountAmmo; j++) {
                if (bolas[j].state == 0) {
                    allAreMoving = false;
                }
            }
            
            if (allAreMoving == true) {
                println("todas as bolas estao a mexer-se!");
                bolas[i].setPosition(0,-boardHeight/2-40,14);
                bolas[i].state = 0;
            }
            else {
                // ve qual a ammo mais a esquerda
                for (int k = 0; k < bolas.length; k++) {
                    if (bolas[k].x < mostLeft && bolas[k].state == 0) {
                        //println("a bolas em espera mais a esquerda esta no " + mostLeft);
                        mostLeft = bolas[k].x;
                    }
                    //encontra o y da linha das caixas
                    if (bolas[k].state == 0) {
                        y_temp = bolas[k].y;
                    }
                }
                
                //poe na com as outras caixas
                //println("mostLeft: " + mostLeft);
                //println("y_temp: " + y_temp);
                bolas[i].setPosition(mostLeft-intervalBetweenAmmo, y_temp, bolas[i].z);
            }
            
            
            
            //muda ammo para estar em espera
            bolas[i].state = 0;
            
            boolean needAmmo = true;
            for (int k = 0; k < ammountAmmo; k++) {
                if (bolas[k].state == 1) {
                    needAmmo = false;
                }
            }
            
            if (needAmmo == true) {
                bolas[i].state = 1;
            }
        }
    }
}

void checkIfHit() {
    
    //Testar se as bolas acertaram no player Caixa
    for (int i = 0; i < ammountAmmo; i++) {
        if (dist(player1.x, player1.y, player1.z, bolas[i].x, bolas[i].y, bolas[i].z) < size) {
            println("o player Caixa foi atingido!!!!!!!!!!!");
            healthCaixas = healthCaixas - hitDamage;
            println("healthCaixas: " + healthCaixas);
            
            for (int k = 0; k < ammountAmmo; k++) {
                caixas[k].setAlpha(caixas[k].alpha - 5);
                println("caixas[k].c: " + caixas[k].c);
            }
        }
    }
    
    for (int i = 0; i < ammountAmmo; i++) {
        if (dist(player2.x, player2.y, player2.z, caixas[i].x, caixas[i].y, caixas[i].z) < size) {
            println("o player Bola foi atingido!!!!!!!!!!!");
            healthBolas = healthBolas - hitDamage;
            println("healthBolas: " + healthBolas);
            
            for (int k = 0; k < ammountAmmo; k++) {
                bolas[k].setAlpha(bolas[k].alpha - 5);
                println("bolas[k].c: " + bolas[k].c);
            }
        }
    }
    
}
