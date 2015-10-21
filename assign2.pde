//You should implement your assign2 here.
PImage bgOne;
PImage bgTwo;
PImage enemy;
PImage fighter;
PImage hp;
PImage treasure;
//new image in assign2
PImage endOne;
PImage endTwo;
PImage mEEnemyOne;
PImage mEGainbomb;
PImage startOne;
PImage startTwo;
//int
int treasureX,treasureY,bgX,bgY;
//float
float enemyX,enemyY,h,fighterX,fighterY;
float speed = 5;
//key press
boolean upPressed = false, downPressed = false, leftPressed = false, rightPressed = false;
//state
final int GAME_START = 1, GAME_RUN = 2, GAME_LOSE = 3;
int gameState;

void setup () {
  //load image
  size(640,480) ;
  bgOne = loadImage("img/bg1.png");
  bgTwo = loadImage("img/bg2.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  treasure = loadImage("img/treasure.png");
  //new image in assing2
  endOne = loadImage("img/end1.png");
  endTwo = loadImage("img/end2.png");
  mEEnemyOne = loadImage("img/Moocs-element-enemy1.png");
  mEGainbomb = loadImage("img/Moocs-element-gainbomb.png");
  startOne = loadImage("img/start1.png");
  startTwo = loadImage("img/start2.png");
  //done in assign1
  treasureX = floor(random(41,600));
  treasureY = floor(random(41,440));
  h = 56.4;
  enemyX = -60;
  enemyY = floor(random(0,421));
  bgX = 0;  
  //fighter
  fighterX = 585;
  fighterY = 230;  
  //gamestate
  gameState = GAME_START;  
}
void draw() {
  background(0);
  //bg  
  bgX+=5;
  bgX%=1280;
  image(bgTwo,bgX,0,640,480);
  image(bgOne,bgX-640,0,640,480);
  image(bgTwo,bgX-1280,0,640,480);
  //fighter
  image(fighter,fighterX,fighterY);
  //treasure
  image(treasure,treasureX,treasureY);
  //enemy
  image(enemy,enemyX,enemyY);
  enemyX+=3;
  enemyX%=640;  
  //hpcolor
  //hp:18~210->192:100=(19.2):10=(38.4):20
  fill(255,0,0);
  stroke(255,0,0);
  rectMode(CORNERS);
  rect(18,10,h,24);
  image(hp,5,5);
 
  //switch
  switch (gameState){
    case GAME_START:
        // mouse action 
     if(mouseX>207 && mouseX<455 && mouseY>378 && mouseY<412){
       if(mousePressed){
         gameState = GAME_RUN;
          }else{
            image(startOne,0,0);
            }
        }else{
          image(startTwo,0,0);
          }
     break;
    case GAME_RUN:   
     //fighter and enemy     
     if(enemyX>60){
     if(enemyX<fighterX){if(enemyY+3<fighterY){enemyY+=3;}else if(enemyY-3>fighterY){enemyY-=3;}else{enemyY=fighterY;}
     }}else{enemyX+=3;}
     if(fighterX+24>=enemyX-30 && fighterX-24<=enemyX+30 && fighterY+24>=enemyY-30 && fighterY-24<=enemyY+30){
       h=h-38.4;enemyX=-60;enemyY=floor(random(0,421));
       }
     //fighter and treasure
     if(fighterX+24>=treasureX-20 && fighterX-24<=treasureX+20 && fighterY+24>=treasureY-20 && fighterY-24<=treasureY+20){
       h=h+19.2;treasureX=floor(random(41,600));treasureY=floor(random(41,440));
       }
     //fighter pressed
     if(upPressed){
       fighterY -= speed;
     }
     if(downPressed){
       fighterY += speed;
     }
     if(leftPressed){
       fighterX -= speed;
     }
     if(rightPressed){
       fighterX += speed;
     }
     //fighter should not out
     if(fighterX>=589){fighterX=589;}
     if(fighterX<=0){fighterX=0;}
     if(fighterY>=429){fighterY=429;}
     if(fighterY<=0){fighterY=0;}
     //hp
     if(h>=210){h=210;}     
     if(h<=18.1){gameState = GAME_LOSE;}
     break;  
    case GAME_LOSE:
        //mouse action 
     if(mouseX>209 && mouseX<433 && mouseY>312 && mouseY<345){
       if(mousePressed){
        gameState = GAME_RUN;h = 56.4;fighterX = 585;fighterY = 230;enemyX = -60;enemyY = floor(random(0,421));treasureX = floor(random(41,600));treasureY = floor(random(41,440));
         }else{
           image(endOne,0,0);
           }
       }else{
          image(endTwo,0,0);
          }      
     break; 
  }
}
void keyPressed(){
if(key == CODED){
  switch(keyCode){
    case UP:      
        upPressed = true;
      break;
    case DOWN:        
        downPressed = true;
      break;
    case LEFT:      
        leftPressed = true;
      break;
    case RIGHT:            
        rightPressed = true;
      break;        
    }
  }  
}
void keyReleased(){
 if(key == CODED){
   switch(keyCode){
     case UP:        
         upPressed = false;
       break;
     case DOWN:          
         downPressed = false;
       break;
     case LEFT:         
         leftPressed = false;
       break;
     case RIGHT:              
         rightPressed = false;
       break;
    }
  }
}
