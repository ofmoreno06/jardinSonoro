//varialbes globales:::

int x = 0;
float ruido = random(10);
int tam = 0;
void setup() {
  frameRate(12);
  size(800, 800);
  background(255);
}

void draw() {

  smooth();
  // ellipse(100, 100, 30, 30);
  // flor2(300, 300, tam);
  tam++;
  //flor1(100, 300, tam);
  petalo2(width/2, height/2, 300);
}

//Funciones:::

void petalo1(int px, int py, int size) {

  bezier(px, py, (px+.2*size), py, (px+.2*size), (py+size), px, (py+size));
  bezier(px, py, (px-.2*size), py, (px-.2*size), (py+size), px, (py+size));
}

void petalo2(int px, int py, int size)
{
  beginShape();
  curveVertex(px, py);                         // punto de inicio
  curveVertex(px, py);                         // punto de inicio de la curva
  curveVertex(px  + 0.03*size , py - size/3);   // punto intermedio de la curva
  curveVertex(px  + 0.05*size , py - 2*size/3); // punto final de la curva
  curveVertex(px, py-size);                    // punta      
  curveVertex(px - 0.05*size, py - 2*size/3);   // punto inicial de la segunda curva  
  curveVertex(px - 0.03*size, py - size/3);     // punto intermedio de la segunda curva
  curveVertex(px, py);                           // punto final de la segunda curva
  curveVertex(px, py);                           // final
  endShape(CLOSE);
}

void flor1 (int px, int py, int size) {
  translate(px, py);
  for (int i = 0 ; i <= 360; i++) {
    rotate(radians(30));
    petalo2(0, 0, size);
  }
  ellipse(0, 0, size*0.3, size*0.3);
  translate(-px, -py);
}

void flor2 (int px, int py, int size) {
  translate(px, py);
  for (int i = 0 ; i <= 360; i++) {
    rotate(radians(60));
    ellipse(size, 0, size, size);
  }  
  translate(-px, -py);
}

