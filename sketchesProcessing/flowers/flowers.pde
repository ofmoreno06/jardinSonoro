/*--------------------------------------------------------------------------

  SKETCH:       flowers
  AUTOR:        ACORDE
  FECHA:        marzo-2014

  DESCRIPCION:  este es un programa desarrollado para proectarse junto con
                la instalacion de un jardin sonoro, en el cual se activan
                ciertas funciones cuado se tocan las plantas. Este sketch
                en particular hace aparecer en pantalla flores que crecen
                con un disparador (teclas, ckick, etc.) y luego se desva-
                necen. 
--------------------------------------------------------------------------*/



/*  Declaracion del Arraylits de nombre 'arrayFlores' que contiene 
    ojetos de la clase 'Flor' */
ArrayList<Flor> arrayFlores;
//-------------------------------------------------------------------------*
 

//--------------------------
// ###^^**** SETUP ****^^###
//--------------------------
void setup() 
{
  size(640, 480);  //tamano de pantalla
  background(0);   //color del fondo
  frameRate(25);   //tasa de actualizacion

  arrayFlores = new ArrayList <Flor>();   //crea el Arralist vacio
}
//-------------------------------------------------------------------------*


//---------------------------------------
// ###^^**** MAIN PROGRAM ****^^###
//---------------------------------------
void draw() 
{
  //smooth();       // antialiasing        
  background(0);    // color de fondo en cada frame  

  for ( int i = arrayFlores.size() - 1;  i >= 0; i-- )
  {
    Flor flor = arrayFlores.get(i);
    pushMatrix();
    flor.crecer();
    //flor.posicion(); 
    popMatrix();
  }
}   
//-------------------------------------------------------------------------*


//------------------------------
// ###^^**** FUNCIONES ****^^###
//------------------------------

/* Cuando una tecla es presionada aparece una nueva flor en la
   posicion del mouse */
void keyPressed()
{
  arrayFlores.add(new Flor(mouseX, mouseY) );
}
//---------------------------------------------------------------
