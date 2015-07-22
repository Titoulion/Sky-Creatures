#include <SoftwareSerial.h>

#define rxPin 3
#define txPin 2

SoftwareSerial range(txPin, rxPin);

void setup() {
  Serial.begin(9600);
  Serial.println("Arduino ready!");

  range.begin(9600);
}

void loop() {
  int distsensor = 0;
  for (int i=0; i<8; i++) {
    distsensor += analogRead(0);
    delay(5);
  }
  distsensor /= 8;
  Serial.println(distsensor);
return;

  if (range.available())
  {
    byte a = range.read();
    Serial.print(a);
    Serial.print(" / ");
    Serial.println((char) a);
  }
  delay(5);
}
