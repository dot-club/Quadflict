int GameState = 0; //0 = main menu, 1 = game

boolean paused = false;

boolean canmove = true;

boolean debug = false;
boolean keepparticles = true;

int bulletspread = 14;
int enemybulletspread = 14;

int particlemax = 260;

int healthtimer = 15;
boolean healthtimeon = true;

boolean RIGHTdown = false;
boolean LEFTdown = false;
boolean UPdown = false;
boolean DOWNdown = false;

boolean Ddown = false;
boolean Adown = false;
boolean Wdown = false;
boolean Sdown = false;

int playerX;
int playerY;
int playerSize = 40;

boolean screenflash = false;
color flashcolor = color(255, 255, 255);

int loadsave;
int savenumber;
int savesave;

String[] currentSaved = new String[4];

int roomnumber;
int sectionlength;
int gonethrough;
color roomclr1;
color playerclr;

boolean canshoot = false;
boolean canshootrockets = false;

ArrayList<Boolean> cBonusesCollected = new ArrayList<Boolean>();

ArrayList<cPlayer> cPlayers = new ArrayList<cPlayer>();
int curcPlayer;

ArrayList<cShot> cShots = new ArrayList<cShot>();
int curcShot;

ArrayList<cEnemy> cEnemies = new ArrayList<cEnemy>();
int curcEnemy;

ArrayList<cBlock> cBlocks = new ArrayList<cBlock>();
int curcBlock;

ArrayList<cParticle> cParticles = new ArrayList<cParticle>();
int curcParticle;

ArrayList<cDeadparticle> cDeadparticles = new ArrayList<cDeadparticle>();
int curcDeadparticle;

ArrayList<cEntrance> cEntrances = new ArrayList<cEntrance>();
int curcEntrance;

ArrayList<cSave> cSaves = new ArrayList<cSave>();
int curcSave;

ArrayList<cBonus> cBonuses = new ArrayList<cBonus>();
int curcBonus;

ArrayList<cPickup> cPickups = new ArrayList<cPickup>();
int curcPickup;

void setup(){
  size(1280, 720);
  frameRate(60);
  
  noStroke();
  
  background(181,167,229);
  textSize(144);
  textAlign(CENTER);
  fill(255);
  //text("loading", width/2, height/2);
  
}

