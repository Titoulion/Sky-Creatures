/*******************************************************************************

 Bare Conductive MPR121 library
 ------------------------------
 
 DataStream.ino - prints capacitive sense data from MPR121 to serial port
 
 Based on code by Jim Lindblom and plenty of inspiration from the Freescale 
 Semiconductor datasheets and application notes.
 
 Bare Conductive code written by Stefan Dzisiewski-Smith and Peter Krige.
 
 This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 
 Unported License (CC BY-SA 3.0) http://creativecommons.org/licenses/by-sa/3.0/
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.

*******************************************************************************/

#include <SoftwareSerial.h>

int bluetoothTx = 12;  // TX-O pin of bluetooth mate
int bluetoothRx = 13;  // RX-I pin of bluetooth mate

SoftwareSerial bluetooth(bluetoothTx, bluetoothRx);

// serial rate
#define baudRate 57600

#include <MPR121.h>
#include <Wire.h>

// this is the touch threshold - setting it low makes it more like a proximity trigger
// default value is 40 for touch
const int touchThreshold = 40;
// this is the release threshold - must ALWAYS be smaller than the touch threshold
// default value is 20 for touch
const int releaseThreshold = 20;

void setup(){
  Serial.begin(baudRate);
  while(!Serial); // only needed for Arduino Leonardo or Bare Touch Board 

  bluetooth.begin(115200);  // The Bluetooth Mate defaults to 115200bps
  //while(!bluetooth); // only needed for Arduino Leonardo or Bare Touch Board 
  bluetooth.print("$");  // Print three times individually
  bluetooth.print("$");
  bluetooth.print("$");  // Enter command mode
  delay(100);  // Short delay, wait for the Mate to send back CMD
  bluetooth.println("U,9600,N");  // Temporarily Change the baudrate to 9600, no parity
  // 115200 can be too fast at times for NewSoftSerial to relay the data reliably
  bluetooth.begin(9600);  // Start bluetooth serial at 9600
  //while(!bluetooth); // only needed for Arduino Leonardo or Bare Touch Board 

  // 0x5C is the MPR121 I2C address on the Bare Touch Board
  if(!MPR121.begin(0x5C)){ 
    Serial.println("error setting up MPR121");  
    switch(MPR121.getError()){
      case NO_ERROR:
        Serial.println("no error");
        break;  
      case ADDRESS_UNKNOWN:
        Serial.println("incorrect address");
        break;
      case READBACK_FAIL:
        Serial.println("readback failure");
        break;
      case OVERCURRENT_FLAG:
        Serial.println("overcurrent on REXT pin");
        break;      
      case OUT_OF_RANGE:
        Serial.println("electrode out of range");
        break;
      case NOT_INITED:
        Serial.println("not initialised");
        break;
      default:
        Serial.println("unknown error");
        break;      
    }
    while(1);
  }


  MPR121.setTouchThreshold(touchThreshold);
  MPR121.setReleaseThreshold(releaseThreshold);  
}

void loop(){
   readRawInputs();  
}

void readRawInputs(){
  if(MPR121.touchStatusChanged()) MPR121.updateTouchData();
  MPR121.updateBaselineData();
  MPR121.updateFilteredData();
    
  //printDataSerial();
  printDataBluetooth();
}

void printDataSerial()
{
  int i;
  Serial.print("TOUCH: ");
  for(i=0; i<13; i++){          // 13 touch values
    Serial.print(MPR121.getTouchData(i), DEC);
    if(i<12) Serial.print(" ");
  }    
  Serial.print(";");
  
  Serial.print("TTHS: ");
  for(i=0; i<13; i++){          // 13 touch thresholds
    Serial.print(touchThreshold, DEC); 
    if(i<12) Serial.print(" ");
  }   
  Serial.print(";");
  
  Serial.print("RTHS: ");
  for(i=0; i<13; i++){          // 13 release thresholds
    Serial.print(releaseThreshold, DEC); 
    if(i<12) Serial.print(" ");
  }   
  Serial.print(";");
  
  Serial.print("FDAT: ");
  for(i=0; i<13; i++){          // 13 filtered values
    Serial.print(MPR121.getFilteredData(i), DEC);
    if(i<12) Serial.print(" ");
  } 
  Serial.print(";");
  
  Serial.print("BVAL: ");
  for(i=0; i<13; i++){          // 13 baseline values
    Serial.print(MPR121.getBaselineData(i), DEC);
    if(i<12) Serial.print(" ");
  } 
  Serial.print(";");
  
  // the trigger and threshold values refer to the difference between
  // the filtered data and the running baseline - see p13 of 
  // http://www.freescale.com/files/sensors/doc/data_sheet/MPR121.pdf
  
  Serial.print("DIFF: ");
  for(i=0; i<13; i++){          // 13 value pairs
    Serial.print(MPR121.getBaselineData(i)-MPR121.getFilteredData(i), DEC);
    if(i<12) Serial.print(" ");
  }           
  Serial.println();
}

void printDataBluetooth()
{
  int i;
  bluetooth.print("TOUCH: ");
  for(i=0; i<13; i++){          // 13 touch values
    bluetooth.print(MPR121.getTouchData(i), DEC);
    if(i<12) bluetooth.print(" ");
  }    
  bluetooth.print(";");
  
  bluetooth.print("TTHS: ");
  for(i=0; i<13; i++){          // 13 touch thresholds
    bluetooth.print(touchThreshold, DEC); 
    if(i<12) bluetooth.print(" ");
  }   
  bluetooth.print(";");
  
  bluetooth.print("RTHS: ");
  for(i=0; i<13; i++){          // 13 release thresholds
    bluetooth.print(releaseThreshold, DEC); 
    if(i<12) bluetooth.print(" ");
  }   
  bluetooth.print(";");
  
  bluetooth.print("FDAT: ");
  for(i=0; i<13; i++){          // 13 filtered values
    bluetooth.print(MPR121.getFilteredData(i), DEC);
    if(i<12) bluetooth.print(" ");
  } 
  bluetooth.print(";");
  
  bluetooth.print("BVAL: ");
  for(i=0; i<13; i++){          // 13 baseline values
    bluetooth.print(MPR121.getBaselineData(i), DEC);
    if(i<12) bluetooth.print(" ");
  } 
  bluetooth.print(";");
  
  // the trigger and threshold values refer to the difference between
  // the filtered data and the running baseline - see p13 of 
  // http://www.freescale.com/files/sensors/doc/data_sheet/MPR121.pdf
  
  bluetooth.print("DIFF: ");
  for(i=0; i<13; i++){          // 13 value pairs
    bluetooth.print(MPR121.getBaselineData(i)-MPR121.getFilteredData(i), DEC);
    if(i<12) bluetooth.print(" ");
  }           
  bluetooth.println();
}



