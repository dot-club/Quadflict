class cBonus {
  int x;
  int y;
  int type;
  int id;
  
  int timerlength;
  int timer;
  boolean on;
  
  cBonus(int x_, int y_, int type_, int id_){
    x = x_;
    y = y_;
    type = type_;
    id = id_;
    
    if (type == 1){
      timerlength = 20;
      timer = timerlength;
      on = true;
    }
    
    if (type == 2 || type == 3 || type == 4){
      timerlength = 20;
      timer = timerlength;
      on = true;
    }
    
    
    println("id: " + id);
    println("bonuses collected: " + cBonusesCollected);
    if ( cBonusesCollected.get(id) == true ){
      type = 0;
    }
    
  }
  
  //type 0: delete
  
  void update(){
    if (type == 0){
      cBonuses.remove(curcBonus);
    }
    
    if (type == 1){
      if (on){
        fill(252,160,68);
        rect(x, y, 30, 30);
      }
      //else{
      //  fill(102);
      //  rect(x, y, 30, 30);
      //}
      
      for (int i = 0; i < cPlayers.size(); i++) {
        if(x + 50 >= cPlayers.get(i).x && x <= cPlayers.get(i).x + cPlayers.get(i).size && y + 50 >= cPlayers.get(i).y && y <= cPlayers.get(i).y + cPlayers.get(i).size){
          println(cBonusesCollected.get(id));
          cBonusesCollected.set(id, true);
          println(cBonusesCollected.get(id));
          cPlayers.get(i).maxhealth++;
          cPlayers.get(i).health++;
          cBonuses.remove(curcBonus);
        }
      }
    }
    
    if (type == 2){
      if (on){
        fill(42,181,234);
        rect(x, y, 30, 30);
      }

      for (int i = 0; i < cPlayers.size(); i++) {
        if(x + 30 >= cPlayers.get(i).x && x <= cPlayers.get(i).x + cPlayers.get(i).size && y + 30 >= cPlayers.get(i).y && y <= cPlayers.get(i).y + cPlayers.get(i).size){
          println(cBonusesCollected.get(id));
          cBonusesCollected.set(id, true);
          println(cBonusesCollected.get(id));
          canshoot = true;
          cBonuses.remove(curcBonus);
          cShots.add( new cShot(cPlayers.get(i).x + cPlayers.get(i).size/2 - 15/2, cPlayers.get(i).y + cPlayers.get(i).size/2 - 15/2, 0, 15, 0, color(42,181,234)));
          cShots.add( new cShot(cPlayers.get(i).x + cPlayers.get(i).size/2 - 15/2, cPlayers.get(i).y + cPlayers.get(i).size/2 - 15/2, 90, 15, 0, color(42,181,234)));
          cShots.add( new cShot(cPlayers.get(i).x + cPlayers.get(i).size/2 - 15/2, cPlayers.get(i).y + cPlayers.get(i).size/2 - 15/2, 180, 15, 0, color(42,181,234)));
          cShots.add( new cShot(cPlayers.get(i).x + cPlayers.get(i).size/2 - 15/2, cPlayers.get(i).y + cPlayers.get(i).size/2 - 15/2, 270, 15, 0, color(42,181,234)));
        }
      }
    }
    
    
    if (type == 3){
      if (on){
        if (id == 3){
          fill(150);
          rect(x, y, 40, 40);
          fill(88,110,236);
          rect(x+10, y+10, 20, 20);
        }
        if (id == 5){
          fill(150);
          rect(x, y, 40, 40);
          fill(186,85,211);
          rect(x+10, y+10, 20, 20);
        }
      }
      else{
        if (id == 3){
          fill(140);
          rect(x, y, 40, 40);
          fill(88,110,236);
          rect(x+10, y+10, 20, 20);
        }
        if (id == 5){
          fill(140);
          rect(x, y, 40, 40);
          fill(186,85,211);
          rect(x+10, y+10, 20, 20);
        }
        
      }
      
      for (int i = 0; i < cPlayers.size(); i++) {
        if(x + 40 >= cPlayers.get(i).x && x <= cPlayers.get(i).x + cPlayers.get(i).size && y + 40 >= cPlayers.get(i).y && y <= cPlayers.get(i).y + cPlayers.get(i).size){
          if (id == 3){
            cBonusesCollected.set(id, true);
            cParticles.add( new cParticle(x + 40/2, y + 40/2, 10, color(88,110,236)));
            cParticles.add( new cParticle(x + 40/2, y + 40/2, 10, color(88,110,236)));
            cParticles.add( new cParticle(x + 40/2, y + 40/2, 10, color(88,110,236)));
            cParticles.add( new cParticle(x + 40/2, y + 40/2, 10, color(88,110,236)));
            cParticles.add( new cParticle(x + 40/2, y + 40/2, 10, color(88,110,236)));
            cBonuses.remove(curcBonus);
          }
          if (id == 5){
            cBonusesCollected.set(id, true);
            cParticles.add( new cParticle(x + 40/2, y + 40/2, 10, color(186,85,211)));
            cParticles.add( new cParticle(x + 40/2, y + 40/2, 10, color(186,85,211)));
            cParticles.add( new cParticle(x + 40/2, y + 40/2, 10, color(186,85,211)));
            cParticles.add( new cParticle(x + 40/2, y + 40/2, 10, color(186,85,211)));
            cParticles.add( new cParticle(x + 40/2, y + 40/2, 10, color(186,85,211)));
            cBonuses.remove(curcBonus);
          }
        }
      }
    }
    
    if (type == 4){
      if (on){
        fill(221,62,62);
        rect(x, y, 30, 30);
      }

      for (int i = 0; i < cPlayers.size(); i++) {
        if(x + 30 >= cPlayers.get(i).x && x <= cPlayers.get(i).x + cPlayers.get(i).size && y + 30 >= cPlayers.get(i).y && y <= cPlayers.get(i).y + cPlayers.get(i).size){
          println(cBonusesCollected.get(id));
          cBonusesCollected.set(id, true);
          println(cBonusesCollected.get(id));
          cBonuses.remove(curcBonus);
          cShots.add( new cShot(cPlayers.get(i).x + cPlayers.get(i).size/2 - 15/2, cPlayers.get(i).y + cPlayers.get(i).size/2 - 15/2, 0, 15, 2, color(221,62,62)));
          cShots.add( new cShot(cPlayers.get(i).x + cPlayers.get(i).size/2 - 15/2, cPlayers.get(i).y + cPlayers.get(i).size/2 - 15/2, 90, 15, 2, color(221,62,62)));
          cShots.add( new cShot(cPlayers.get(i).x + cPlayers.get(i).size/2 - 15/2, cPlayers.get(i).y + cPlayers.get(i).size/2 - 15/2, 180, 15, 2, color(221,62,62)));
          cShots.add( new cShot(cPlayers.get(i).x + cPlayers.get(i).size/2 - 15/2, cPlayers.get(i).y + cPlayers.get(i).size/2 - 15/2, 270, 15, 2, color(221,62,62)));
        }
      }
    }
    
    if (type == 5){
      
      fill(221,62,62);
      ellipse(x, y, 100, 100);

      for (int i = 0; i < cPlayers.size(); i++) {
        if((x + 1 >= cPlayers.get(i).x && x <= cPlayers.get(i).x + cPlayers.get(i).size && y + 1 >= cPlayers.get(i).y && y <= cPlayers.get(i).y + cPlayers.get(i).size)){
          println(cBonusesCollected.get(id));
          cBonusesCollected.set(id, true);
          println(cBonusesCollected.get(id));
          cBonuses.remove(curcBonus);
          canmove = false;
        }
      }
    }
    
    if (type == 6){
      println(cBonusesCollected.get(id));
      cBonusesCollected.set(id, true);
      println(cBonusesCollected.get(id));
      cBonuses.remove(curcBonus);
    }
    
    if ( timer > 0 ){
      timer--;
    }
    
    if ( timer == 0 ){
      timer = timerlength;
      on = !on;
    }
  }
}