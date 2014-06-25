/* codigo para un sensor de humedad para tierra basado en la diferencia de
   potencial entre dos puntos. En este caso se usan clavos galvanizados 
   clavados en la tierra. */
   
//----------------------------
// DECLARACION DE VARIABLES
//----------------------------
   int valorHumedad;
   int humedad;
   
   int sensorHumedad = A5;


//----------------------------
// SETUP
//----------------------------
   void setup(){
     Serial.begin(9600);
     } 


//----------------------------
// MAIN PROGRAM
//----------------------------
   void loop(){
     valorHumedad = analogRead(sensorHumedad);

     delay(1500);

     //------------------------
     // Impresion de valores
     //------------------------
     humedad = (100 * valorHumedad / 1024);
     Serial.print("Humedad:");
     Serial.print(humedad);
     Serial.println("   0 min --- 100 max"); 
     }
