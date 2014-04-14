class Flores 
{
  color clr;
  float trans;
  float posx, posy;
  float numPet;
  float petalLength;
  float tamFinal;
  float tamano;
  float velocidad;

  //  variables para saber si estamos en la flor
  float easing;
  float offset;
  boolean overCircle;

  float a;

  Flores(float posX, float posY) 
  { 
    clr = color(random(200, 255));           //  color de la flor
    trans = random(150, 255);                                        //  Transparencia
    posx = posX;                                                     //  poscion de X de la flor
    posy = posY;                                                     //  posicion de Y de la flor  
    numPet = 16;                                          //  Numero de petalos
    tamFinal = random(50) + 50;                                       //  Tamaño de los petalos
    velocidad = 4;                                        //  Velocidad de crecimiento de los petalos

    easing = 0.05;
    offset = 0;
    overCircle = false;
  }

  void posicion()
  {
    ellipseMode(CENTER);
    fill(255);
    ellipse(posx, posy, (tamano + tamFinal + petalLength) * 1.6 / 2, ( tamano + tamFinal + petalLength) * 1.6 / 2);
  }

  void randomFlower(float tamFinal)
  {  
    float numPetals = numPet;
    float petalLength = tamFinal;
    float rot = random(1);
    a = rot;

    translate(posx, posy);

    println("Petal length = " + petalLength);
    for ( rot = 0; rot <= (4 * TWO_PI); rot += (2 * PI) / numPetals) 
    {
      ellipse(0, 0, (rot - petalLength)/2, ( rot - petalLength )/2);
      pushMatrix();
      float giroZ = 1;
      giroZ += 0.5;
      rotate(rot);
      beginShape();
      vertex(10, 10);
      strokeWeight(2);

      pushMatrix();

      //  color de los petalos
      stroke(clr, trans);
      strokeWeight(2);
      bezierVertex( 10, 10, 50, 20, 10 + petalLength, 10 + petalLength  );
      bezierVertex( 10 + petalLength, 10 + petalLength, 5, 60, 10, random(10));
      popMatrix();
      endShape();   
      popMatrix();
    }

   // rotate(rot * 5);

    //  para cambiar totalmente el color de la flor
    noFill();

    for (float i = rot; i < rot + petalLength; i++)
    {
      pushMatrix();
      stroke(clr, trans);
      rotateZ(i);
      //stroke(255, 0, 0);
      strokeWeight(1);
      line(0, 0, i - tamFinal/2, i - tamFinal/2 );
      //stroke(0, 0, 255);
      ellipse(0, 0, i / 3, i / 3);
      popMatrix();
    }
  }


  void crecer() 
  {
    if (tamano <= tamFinal)
    {      
      tamano += velocidad;
      randomFlower(tamano);
    }
    else
    {
      randomFlower(tamFinal);
    }

    ///////////////////////////////  DETERMINANTE SI ESTAMOS EN LA FLOR ///////////////////////
    if (dist(posx, posy, mouseX, mouseY) <= ( (tamano + tamFinal + petalLength ) * 1.6 ) / 2 )
    {
      overCircle = true;
    }
    else
    {
      overCircle = false;
    }

    //  si estamos dentro de la flor
    if (overCircle == true)
    {
   
      float dx = (mouseX - width / 2) - offset;
      offset += dx * easing;

      trans = 0;               
      tamano = 0;
      clr = 0;  //  color de la flor    
      tamFinal = random(50) + 50;
      velocidad = 4;

   
    }

    //  si estamos fuera de la flor
    if (overCircle == false)
    {
      clr = color(random(200, 255));
      trans = random(150, 255);
    }
  }
}

