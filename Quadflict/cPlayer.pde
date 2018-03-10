class cPlayer {
  
  int x;
  int y;
  int maxhealth;
  int size;
  color clr;
  
  int speed = 4;
  
  int timerlength = 15;
  int timer;
  
  boolean hit = false;
  boolean tobedeleted = false;
  
  int health = 3;
  
  int invtimerlength = 60;
  int invtimer = invtimerlength;
  boolean inv = false;
  
  cPlayer(int x_, int y_, int maxhealth_, int size_, color clr_){
    x = x_;
    y = y_;
    maxhealth = maxhealth_;
    size = size_;
    clr = clr_;
  }
  
  void update(){
    
    if (cBonusesCollected.get(6) == true){
      timerlength = 15;
    }
    else{
      timerlength = 15;
    }
    
    //cParticles.add( new cParticle(x + size/2, y + size/2, 10, roomclr1));
    
    //if (Ddown && Wdown || Adown && Wdown || Ddown && Sdown || Adown && Sdown){
    //  speed = speed/2;
    //}
    
    //player movement
    if (Ddown == true){
      
      for (int j = 0; j < speed; j++) {
        x++;
        for (int i = 0; i < cBlocks.size(); i++) {
          if(x + size > cBlocks.get(i).x && x < cBlocks.get(i).x + cBlocks.get(i).w && y + size > cBlocks.get(i).y && y < cBlocks.get(i).y + cBlocks.get(i).h && cBlocks.get(i).type > 0  ){
            x--;
            break;
          }
        }
        
        for (int i = 0; i < cEnemies.size(); i++) {
          if(x + size > cEnemies.get(i).x && x < cEnemies.get(i).x + cEnemies.get(i).size && y + size > cEnemies.get(i).y && y < cEnemies.get(i).y + cEnemies.get(i).size){
            //x -= speed*10;
            x--;
            cPlayers.get(curcPlayer).hit();
            //Ddown = false;
            break;
          }
        }
        
      }

    }
    if (Adown == true){
     for (int j = 0; j < speed; j++) {
        x--;
        for (int i = 0; i < cBlocks.size(); i++) {
          if(x + size > cBlocks.get(i).x && x < cBlocks.get(i).x + cBlocks.get(i).w && y + size > cBlocks.get(i).y && y < cBlocks.get(i).y + cBlocks.get(i).h && cBlocks.get(i).type > 0 ){
            x++;
            break;
          }
        }
        
        for (int i = 0; i < cEnemies.size(); i++) {
          if(x + size > cEnemies.get(i).x && x < cEnemies.get(i).x + cEnemies.get(i).size && y + size > cEnemies.get(i).y && y < cEnemies.get(i).y + cEnemies.get(i).size){
            //x += speed*10;
            x++;
            cPlayers.get(curcPlayer).hit();
            //Adown = false;
            break;
          }
        }  
        
      }
      
      
    }
    if (Wdown == true){
            
     for (int j = 0; j < speed; j++) {
        y--;
        for (int i = 0; i < cBlocks.size(); i++) {
          if(x + size > cBlocks.get(i).x && x < cBlocks.get(i).x + cBlocks.get(i).w && y + size > cBlocks.get(i).y && y < cBlocks.get(i).y + cBlocks.get(i).h && cBlocks.get(i).type > 0 ){
            y++;
            break;
          }
        }
        
        for (int i = 0; i < cEnemies.size(); i++) {
          if(x + size > cEnemies.get(i).x && x < cEnemies.get(i).x + cEnemies.get(i).size && y + size > cEnemies.get(i).y && y < cEnemies.get(i).y + cEnemies.get(i).size){
            //y += speed*10;
            y++;
            cPlayers.get(curcPlayer).hit();
            //Wdown = false;
            break;
          }
        }
        
      }
      
      
    }
    if (Sdown == true){
      
     for (int j = 0; j < speed; j++) {
        y++;
        for (int i = 0; i < cBlocks.size(); i++) {
          if(x + size > cBlocks.get(i).x && x < cBlocks.get(i).x + cBlocks.get(i).w && y + size > cBlocks.get(i).y && y < cBlocks.get(i).y + cBlocks.get(i).h && cBlocks.get(i).type > 0 ){
            y--;
            break;
          }
        }
        
         for (int i = 0; i < cEnemies.size(); i++) {
          if(x + size > cEnemies.get(i).x && x < cEnemies.get(i).x + cEnemies.get(i).size && y + size > cEnemies.get(i).y && y < cEnemies.get(i).y + cEnemies.get(i).size){
            //y -= speed*10;
            y--;
            cPlayers.get(curcPlayer).hit();
            //Sdown = false;
            break;
          }
        }
        
      }
      
    }
    
    if (canmove == false){
      y -= speed;
      x = 640-size/2;
      health = maxhealth;
    }
    
    
    //if (Ddown && Wdown || Adown && Wdown || Ddown && Sdown || Adown && Sdown){
    //  speed = speed*2;
    //}
    
    
    for (int i = 0; i < cEntrances.size(); i++) {
      
      if(x + size > cEntrances.get(i).x && x < cEntrances.get(i).x + cEntrances.get(i).w && y + size > cEntrances.get(i).y && y < cEntrances.get(i).y + cEntrances.get(i).h){
        if( cEntrances.get(i).dir == 0 ){
          y = height - y - size - 2;
        }
        if( cEntrances.get(i).dir == 90 ){
          x = -width + x + size + 2 ;
        }
        if( cEntrances.get(i).dir == 180 ){
          y = -height + y + size + 2 ;
        }
        if( cEntrances.get(i).dir == 270 ){
          x = width + x - size - 2;
        }
        
        roomnumber = cEntrances.get(i).toroom;
        loadroom();
      }
    }
    
    if (canshoot == true){
      if (RIGHTdown == true && timer == 0){
          if (cBonusesCollected.get(6) == true){
            cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2 + int(random(-bulletspread,bulletspread)), 90, 15, 2, color(42,181,234)));
          }
          else{
            cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2 + int(random(-bulletspread,bulletspread)), 90, 15, 0, color(42,181,234)));
          }
        timer = timerlength;
      }
      if (LEFTdown == true && timer == 0){
         if (cBonusesCollected.get(6) == true){
            cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2 + int(random(-bulletspread,bulletspread)), 270, 15, 2, color(42,181,234)));
         }
         else{
           cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2 + int(random(-bulletspread,bulletspread)), 270, 15, 0, color(42,181,234)));
         }
        timer = timerlength;
      }
      if (UPdown == true && timer == 0){
         if (cBonusesCollected.get(6) == true){
            cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2 + int(random(-bulletspread,bulletspread)), 0, 15, 2, color(42,181,234)));
         }
         else{
           cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2 + int(random(-bulletspread,bulletspread)), 0, 15, 0, color(42,181,234)));
         }
        timer = timerlength;
      }
      if (DOWNdown == true && timer == 0){
         if (cBonusesCollected.get(6) == true){
            cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2 + int(random(-bulletspread,bulletspread)), 180, 15, 2, color(42,181,234)));
         }
         else{
           cShots.add( new cShot(x + size/2 - 15/2, y + size/2 - 15/2 + int(random(-bulletspread,bulletspread)), 180, 15, 0, color(42,181,234)));
         }
        timer = timerlength;
      }
    }
    
    if (timer > 0){
      timer--; 
    }
    
  }
  
  void hit(){
    if (invtimer == 0){
      hit = true;
      invtimer = invtimerlength;
    }
  }
  
  void display(){
   
   if (invtimer > 0){
     invtimer--;
   }
   else{
     inv = true;
   }
   
   if (invtimer % 5 == 1){
     inv = !inv;
   }
   
   if (inv){
     fill(playerclr);
     if (cBonusesCollected.get(7) == true){
       ellipse(x+size/2, y+size/2, size, size);
     }
     else{
       rect(x, y, size, size);
     }
   }
   
   if (hit){
      screenflash = true;
      flashcolor = color(221,62,62);
      health--;
      hit = false;
      
      if(health <= 0){
        tobedeleted = true;
      }
    }
   //println(health);
  }
  
  void maybedelete(){
    if (tobedeleted){
      //setup();
      tobedeleted = false;
      loadsave();
      loadroom();
    }
  }
  
  void savefile(){
    if(health <3){
       health =3;
    }
    currentSaved[0] = (cSaves.get(curcSave).x + 30/2 - size/4) + "," + (cSaves.get(curcSave).y + 30/2 - size/4) +  "," + maxhealth + "," + size + "," + int(red(clr)) + "," + int(green(clr)) + "," + int(blue(clr));
    //currentSaved[0] = x + "," + y +  "," + maxhealth + "," + size + "," + int(red(clr)) + "," + int(green(clr)) + "," + int(blue(clr));
  }
  
}