void draw(){
    
    if (canmove == false){
      RIGHTdown = false;
      LEFTdown = false;
      UPdown = false;
      DOWNdown = false;
      Wdown = false;
      Adown = false;
      Sdown = false;
      Ddown = false;
    }
  
    if (GameState == 0){ //if on menu
      background(181,167,229);
      fill(255, 255, 255);
      textSize(32);
      textAlign(CORNER);
      text("Noah Friedman", 8, 720 - 32/3);
      textSize(72);
      textAlign(CENTER);
      text("Quadflict", width/2, 200);
      
      //new game button
      if (mouseX > 515 && mouseX < 763 && mouseY < 402 && mouseY > 277){
        rectMode(CENTER);
        rect(width/2, 340, 250, 125);
        textSize(39);
        fill(181,167,229);
        text("New Game", width/2, 352.5);
        rectMode(CORNER);
      }
      else{
        rectMode(CENTER);
        fill(181,167,229);
        rect(width/2, 340, 250, 125);
        textSize(39);
        fill(255, 255, 255);
        text("New Game", width/2, 352.5);
        rectMode(CORNER);
      }
      
      
      //load game button
      if (mouseX > 515 && mouseX < 763 && mouseY < 402+150 && mouseY > 277+150){
        rectMode(CENTER);
        rect(width/2, 340+150, 250, 125);
        textSize(39);
        fill(181,167,229);
        text("Load Game", width/2, 352.5+150);
        rectMode(CORNER);
      }
      else{
        rectMode(CENTER);
        fill(181,167,229);
        rect(width/2, 340+150, 250, 125);
        textSize(39);
        fill(255, 255, 255);
        text("Load Game", width/2, 352.5+150);
        rectMode(CORNER);
      }
      
      
    }
    
    if (GameState == 2){ //if paused in game
      //fill(0,0,0);
      //rect(1240,20,20,50);
      //rect(1200,20,20,50);
      
      fill(181,167,229);
      rect(415, 110, 450, 500);
      
      textSize(39);
      fill(255);
      text("Paused", 640, 160);
      
      textSize(29);
      text("Resume game (p)", 640, 240);
      
      text("New game (n)", 640, 340);
      text("Load game (l)", 640, 380);
      text("Main menu (m)", 640, 420);
      
      text("You can do it!", 640, 520);
    }
    
    if (GameState == 1){ //if in game and not paused
      background(roomclr1);
      
      
      for (int i = 0; i < cBlocks.size(); i++) {
        curcBlock = i;
        if (cBlocks.get(curcBlock).type == 0){
          cBlocks.get(curcBlock).display();
        }
      }
      
      if (cDeadparticles.size() > particlemax){
        for (int i = 0; i < cDeadparticles.size() - particlemax; i++) {
          cDeadparticles.remove(i);
        }
      }
      
      for (int i = 0; i < cSaves.size(); i++) {
        curcSave = i;
        cSaves.get(curcSave).display();
      }
      
      for (int i = 0; i < cBlocks.size(); i++) {
        curcBlock = i;
        if (cBlocks.get(curcBlock).type == 2){
          cBlocks.get(curcBlock).display();
        }
      }
      
      for (int i = 0; i < cDeadparticles.size(); i++) {
        curcDeadparticle = i;
        cDeadparticles.get(curcDeadparticle).update();
      }
      
      for (int i = 0; i < cBonuses.size(); i++) {
        curcBonus = i;
        cBonuses.get(curcBonus).update();
      }
      
       for (int i = 0; i < cPickups.size(); i++) {
        curcPickup = i;
        cPickups.get(curcPickup).update();
      }
      
      for (int i = 0; i < cShots.size(); i++) {
        curcShot = i;
        cShots.get(curcShot).update();
        cShots.get(curcShot).display();
        cShots.get(curcShot).maybedelete();
      }
      
      for (int i = 0; i < cShots.size(); i++) {
        curcShot = i;
        cShots.get(curcShot).display();
      }
      
      
      for (int i = 0; i < cParticles.size(); i++) {
        curcPlayer = i;
        cParticles.get(curcParticle).update();
        cParticles.get(curcParticle).display();
      }
      
      for (int i = 0; i < cEnemies.size(); i++) {
        curcEnemy = i;
        cEnemies.get(curcEnemy).update();
        cEnemies.get(curcEnemy).display();
        cEnemies.get(curcEnemy).maybedelete();
      }
      
      if (cBonusesCollected.get(6) == true){
        for (int i = 0; i < cEnemies.size(); i++) {
          curcEnemy = i;
          cEnemies.get(curcEnemy).display();
        }
      }
      
      //for (int i = 0; i < cEnemies.size(); i++) {
      //  curcEnemy = i;
      //  cEnemies.get(curcEnemy).display();
      //}
      
      
      for (int i = 0; i < cBlocks.size(); i++) {
        curcBlock = i;
        if (cBlocks.get(curcBlock).type == 1){
          cBlocks.get(curcBlock).display();
        }
      }
      
      for (int i = 0; i < cEntrances.size(); i++) {
        curcEntrance = i;
        //println(cEntrances.size());
        if (debug){
          cEntrances.get(curcEntrance).display();
        }
      }
      
      
      for (int i = 0; i < cPlayers.size(); i++) {
        curcPlayer = i;
        cPlayers.get(curcPlayer).update();
        cPlayers.get(curcPlayer).display();
        cPlayers.get(curcPlayer).maybedelete();
        //println("x: " + cPlayers.get(curcPlayer).x);
        //println("y: " + cPlayers.get(curcPlayer).y);
      }
      
      for (int i = 0; i < cBonuses.size(); i++) {
        if (cBonuses.get(curcBonus).type == 5){
          curcBonus = i;
          cBonuses.get(curcBonus).update();
        }
      }
      
      
      for (int i = 0; i < cBlocks.size(); i++) {
        curcBlock = i;
        if (cBlocks.get(curcBlock).type == -1){
          cBlocks.get(curcBlock).display();
        }
      }
      
      for (int i = 0; i < cPlayers.size(); i++) {
        curcPlayer = i;
        
        //fill(#CC99FF);
        //rect(0, 0, 40 + 40*cPlayers.get(curcPlayer).maxhealth, 70);
        
        //println(cPlayers.get(curcPlayer).x);
        //println(cPlayers.get(curcPlayer).y);
        
        for (int j = 0; j < cPlayers.get(curcPlayer).maxhealth; j++) {
            
          fill(#6600CC);
          rect(20 + (40*j) - 10, 10, 50, 50);
          
          fill(102);
          rect(20 + (40*j), 20, 30, 30);
          //println(j);
         }
        
        for (int j = 0; j < cPlayers.get(curcPlayer).health; j++) {
            if ( (cPlayers.get(curcPlayer).health == 1 && healthtimeon) == false){
              fill(cPlayers.get(curcPlayer).clr);
              rect(20 + (40*j), 20, 30, 30);
            }
            //println(j);
         }
         
         if (cPlayers.get(curcPlayer).health == 1 && healthtimer == 0){
           healthtimer = 15;
           healthtimeon = !healthtimeon;
         }
         
         if (cPlayers.get(curcPlayer).health == 1 && healthtimer > 0){
           healthtimer--;
         }
         
         
      }
      
      
      if ( cBonusesCollected.get(9) ){
        fill(57,197,57);
        rect(10, 57,(40*cPlayers.get(curcPlayer).maxhealth/2)+5, 3);
      }
      
      if ( cBonusesCollected.get(10) ){
        fill(57,197,57);
        rect(10, 57,(40*cPlayers.get(curcPlayer).maxhealth/2)+5, 3);
      }
      
      if ( cBonusesCollected.get(9) && cBonusesCollected.get(10)){
        fill(57,197,57);
        rect(10, 57,(40*cPlayers.get(curcPlayer).maxhealth)+10, 3);
      }
      
      
      int j = 1;
      
      if ( cBonusesCollected.get(2) ){
        fill(42,181,234);
        rect(10*j, 50, 10, 10);
        j++;
      }
      if ( cBonusesCollected.get(3) ){
        fill(88,110,236);
        rect(10*j, 50, 10, 10);
        j++;
      }
      if ( cBonusesCollected.get(5) ){
        fill(186,85,211);
        rect(10*j, 50, 10, 10);
        j++;
      }
      if ( cBonusesCollected.get(6) ){
        fill(221,62,62);
        rect(10*j, 50, 10, 10);
        j++;
      }
      
      //text(millis(), 200, 200);
      
      //fill(255);
      //text(int(frameRate), 30, 40);
      //text(roomnumber, 30, 700);
      
      if (roomnumber == 20 || roomnumber == 22){
        fill(0);
        textSize(39);
        text("You win", 640, 300);
        text("Press space to go back to the menu", 640, 400);
        if ( cBonusesCollected.get(9) && cBonusesCollected.get(10) ){
          text("2/2 secrets found", 640, 500);
        }
        else{
          if ( cBonusesCollected.get(9) || cBonusesCollected.get(10) ){
            text("1/2 secrets found", 640, 500);
          }
          else{
            text("0/2 secrets found", 640, 500);
          }
        }
      }
      
      if (screenflash){
        fill(flashcolor);
        rect(0, 0, width, height);
        text("can you read this", 500, 500);
        //if (random(0,1) > 0.8){
          screenflash = false;
        //}
        println("flash! 2");
      }
      
    }
    //println(frameRate);
}

void keyPressed(){
  if (keyCode == ' ' && GameState == 0){
    GameState = 1;
    
    loadsave();
    
    loadroom();
    //cPlayers.add( new cPlayer(1075, 560, 5, 40, color(252,160,68)));
    
    //cPlayers.add( new cPlayer(1075, 560, 5, 40, color(221,134,62)));
  }
  
  if(keyCode == RIGHT){ RIGHTdown = true; }
  if(keyCode == LEFT){ LEFTdown = true; }
  if(keyCode == UP){ UPdown = true; }
  if(keyCode == DOWN){ DOWNdown = true; }
  
  if(key == 'd' || key == 'D'){ Ddown = true; }
  if(key == 'a' || key == 'A'){ Adown = true; }
  if(key == 'w' || key == 'W'){ Wdown = true; }
  if(key == 's' || key == 'S'){ Sdown = true; }
  if(key == 'r'){ loadsave(); loadroom(); }
  
  if(key == 'p' || key == 'P'){
    if ( (GameState == 0) == false){
      paused = !paused;
      println("paused = " + paused);
    }
    if(paused && GameState == 1){
      GameState = 2;
    }
    if(paused == false && GameState == 2){
      GameState = 1;
    }
  }
  
  if((key == ' ' && canmove == false) || (paused && (key == 'm' || key == 'M')) ){
    reset();
  }
  
  if((paused || GameState == 0 ) && (key == 'n' || key == 'N') ){
    reset();
    GameState = 1;
    loadsave = 0;
    savesave = 2;
    loadsave();
    loadroom();
  }
  
  if((paused || GameState == 0 ) && (key == 'l' || key == 'L') ){
    reset();
    GameState = 1;
    loadsave = 2;
    savesave = 2;
    loadsave();
    loadroom();
  }
  
  
}

void keyReleased(){
  if(keyCode == RIGHT){ RIGHTdown = false; }
  if(keyCode == LEFT){ LEFTdown = false; }
  if(keyCode == UP){ UPdown = false; }
  if(keyCode == DOWN){ DOWNdown = false; }
  
  if(key == 'd' || key == 'D'){ Ddown = false; }
  if(key == 'a' || key == 'A'){ Adown = false; }
  if(key == 'w' || key == 'W'){ Wdown = false; }
  if(key == 's' || key == 'S'){ Sdown = false; }
}

void mousePressed(){
  println("click at " + mouseX + ", " + mouseY);
  
  if (GameState == 0){
    if (mouseX > 515 && mouseX < 763 && mouseY < 402 && mouseY > 277){
      GameState = 1;
      loadsave = 0;
      savesave = 2;
      loadsave();
      loadroom();
    }
  if (mouseX > 515 && mouseX < 763 && mouseY < 402+150 && mouseY > 277+150){
      GameState = 1;
      loadsave = 2;
      savesave = 2;
      loadsave();
      loadroom();
    }
  }
  
}

void loadroom(){
  int[] currentLine;
  String[] currentRoom = loadStrings("/Rooms/room" + roomnumber + ".txt");
  
  //ArrayList<cBlock> cBlocks = new ArrayList<cBlock>();
  //ArrayList<cEnemy> cEnemies = new ArrayList<cEnemy>();
  //ArrayList<cEntrance> cEntrances = new ArrayList<cEntrance>();
  //ArrayList<cParticle> cParticles = new ArrayList<cParticle>();
  //ArrayList<cShot> cShots = new ArrayList<cShot>();
  
  cBlocks.clear();
  cEnemies.clear();
  cEntrances.clear();
  cParticles.clear();
  cDeadparticles.clear();
  cShots.clear();
  cSaves.clear();
  cBonuses.clear();
  cPickups.clear();
  
  for (int i = 0; i < currentRoom.length; i++) {
     if ( i == 0 ){
      //roomclr1
      currentLine = int(split(currentRoom[0],','));
      roomclr1 = color(currentLine[0],currentLine[1],currentLine[2]);
      currentLine = new int[0];
    }
    
    if ( i == 1 ){
      //roomclr2
      currentLine = int(split(currentRoom[1],','));
      playerclr = color(currentLine[0],currentLine[1],currentLine[2]);
      currentLine = new int[0];
    }
    
    if ( i == 2){
      for (sectionlength = 3; sectionlength < currentRoom.length; sectionlength++) {
        //String tempstring = currentRoom[i + sectionlength];
        if(currentRoom[sectionlength].length() == 1){
          sectionlength = sectionlength - i - 1;
          //println(sectionlength);
          break;
        }
      }
      
    }
      
    if ( i == 3){
      for (int j = 0; j < sectionlength; j++) {
        currentLine = int(split(currentRoom[j+3],','));
        cBlocks.add(new cBlock(currentLine[0], currentLine[1], currentLine[2], currentLine[3], currentLine[4], color(currentLine[5],currentLine[6],currentLine[7])));
      }
      gonethrough = 3 + sectionlength;
    }
    
    if ( i == gonethrough && cBlocks.size() > 0 && cEnemies.size() == 0 ){
      for (sectionlength = gonethrough + 1; sectionlength < currentRoom.length; sectionlength++) {
        println(currentRoom[sectionlength]);
        if(currentRoom[sectionlength].length() == 1 || currentRoom[sectionlength].length() == 0){
          sectionlength = sectionlength - gonethrough - 1;
          println("sectionlength: " + sectionlength);
          break;
        }
      }
      
      for (int j = 0; j < sectionlength; j++) {
       currentLine = int(split(currentRoom[gonethrough+j+1],','));
       println("currentLine[0]: " + currentLine[0]);
       println("currentLine[1]: " + currentLine[1]);
       println("currentLine[2]: " + currentLine[2]);
       println("currentLine[3]: " + currentLine[3]);
       println("currentLine[4]: " + currentLine[4]);
       println("currentLine[5]: " + currentLine[5]);
       println("currentLine[6]: " + currentLine[6]);
       cEnemies.add(new cEnemy(currentLine[0], currentLine[1], currentLine[2], currentLine[3], color(currentLine[4], currentLine[5], currentLine[6])));
      }
      gonethrough = gonethrough + sectionlength + 2;
      
    }
    
    if ( i == gonethrough && cEnemies.size() > 0 && cEntrances.size() == 0 ){
      //sectionlength = gonethrough;
      for (int section = gonethrough; section < currentRoom.length; section++) {
        if(currentRoom[section].length() == 1){
          sectionlength = section - gonethrough;
          break;
        }
        //println("section: " + section);
      }
      
      for (int j = 0; j < sectionlength; j++) {
       currentLine = int(split(currentRoom[gonethrough+j],','));
       cEntrances.add(new cEntrance(currentLine[0], currentLine[1], currentLine[2], currentLine[3], currentLine[4], currentLine[5]));
      }
      gonethrough = gonethrough + sectionlength + 1;
    }
    
    if ( i == gonethrough && cEntrances.size() > 0 && cSaves.size() == 0 ){
      //sectionlength = gonethrough;
      for (int section = gonethrough; section < currentRoom.length; section++) {
        //println("current line: " + currentRoom[section]);
        if(currentRoom[section].length() == 1){
          sectionlength = section - gonethrough;
          break;
        }
        //println("section: " + section);
      }
      
      for (int j = 0; j < sectionlength; j++) {
        currentLine = int(split(currentRoom[gonethrough+j],','));
        //println("currentLine[0]: " + currentLine[0]);
        //println(currentLine[1]);
        cSaves.add(new cSave(currentLine[0], currentLine[1]));
      }
      gonethrough = gonethrough + sectionlength + 1;
    }
    if ( i == gonethrough && cEntrances.size() > 0 && cBonuses.size() == 0 ){
      //sectionlength = gonethrough;
      for (int section = gonethrough; section < currentRoom.length; section++) {
        println("current line: " + currentRoom[section]);
        if(currentRoom[section].length() == 1){
          println("found #");
          println("section: " + section);
          println("gonethrough: " + gonethrough);
          sectionlength = section - gonethrough;
          println("sectionlength: " + sectionlength);
          break;
        }
        //println("section: " + section);
      }
      println("sectionlength: " + sectionlength);
      for (int j = 0; j < sectionlength; j++) {
        println("creating bonus");
        println("j: " + j);
        currentLine = int(split(currentRoom[gonethrough+j],','));
        cBonuses.add(new cBonus(currentLine[0], currentLine[1], currentLine[2], currentLine[3]));
      }
      gonethrough = gonethrough + sectionlength + 1;
      println("gonethrough: " + gonethrough);
    }
    
    
  }
  
  println("--");
  println("loaded room" + roomnumber + ".txt");
  println("------");
  

}

void loadsave(){
  
  String[] currentSave = loadStrings("/Saves/save" + loadsave + ".txt");
  int[] currentLine;

  println(currentSave);

  currentLine = int(split(currentSave[0],','));
  cPlayers.clear();
  cPlayers.add( new cPlayer(currentLine[0], currentLine[1], currentLine[2], currentLine[3], color(currentLine[4],currentLine[5],currentLine[6])));
  
  currentLine = int(split(currentSave[1],','));
  canshoot = boolean(currentLine[0]);
  
  currentLine = int(split(currentSave[2],','));
  roomnumber = currentLine[0];
  
  cBonusesCollected.clear();
  
  currentLine = int(split(currentSave[3],','));
  println("current line length: " + currentLine.length);
  for (int i = 0; i < currentLine.length; i++) {
    cBonusesCollected.add( boolean(currentLine[i]) );
    println("i: " + i);
  }
  
  println("bonuses collected: " + cBonusesCollected);
  
  println("-------");
  println("loaded save" + loadsave + ".txt");
  println("-------");
  
}

void savesave(){
  
  screenflash = true;
  flashcolor = color(255, 255, 255);
  
  fill(flashcolor);
  rect(0, 0, width, height);
  
  for (int i = 0; i < cPlayers.size(); i++) {
    cPlayers.get(i).savefile();
  }
  println("currentSaved[0]: " + currentSaved[0]);
  currentSaved[1] = str(int(canshoot));
  println("currentSaved[1]: " + currentSaved[1]);
  currentSaved[2] = str(roomnumber);
  println("currentSaved[2]: " + currentSaved[2]);
  //currentSaved[3] = str(roomnumber);
  
  currentSaved[3] = "";
  
  //int j = split(currentSaved[3],',').length+1;
  //println("j: " + j);
  
  for (int i = 0; i < cBonusesCollected.size(); i++) {
    currentSaved[3] = currentSaved[3] + int(cBonusesCollected.get(i)) + ",";
    println(currentSaved[3]);
    println("i: " + i);
  }
  
  println(currentSaved[3]);
  println("currentSaved: " + currentSaved);
  saveStrings("/Saves/save" + savesave + ".txt", currentSaved);
  
  println(currentSaved);
  println("save number: " + savesave);
  println("saved");
  
  loadsave = savesave;
  savenumber = savesave;
  
  screenflash = true;
  flashcolor = color(255, 255, 255);
  println("flash! 1");
  
  fill(flashcolor);
  rect(0, 0, width, height);
  
}

void reset(){
  GameState = 0;
  paused = false;
  canmove = true;
  healthtimeon = true;
  RIGHTdown = false;
  LEFTdown = false;
  UPdown = false;
  DOWNdown = false;
  Ddown = false;
  Adown = false;
  Wdown = false;
  Sdown = false;
  screenflash = false;
  flashcolor = color(255, 255, 255);
  canshoot = false;
  canshootrockets = false;
  canmove = true;
  setup();
}