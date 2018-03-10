class cSave {
  
  int x;
  int y;
  
  int timerlength = 30;
  int timer = timerlength;
  
  boolean on = true;
  
  boolean playercollide = false;
  
  cSave(int x_, int y_){
    
    x = x_;
    y = y_;
    
  }
  
  void display(){
    
    //fill(122,89,66);
    //rect(x, y, 120, 50);
    //fill(68,183,216);
    //rect(x+42,y-40, 40, 40);
    
    if (on){
      fill(169,116,225);
      rect(x, y, 50, 50);
      fill(189,149,231);
      rect(x+10, y+10, 30, 30);
      fill(169,116,225);
      rect(x+20, y+20, 10, 10);
    }
    else{
      fill(189,149,231);
      rect(x, y, 50, 50);
      fill(169,116,225);
      rect(x+10, y+10, 30, 30);
      fill(189,149,231);
      rect(x+20, y+20, 10, 10);
    }
    
    
    if ( timer > 0 ){
      timer--;
    }
    
    if ( timer == 0 ){
      timer = timerlength;
      on = !on;
    }
    
    for (int i = 0; i < cPlayers.size(); i++) {
      if(x + 50 >= cPlayers.get(i).x && x <= cPlayers.get(i).x + cPlayers.get(i).size && y + 50 >= cPlayers.get(i).y && y <= cPlayers.get(i).y + cPlayers.get(i).size){
        if (playercollide == false){
          savesave();
          playercollide = true;
        }
      }
      else{
        playercollide = false;
      }
    }
    
    
  }
  
}