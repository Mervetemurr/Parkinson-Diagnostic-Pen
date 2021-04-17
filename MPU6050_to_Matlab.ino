#include "Wire.h"
#include "I2Cdev.h"
#include "MPU6050.h"
#include "SoftwareSerial.h"

MPU6050 mpu;

int16_t ax, ay, az;
int16_t gx, gy, gz;


long val, val2,val3;
long prevVal;
int buton=2;
int yesil=5;
int kirmizi=6;
int butondurum=0;
void setup() 
{
    Wire.begin();
    Serial.begin(115200);
    mpu.initialize();
    pinMode(buton,INPUT_PULLUP);
    pinMode(yesil,OUTPUT);
    pinMode(kirmizi,OUTPUT);
}

void loop() 
{
  butondurum=digitalRead(buton);
  if(butondurum==0){
    digitalWrite(yesil, 0);
    digitalWrite(kirmizi, 1);
    mpu.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);
    val = map(ax, -17000, 17000, -500, 500);
    val2 = map(ay, -17000, 17000, -500, 500);
    val3 = map(az, -17000, 17000, -500, 500);
    Serial.println(val);
    delay(50);
    Serial.println(val2);
    delay(50);
    Serial.println(val3);
    delay(50);
}
 else{
  digitalWrite(yesil, 1);
  digitalWrite(kirmizi, 0);
  }
}
