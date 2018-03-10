class cParticle {
  
  int x;
  int y;
  int size;
  color clr;
  
  int timer = 4;
  
  int speed = 3;
  
  int dir = int(random(0,8));
  
  cParticle(int x_, int y_, int size_, color clr_){
    x = x_;
    y = y_;
    size = size_;
    clr = clr_;
  }
  
  void update(){
    
    if ( timer > 0){
      if(dir == 1){x += speed;}
      if(dir == 2){x -= speed;}
      if(dir == 3){y += speed;}
      if(dir == 4){y -= speed;}
      if(dir == 5){x += speed/2; y += speed/2;}
      if(dir == 6){x += speed/2; y -= speed/2;}
      if(dir == 7){x -= speed/2; y += speed/2;}
      if(dir == 8){x -= speed/2; y -= speed/2;}
    }
    
    if (timer > 0){
     timer--; 
    }
    
  }
  
  void display(){
    fill(clr);
    if (clr == color(180)){
      fill(clr, 50);
    }
    rect(x, y, size, size);
    
    if (timer == 0){
      if (keepparticles){
        cDeadparticles.add( new cDeadparticle(x, y, size, clr));
      }
      cParticles.remove(curcParticle);
      //timer = 0;
    }
    
  }
  
}