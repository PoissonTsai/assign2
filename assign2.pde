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
int x,y,c,d;
//float
float a,b,h,e,f;
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
  x = floor(random(41,600));
  y = floor(random(41,440));
  h = 56.4;
  a = -60;
  b = floor(random(0,421));
  c = 0;  
  //fighter
  e = 585;
  f = 230;  
  //gamestate
  gameState = GAME_START;  
}
void draw() {
  background(0);
  //bg  
  c+=5;
  c%=1280;
  image(bgTwo,c,0,640,480);
  image(bgOne,c-640,0,640,480);
  image(bgTwo,c-1280,0,640,480);
  //fighter
  image(fighter,e,f);
  //treasure
  image(treasure,x,y);
  //enemy
  image(enemy,a,b);
  a+=3;
  a%=640;  
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
     if(a>60){
     if(a<e){if(b+3<f){b+=3;}else if(b-3>f){b-=3;}else{b=f;}
     }}else{a+=3;}
     if(e+24>=a-30 && e-24<=a+30 && f+24>=b-30 && f-24<=b+30){
       h=h-38.4;a=-60;b=floor(random(0,421));
       }
     //fighter and treasure
     if(e+24>=x-20 && e-24<=x+20 && f+24>=y-20 && f-24<=y+20){
       h=h+19.2;x=floor(random(41,600));y=floor(random(41,440));
       }
     //fighter pressed
     if(upPressed){
       f -= speed;
     }
     if(downPressed){
       f += speed;
     }
     if(leftPressed){
       e -= speed;
     }
     if(rightPressed){
       e += speed;
     }
     //fighter should not out
     if(e>=589){e=589;}
     if(e<=0){e=0;}
     if(f>=429){f=429;}
     if(f<=0){f=0;}
     //hp
     if(h>=210){h=210;}     
     if(h<=18.1){gameState = GAME_LOSE;}
     break;  
    case GAME_LOSE:
        //mouse action 
     if(mouseX>209 && mouseX<433 && mouseY>312 && mouseY<345){
       if(mousePressed){
        gameState = GAME_RUN;h = 56.4;e = 585;f = 230;a = -60;b = floor(random(0,421));x = floor(random(41,600));y = floor(random(41,440));
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
