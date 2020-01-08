ArrayList<Flue> flueListe = new ArrayList<Flue>(); //initialiserer en liste af flueobjekter

void setup(){
  size(500,500);
}

void draw(){
  for(int i=0; i<flueListe.size(); i++){//for hvert objekt i listen
    Flue f = flueListe.get(i); //danner et midlertidigt objekt "f" af typen flue, som er en kopi af fluen i arrayet med indexen "i"
    f.tegnFlue(); //kører tegnFlue metoden for det midlertidige objekt
    f.flyt(); //kører flyt metoden for det midlertidige objekt
  }
}

void keyPressed(){
  if(keyCode != 'E'){
    flueListe.add(new Flue(1, 1)); //en flue bliver dannet i fluelisten med constructeren Flue(float scale_)
  }
  else{
    flueListe.add(new Flue(3, 1));
  }
  
}

void mousePressed(){
  flueListe.add(new Flue(mouseX, mouseY,2, 1));//en flue bliver dannet med mussepositionen som argument i fluelisten med konstructeren Flue(float a, float b, float scale_)
}

/////////////////////////////////////////////////////////
class Flue{
  
  float positionX,positionY; //dens startpositionsvariabler bliver initialiseret
  PVector hastighed = new PVector(0,0);
  float vinkel = 0; //dens rotationsvariable bliver initialiseret
  float flueScale;
  
  Flue(float scale_, float speed){ //cunstroctoren uden argumenter
    positionX  = random(0,height); //dens position bliver sat til en tilfældig højde på skærmen
    positionY  = random(0,width); //-||- men med bredde
    vinkel     = random(0,2*PI); //-||- men med rotation
    flueScale = scale_;
    
    hastighedCalc(speed);
  }
  
  Flue(float a, float b,float scaleFactor, float speed){//cunstroctoren med argumenter for fluens position
    positionX = a;//dens x-position bliver sat lig argument a
    positionY = b;//-||- men med y og b
    vinkel = random(0,2*PI);//den får en tilfældig rotation
    
    //skaleringsting til opgaven
    float widthHeightAverage = (width + height) / 2;
    float heightDistance = abs(b + height/2);
    float widthDistance = abs(a + width/2);
    float heightDistanceFactor = abs(1 - heightDistance / widthHeightAverage);
    float widthDistanceFactor = abs(1 - widthDistance / widthHeightAverage);
    flueScale = (heightDistanceFactor + widthDistanceFactor) * scaleFactor;
    
    hastighedCalc(speed);
  }
  
  void hastighedCalc(float speed){ //udregner hastighedsvektoren ud fra dens vinkel og størrelse
    hastighed.x = cos(vinkel) * speed;
    hastighed.y = sin(vinkel) * speed;   
  }
  
  void flyt(){//har lige rettet det til lidt pænere kode ;)
    //hitbox calc
    if(positionX < 0){
      hastighed.x = abs(hastighed.x);
    }
    else if(positionX > width){
      hastighed.x = -abs(hastighed.x);
    }
    if(positionY < 0){
      hastighed.y = abs(hastighed.y);
    }
    else if(positionY > height){
      hastighed.y = -abs(hastighed.y);
    }
    
    //får den til at flyve
    positionX += hastighed.x;
    positionY += hastighed.y;
    
    //får den til at pege fremad ift. flyveretningen
    vinkel = atan(hastighed.y/hastighed.x);
    if(hastighed.x < 0){
      vinkel += PI;
    }
  }

  void tegnFlue(){//tegner fluen
    pushMatrix();
      translate(positionX,positionY);//sætter pos til startpositionen fra constructoren
      rotate(vinkel); //sætter startvinklen
      //translate(distanceFlyttet,0); //flytter den samlede bevægede afstand
        ellipse(0,0,20*flueScale,8*flueScale);//tegner en fluedel
        ellipse(0,-8*flueScale,15*flueScale,10*flueScale);//-||-
        ellipse(0,8*flueScale,15*flueScale,10*flueScale);//-||-
        ellipse(+6*flueScale,0,8*flueScale,8*flueScale);//-||-
    popMatrix();
  } 
}
//////////////////////////////////////////////////////
