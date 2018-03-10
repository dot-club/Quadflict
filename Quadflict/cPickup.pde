class cPickup {
  int x;
  int y;
  int type;
  
  boolean tobedeleted = false;
  
  cPickup(int x_, int y_, int type_){
    x = x_;
    y = y_;
    type = type_;
  }
  
  void update(){
    
    if(type == 1){
      fill(252,160,68);
      rect(x, y, 20, 20);
      
      for (int i = 0; i < cPlayers.size(); i++) {
        if(cPlayers.get(i).health < cPlayers.get(i).maxhealth && x + 30 >= cPlayers.get(i).x && x <= cPlayers.get(i).x + cPlayers.get(i).size && y + 30 >= cPlayers.get(i).y && y <= cPlayers.get(i).y + cPlayers.get(i).size){
          cPlayers.get(i).health++;
          tobedeleted = true;
        }
      }
      
    }
    
    if(tobedeleted){
      cPickups.remove(curcPickup);
    }
    
  }
  
  
}