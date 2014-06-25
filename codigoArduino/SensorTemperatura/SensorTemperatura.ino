// sketch para medir temperatura con un sensor lm35. 

int pinTemperatura = A5;      // pin analogo donde va el sensor
int sensorTemperatura = 0;    // valor 0-1023 arrojado por el arduino
int temperaturaC = 0;         // valor convertido a centigrados 

float promedio = 0;                // temperatura promedio
float promedioC = 0;
float promedioC2 = 0;

//-------------------------------------------------------------------
// SETUP
//-------------------------------------------------------------------
void setup(){
  Serial.begin(9600);           //define velocidad puerto serial

}
//___________________________________________________________________


//-------------------------------------------------------------------
// MAIN PROGRAM
//-------------------------------------------------------------------
void loop(){
  sensorTemperatura = analogRead(pinTemperatura);  
  
  promedio = promedioMuestras(50);
  promedioC = promedio * 500 / 1024;                                       
  promedioC2 = sensorTemperatura / 9.31;
  
  //--------------------
  //impresion de valores
  // -------------------
  Serial.print("Temp: ");
  Serial.print(promedio);
  Serial.print("   ");

  Serial.print(promedioC);
  Serial.print(" C");
  Serial.print("   ");
  
  Serial.println(promedioC2);
  Serial.println(sensorTemperatura);

  delay (2000);
}
//_________________________________________________________________


//-----------------------------------------------------------------
// FUNCIONES
//-----------------------------------------------------------------

/* promedioMuestras(a,b) ==> hace varias lecturas de un dato varia-
   ble y devuelve el valor promedio. 
   argumento a: valor variable a promediar.
   argumento b: numero de lecturas que toma para promediar.      */  

float promedioMuestras(int numLecturas){
  int sumadorMuestra = 0;
  for (int i = 0; i < numLecturas; i++){
    muestraActual = analogRead(pinTemperatura);
    sumadorMuestra += muestraActual ;
    Serial.println (muestraActual);
    delay(20);
    }
  float promedio = sumadorMuestra / numLecturas;
  return promedio;
} //---------------------------------------------------------------


//_________________________________________________________________
