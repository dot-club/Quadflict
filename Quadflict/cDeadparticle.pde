class cDeadparticle {
  
  int x;
  int y;
  int size;
  color clr;
  
  int timerlength = 20;
  int timer = timerlength;
  
  cDeadparticle(int x_, int y_, int size_, color clr_){
    x = x_;
    y = y_;
    size = size_;
    clr = clr_;
  }
  
  void update(){
    fill(clr);
    if (clr == color(180)){
      fill(clr, 128);
    }
    rect(x, y, size, size);
    
    if (timer > 0){
     timer--;
    }
    else{
     cDeadparticles.remove(curcDeadparticle);
    }
    
  }
  
}