

Flower flor; 

void setup()
{
  size(640, 480);
  flor = new Flower(width/2, height/2, 8);
  frameRate(25);
}

void draw()
{
  background(255);

  flor.update();
  flor.display();
}

class Flower
{
  // variables globales
  private float xPos;
  private float yPos;
  private float numPetalos;
  private int tam;
  private float animacion;

  // constantes globales
  float figuraPetalo = random(2, 8); 
  float puntaPetalo  = random(5, 7);

  Flower(float x, float y, float petalos)
  {
    xPos = x;
    yPos = y;
    numPetalos = petalos;
    tam = 0;
  }

  void update()
  {
    tam = 800; 
    animacion = random(1);
    animacion += 0.05;
      println(animacion);

  }

  void display() 
  {
    pushMatrix();
    translate(xPos, yPos);

    //translate(width/2,height/2);
    //rotate( (float) mouseX / 400 * PI * 2 );
    //scale(0.5 + (float)  mouseY / 1000 );
    //scale((float) (0.2 +  50 / sqrt(sq(xPos - mouseX) + sq(yPos - mouseY))));

    noStroke();
    fill(102, 43, 202, 230);

    for (int i = 0; i <= numPetalos ; i++)
    { 
      rotate(i * 3 * PI/(numPetalos/2)); 

      pushMatrix();  

      beginShape();  
       curveVertex(tam/figuraPetalo, -tam*0.05 );
       curveVertex(0, 0);
       curveVertex(mouseX, tam/puntaPetalo );
       curveVertex(mouseX + tam/figuraPetalo, noise(tam/figuraPetalo) * random(animacion));
      endShape();
      
       beginShape();
        curveVertex(-(tam/figuraPetalo), -tam*0.05);
        curveVertex(0, 0);
        curveVertex(-mouseX, tam/puntaPetalo);
        curveVertex(mouseX -tam/figuraPetalo, noise(tam/figuraPetalo) * random(animacion) );
       endShape();
       
      popMatrix();
    }
    popMatrix();
  }
  
}

