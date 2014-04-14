//varialbes globales:::

int x = 0;
void setup() {
  size(800, 800);
  background(255);
}

void draw() {

  smooth();
  // ellipse(100, 100, 30, 30);
  flor2(300, 300, 70);
  flor1(20, 300, 100);
  
}

//Funciones:::

void petalo1(int px, int py, int size) {

  bezier(px, py, (px+.2*size), py, (px+.2*size), (py+size), px, (py+size));
  bezier(px, py, (px-.2*size), py, (px-.2*size), (py+size), px, (py+size));
}

void flor1 (int px, int py, int size) {
  translate(px,py);
  for (int i = 0 ; i <= 360; i++){
    rotate(radians(30));
    petalo1(0, 0, size);  
  }
  ellipse(0,0,size*0.3,size*0.3);
  translate(-px,-py);
}

void flor2 (int px, int py, int size) {
  translate(px,py);
  for (int i = 0 ; i <= 360; i++){
    rotate(radians(60));
    ellipse(size, 0, size, size);
  }  
  translate(-px,-py);
}

