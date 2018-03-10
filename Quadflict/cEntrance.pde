class cEntrance {
  int x;
  int y;
  int w;
  int h;
  int dir;
  int toroom;
  
  cEntrance(int x_, int y_, int w_, int h_, int dir_, int toroom_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    dir = dir_;
    toroom = toroom_;
  }
  
  void display(){
    noFill();
    stroke(255, 0, 0);
    rect(x, y, w, h);
    noStroke();
  }
  
}