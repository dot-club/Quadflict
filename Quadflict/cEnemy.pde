class cEnemy {
  
  int x;
  int y;
  int size;
  int type; //0: target, 1: stationary fire, 2: move, 3: fire right
  color clr;
  
  int health = 100;
  boolean hit = false;
  boolean tobedeleted = false;
  
  boolean rocketed = false;
  
  int dir;
  int speed = 2;
  
  int timerlength = 30;
  int timer = timerlength;
  
  int timer2length = 30;
  int timer2 = timer2length;
  
  cEnemy(int x_, int y_, int size_, int type_, color clr_){
    x = x_;
    y = y_;
    size = size_;
    type = type_;
    clr = clr_;
 
    if(type == 0){
      speed = 0;
      health = 2;
    }
    
    if(type == 1){
      speed = 0;
      health = 3;
      timerlength = 60;
      timer = timerlength/2;
    }
    
    if(type == 2){
      speed = 3;
      health = 5;
      timerlength = 10;
      timer = timerlength;
    }
    
    if(type == 3){
      speed = 0;
      health = 3;
      timerlength = 60;
      timer = timerlength/4;
    }
    
    if(type == 4){
      speed = 0;
      health = 4;
      timerlength = 60;
      timer = timerlength/4;
    }
    
    if(type == 5){
      speed = 0;
      health = 3;
      timerlength = 60;
      timer = timerlength/4;
    }
    
    if(type == 6){
      speed = 0;
      health = 3;
      timerlength = 60;
      timer = timerlength/4;
    }
    
    if(type == 7){
      speed = 3;
      health = 3;
      timerlength = 60;
      timer = timerlength;
      timer2length = 15;
      timer2 = 0;
    }
    
  }
  
  void update(){
    if(timer == 0 && type == 1){
      cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2, 0, 15, 1, color(221,62,62)));
      cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2, 90, 15, 1, color(221,62,62)));
      cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2, 180, 15, 1, color(221,62,62)));
      cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2, 270, 15, 1, color(221,62,62)));
      timer = timerlength;
    }
    
    if(timer == 0 && (type == 2 || type == 7)){
      if (dir == 1){ cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2 + int(random(-enemybulletspread,enemybulletspread)), 90, 15, 1, color(221,62,62)));}
      if (dir == 2){ cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2 + int(random(-enemybulletspread,enemybulletspread)), 270, 15, 1, color(221,62,62)));}
      if (dir == 3){ cShots.add( new cShot(x + size/2 - 15/2 + int(random(-enemybulletspread,enemybulletspread)), y + size/2 - 15/2, 180, 15, 1, color(221,62,62)));}
      if (dir == 4){ cShots.add( new cShot(x + size/2 - 15/2 + int(random(-enemybulletspread,enemybulletspread)), y + size/2 - 15/2, 0, 15, 1, color(221,62,62)));}
      timer = timerlength;
    }
    
    if(timer == 0 && type == 3){
      cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2, 90, 15, 1, color(221,62,62)));
      timer = timerlength;
    }
    
    if(timer == 0 && type == 4){
      cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2, 180, 15, 1, color(221,62,62)));
      timer = timerlength;
    }
    
    if(timer == 0 && type == 5){
      cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2, 270, 15, 1, color(221,62,62)));
      timer = timerlength;
    }
    
    if(timer == 0 && type == 6){
      cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2, 0, 15, 1, color(221,62,62)));
      timer = timerlength;
    }
    
    
    if (timer > 0){
      timer--;
    }
    if (type == 7){
      if (timer2 > 0){
        timer2--;
        //println(timer2);
      }
    }
    //println(timer);
    
    if (type == 2 || type == 7){
      cEnemies.get(curcEnemy).move();
    }
    
  }
  
  void hit(){
    //if (type != 0){
      hit = true;
    //}
  }
  
  void display(){
    fill(clr);
    rect(x, y, size, size);
    
    if (hit){
      fill(221,62,62);
      rect(x, y, size, size);
      hit = false;
      if(type == 2){
        dir = 0;
        timer = timerlength;
      }
      //if (type != 0){
        health--;
      //}
        
        if(health <= 0){
          tobedeleted = true;
          if (rocketed){
            for (int i = 0; i < 10; i++) {
              cParticles.add( new cParticle(x + int(random(0, size)), y + int(random(0, size)), 10, color(180)));
            }
          }
            rocketed = false;
          }
        }
        rocketed = false;
      //}
    }

  void maybedelete(){
    if (tobedeleted){
      
      if ( random(1) > 0.8 ){
        cPickups.add( new cPickup(x + size/2 - 10, y + size/2 - 10, 1));
      }
      
      cEnemies.remove(curcEnemy);
      
      cParticles.add( new cParticle(x + size/2, y + size/2, 10, color(221,62,62)));
      cParticles.add( new cParticle(x + size/2, y + size/2, 10, color(221,62,62)));
      cParticles.add( new cParticle(x + size/2, y + size/2, 10, color(221,62,62)));
      cParticles.add( new cParticle(x + size/2, y + size/2, 10, color(221,62,62)));
      
    }
  }
  
  
  void move(){
    if (type == 2){
      if ( random(1) > 0.9 ){
        dir = int(random(1, 10));
        //println(int(random(1, 5)));
      }
    }
    if (type == 7 && timer2 == 0){
      for (int i = 0; i < cPlayers.size(); i++) {
        //println(abs(cPlayers.get(i).x - x));
        //println(abs(cPlayers.get(i).y - y));
        if((abs(cPlayers.get(i).x - x) > abs(cPlayers.get(i).y - y)) && x > cPlayers.get(i).x ){
          dir = 2;
        }
        if((abs(cPlayers.get(i).x - x) > abs(cPlayers.get(i).y - y)) && x < cPlayers.get(i).x ){
          dir = 1;
        }
        if((abs(cPlayers.get(i).x - x) < abs(cPlayers.get(i).y - y)) && y < cPlayers.get(i).y ){
          dir = 3;
        }
        if((abs(cPlayers.get(i).x - x) < abs(cPlayers.get(i).y - y)) && y > cPlayers.get(i).y ){
          dir = 4;
        }
        //else{
        //  dir = 2;
        //}
      }
      timer2 = timer2length;
    }
    
    if(dir == 1){
      for (int j = 0; j < speed; j++) {
        x++;
        for (int i = 0; i < cBlocks.size(); i++) {
          if((x + size > cBlocks.get(i).x && x < cBlocks.get(i).x + cBlocks.get(i).w && y + size > cBlocks.get(i).y && y < cBlocks.get(i).y + cBlocks.get(i).h && cBlocks.get(i).type > 0) || x > width || x < size || y < size || y > height){
            x--;
            if (type == 7){
              timer2 = timer2length;
              dir = 4;
            }
            break;
          }
        }
      }
    }
    
    if(dir == 2){
      for (int j = 0; j < speed; j++) {
        x--;
        for (int i = 0; i < cBlocks.size(); i++) {
          if((x + size > cBlocks.get(i).x && x < cBlocks.get(i).x + cBlocks.get(i).w && y + size > cBlocks.get(i).y && y < cBlocks.get(i).y + cBlocks.get(i).h && cBlocks.get(i).type > 0) || x > width || x < size || y < size || y > height){
            x++;
            if (type == 7){
              timer2 = timer2length;
              dir = 4;
            }
            break;
          }
        }
      }
    }
    
    if(dir == 3){
      for (int j = 0; j < speed; j++) {
        y++;
        for (int i = 0; i < cBlocks.size(); i++) {
          if((x + size > cBlocks.get(i).x && x < cBlocks.get(i).x + cBlocks.get(i).w && y + size > cBlocks.get(i).y && y < cBlocks.get(i).y + cBlocks.get(i).h && cBlocks.get(i).type > 0) || x > width || x < size || y < size || y > height){
            y--;
            if (type == 7){
              timer2 = timer2length;
              dir = 1;
            }
            break;
          }
        }
      }
    }
    
     if(dir == 4){
      for (int j = 0; j < speed; j++) {
        y--;
        for (int i = 0; i < cBlocks.size(); i++) {
          if((x + size > cBlocks.get(i).x && x < cBlocks.get(i).x + cBlocks.get(i).w && y + size > cBlocks.get(i).y && y < cBlocks.get(i).y + cBlocks.get(i).h && cBlocks.get(i).type > 0) || x > width || x < size || y < size || y > height){
            y++;
            if (type == 7){
              timer2 = timer2length;
              dir = 2;
            }
            break;
          }
        }
      }
    }
    
  }
  
}

  
  