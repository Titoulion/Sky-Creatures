#include <SoftwareSerial.h>

int bluetoothTx = 10;  // TX-O pin of bluetooth mate
int bluetoothRx = 11;  // RX-I pin of bluetooth mate

SoftwareSerial bluetooth(bluetoothTx, bluetoothRx);

int counter = 0;

void setup()
{
  //Serial.begin(57600);  // Begin the serial monitor at 9600bps
  Serial.begin(9600);  // Begin the serial monitor at 9600bps

  bluetooth.begin(115200);  // The Bluetooth Mate defaults to 115200bps
  bluetooth.print("$");  // Print three times individually
  bluetooth.print("$");
  bluetooth.print("$");  // Enter command mode
  delay(100);  // Short delay, wait for the Mate to send back CMD
  bluetooth.println("U,9600,N");  // Temporarily Change the baudrate to 9600, no parity
  // 115200 can be too fast at times for NewSoftSerial to relay the data reliably
  bluetooth.begin(9600);  // Start bluetooth serial at 9600
}

void loop()
{
  bluetooth.println(counter);
  Serial.println(counter);
  counter++;

  delay(50);
}
