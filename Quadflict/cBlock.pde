class cBlock {
  
  int x;
  int y;
  int w;
  int h;
  int type;
  color clr;
  
  int type2;
  
  boolean tobedeleted = false;
  
  cBlock(int x_, int y_, int w_, int h_, int type_, color clr_){
     x = x_;
     y = y_;
     w = w_;
     h = h_;
     type = type_;
     clr = clr_;
     
    if ( type > 2 ){
      if( cBonusesCollected.get(type) == true){
        type = 0;
        tobedeleted = true;
      }
      else{
        type2 = type;
        type = 1;
      }
    }
    
    if(tobedeleted){
      type = -99;
      //cBlocks.remove(curcBlock);
    }
    
  }
  
  void display(){
    if(cBonusesCollected.get(type2) == true){
        tobedeleted = true;
    }
    if (type != -99){  
      if(tobedeleted){
        for (int i = 0; i < w*h/100; i++) {
          cParticles.add( new cParticle(x + int(random(0, w)), y + int(random(0, h)), 10, color(clr)));
        }
        cBlocks.remove(curcBlock);
      }
      else{
        fill(color(clr));
        rect(x, y, w, h);
      }
    }
    else{
      cBlocks.remove(curcBlock);
    }
    
  }
    
}