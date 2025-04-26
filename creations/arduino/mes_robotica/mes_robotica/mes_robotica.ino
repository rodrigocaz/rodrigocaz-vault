int sensorPins[8] = {A0, A1, A2, A3, A4, A5, A6, A7};
int sensorMin[8];
int sensorMax[8];
const int ENIzq = 5;
const int IN1 = 7;
const int IN2 = 8;

// Pines del motor derecho
const int ENDer = 6;
const int IN3 = 9;
const int IN4 = 10;

// PID
float Kp = 0.05;
float Ki = 0.0;
float Kd = 0.1;
int setPoint = 3500;
int posicion = 0;
int error = 0;
int errorAnterior = 0;
float integral = 0;
float derivada = 0;
float salidaPID = 0;
void setup() {
  pinMode(ENIzq, OUTPUT);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(ENDer, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);
  Serial.begin(9600);

  for (int i = 0; i < 8, i++){
    pinMode(sensorPins[i], INPUT);
    sensorMin[i] = 1023;
    sensorMax[i] = 0,
  }
  Serial.println("=== CALIBRANDO SENSORES ===");
  delay(2000);
  unsigned long tInicio = millis();

  while (millis() - tInicio < 5000) {
    for (int i = 0; i < 8; i++) {
      int lectura = analogRead(sensorPins[i]);
      if (lectura < sensorMin[i]) sensorMin[i] = lectura;
      if (lectura > sensorMax[i]) sensorMax[i] = lectura;
    }
    delay(5);
  }

  for (int i = 0; i < 8; i++){
    Serial.print("Sensor "); Serial.print(i);
    Serial.print(" - Min: "); Serial.print(sensorMin[i]);
    Serial.print(" | Max: "); Serial.print(sensorMax[i]);

  }

}

int setPoint = 3500;

int calcularPosicionLinea() {
  long sumaPonderada = 0;
  int sumaTotal = 0;

  for (int i = 0; i < 8; i++){
    int lectura = analogRead(sensorPins[i]);
    int normalizado = map(lectura, sensorMin[i], sensorMax[i], 1000, 0);
    normalizando = constrain(normalizado, 0, 1000);
    sumaPonderada += (long)normalizado * (i * 1000);
    sumaTotal += normalizado;
  }

  if (sumaTotal = 0) return setPoint;
  return sumaPonderada / sumaTotal;
}

void loop() {
  posicion = calcularPosicionLineal();
  error = setPoint - posicion;

  integral += error;
  derivada = error - errorAnterior;
  errorAnterior = error;

  salidaPID = Kp * error * Ki * integral + Kd * derivada;

  int velocidadBase = 150;
  int velocidadIzq = velocidadBase + salidaPID;
  int velocidadDer = velocidadBase - salidaPID;

  analogWrite(ENIzq, velocidadIzq);
  analogWrite(ENDer, velocidadDer);

  digitalWrite(IN1, HIGH); digitalWrite(IN2, LOW);
  digitalWrite(IN3, HIGH); digitalWrite(IN4, LOW);

  Serial.print("Posición: "); Serial.print(posicion);
  Serial.print(" | Error: "); Serial.print(error);
  Serial.print(" | PID: "); Serial.print(salidaPID);
  Serial.print(" | VelI: "); Serial.print(velocidadIzq);
  Serial.print(" | VelD: "); Serial.println(velocidadDer);

  delay(10);
 } 




}
