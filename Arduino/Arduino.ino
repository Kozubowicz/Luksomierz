int w1 = 0,w2 = 0,w3 = 0,w4  = 0;
float napiecie = 0;
int typ;
void setup() {
  pinMode(2, INPUT_PULLUP);
  pinMode(11, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);
  pinMode(5, INPUT_PULLUP);
  Serial.begin(9600);
  typ=1;
}

void loop() {
  int b3 = digitalRead(3);
  int b4 = digitalRead(4);
  int b5 = digitalRead(5);
  if (b3 == LOW) {
    typ = 1;
    }
  if (b4 == LOW) {
    typ = 2;
    }
  if (b5 == LOW) {
    typ = 3;
    }
  
  int b2 = digitalRead(11);
  int b1 = digitalRead(2);
  if (b1 == LOW) {
    w1 = analogRead(A0);
    delay(100); 
    w2 = analogRead(A1);
    delay(100); 
    w3 = analogRead(A2);
    delay(100); 
    w4 = analogRead(A3);
    delay(100); 
    napiecie = (w1+w2+w3+w4) * (5.0/1024.0) / 4;
    Serial.print('%');
    Serial.println(typ);
    Serial.println(napiecie);
  }
  else if (b2 == LOW) {
   Serial.println('&');
 }
  else
  {
    delay(50);
    Serial.println('#');
   }
  
}
