class cShot {
  int x, y, dir, size, owner;
  color clr;
  
  int speed = 10;
  
  int timerlength = 1;
  int timer = timerlength;
  
  boolean rocket = false;
  boolean flash = false;
  
  boolean tobedeleted = false;
  
  cShot(int x_, int y_, int dir_, int size_, int owner_, color clr_){
    x = x_;
    y = y_;
    dir = dir_;
    size = size_;
    owner = owner_;
    clr = clr_;
    
    if (owner == 2){
      rocket = true;
      owner = 0;
      timerlength = 5;
      timer = timerlength;
    }
    
  }
  
  void update(){
    
    if (rocket){
      if (timer > 0){
        timer--;
      }
      else{
        timer = timerlength;
        flash = !flash;
      }
    }
    
    if (dir == 90){
      x += speed;
    }
    if (dir == 270){
      x -= speed;
    }
    if (dir == 180){
      y += speed;
    }
     if (dir == 0){
      y -= speed;
    }
    
    //if (rocket == true){
    //  cParticles.add( new cParticle(x, y, 10, color(180)));
    //}
    
    if(owner == 0){
      for (int i = 0; i < cEnemies.size(); i++) {
        
        
          if(x + size >= cEnemies.get(i).x && x <= cEnemies.get(i).x + cEnemies.get(i).size && y + size >= cEnemies.get(i).y && y <= cEnemies.get(i).y + cEnemies.get(i).size){
            tobedeleted = true;
            if (rocket){
              cEnemies.get(i).health = 0;
              cEnemies.get(i).rocketed = true;
            }
            cEnemies.get(i).hit();
            cParticles.add( new cParticle(cEnemies.get(i).x + cEnemies.get(i).size/2, cEnemies.get(i).y + cEnemies.get(i).size/2, 10, color(221,62,62)));
            cParticles.add( new cParticle(cEnemies.get(i).x + cEnemies.get(i).size/2, cEnemies.get(i).y + cEnemies.get(i).size/2, 10, color(221,62,62)));
            cParticles.add( new cParticle(cEnemies.get(i).x + cEnemies.get(i).size/2, cEnemies.get(i).y + cEnemies.get(i).size/2, 10, color(221,62,62)));
            cParticles.add( new cParticle(cEnemies.get(i).x + cEnemies.get(i).size/2, cEnemies.get(i).y + cEnemies.get(i).size/2, 10, color(221,62,62)));
          }
        }
    }
    
    if(owner == 1){
      for (int i = 0; i < cPlayers.size(); i++) {
          if(x + size >= cPlayers.get(i).x && x <= cPlayers.get(i).x + cPlayers.get(i).size && y + size >= cPlayers.get(i).y && y <= cPlayers.get(i).y + cPlayers.get(i).size){
            tobedeleted = true;
            cPlayers.get(i).hit();
            cParticles.add( new cParticle(cPlayers.get(i).x + cPlayers.get(i).size/2, cPlayers.get(i).y + cPlayers.get(i).size/2, 10, color(221,62,62)));
            cParticles.add( new cParticle(cPlayers.get(i).x + cPlayers.get(i).size/2, cPlayers.get(i).y + cPlayers.get(i).size/2, 10, color(221,62,62)));
            cParticles.add( new cParticle(cPlayers.get(i).x + cPlayers.get(i).size/2, cPlayers.get(i).y + cPlayers.get(i).size/2, 10, color(221,62,62)));
            cParticles.add( new cParticle(cPlayers.get(i).x + cPlayers.get(i).size/2, cPlayers.get(i).y + cPlayers.get(i).size/2, 10, color(221,62,62)));
          }
        }
    }
    
    
    for (int i = 0; i < cBlocks.size(); i++) {
      
      if(x + size >= cBlocks.get(i).x && x <= cBlocks.get(i).x + cBlocks.get(i).w && y + size >= cBlocks.get(i).y && y <= cBlocks.get(i).y + cBlocks.get(i).h && cBlocks.get(i).type == 1){
        tobedeleted = true;
        if (rocket == false){
          cParticles.add( new cParticle(x, y, 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x, y, 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x, y, 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x, y, 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x, y, 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x, y, 10, cBlocks.get(i).clr));
        }
        else{
          cParticles.add( new cParticle(x + int(random(-20, 20)), y + int(random(-20, 20)), 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x + int(random(-20, 20)), y + int(random(-20, 20)), 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x + int(random(-20, 20)), y + int(random(-20, 20)), 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x + int(random(-20, 20)), y + int(random(-20, 20)), 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x + int(random(-20, 20)), y + int(random(-20, 20)), 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x + int(random(-20, 20)), y + int(random(-20, 20)), 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x + int(random(-20, 20)), y + int(random(-20, 20)), 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x + int(random(-20, 20)), y + int(random(-20, 20)), 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x + int(random(-20, 20)), y + int(random(-20, 20)), 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x + int(random(-20, 20)), y + int(random(-20, 20)), 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x + int(random(-20, 20)), y + int(random(-20, 20)), 10, cBlocks.get(i).clr));
          cParticles.add( new cParticle(x + int(random(-20, 20)), y + int(random(-20, 20)), 10, cBlocks.get(i).clr));
        }
      }
      
      //if(x + size >= cBlocks.get(i).x && x <= cBlocks.get(i).x + cBlocks.get(i).w && y + size >= cBlocks.get(i).y && y <= cBlocks.get(i).y + cBlocks.get(i).h && cBlocks.get(i).type == 2){
      //  cParticles.add( new cParticle(x, y, 10, color(100)));
      //}
      
    }
    
    if( x > width || x < size || y < size || y > height){
      tobedeleted = true;
    }
    
    
  }
  
  void display(){
    if (flash == false){
      fill(clr);
      if (rocket){
        fill(221,62,62);
        
      }
      rect(x, y, size, size);
    }
    else{
      fill(221,62,62);
      rect(x, y, size, size);
    }
    
    if (rocket){
      if ( random(0,1) > 0.7){
        cParticles.add( new cParticle(x, y, 10, color(180)));
      }
    }
    
  }
  
  void maybedelete(){
    if (tobedeleted){
      cShots.remove(curcShot);
    }
  }
} 