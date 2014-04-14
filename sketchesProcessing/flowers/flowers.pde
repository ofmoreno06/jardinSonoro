/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/312*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */


ArrayList<Flores> f1;

void setup() 
{
  size(640, 480, P3D);
  background(0);
  frameRate(100);

  f1 = new ArrayList <Flores>();
}

void draw() 
{
  smooth();
  background(0);

  for (int i=f1.size()-1;  i>=0; i-- )
  {
    Flores flor = f1.get(i);
    pushMatrix();
    flor.crecer();
    //flor.posicion(); 
    popMatrix();
    
    /*
    if (flor.overCircle == true)
    {
      f1.remove(i);
    }
    else
    {
      f1.add(new Flores(random(100 + width-100), random(100 + height-100) ) );
    }
    */
  }
}   

void keyPressed()
{
  f1.add(new Flores(mouseX, mouseY) );
}

