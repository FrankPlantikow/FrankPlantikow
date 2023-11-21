const int ledPin = LED_BUILTIN;  // Ändere dies auf den entsprechenden Pin deines ESP-Bausteins
const int dotDuration = 200;  // Die Dauer einer Punkt-Zeiteinheit in Millisekunden

void setup() {
  pinMode(ledPin, OUTPUT);
}
void blink(int count, bool isDash = false) {
  for (int i = 0; i < count; ++i) {
    digitalWrite(ledPin, HIGH);
    delay(isDash ? dotDuration * 3 : dotDuration);
    digitalWrite(ledPin, LOW);
    delay(dotDuration);
  }
}

void delayBetweenLetters() {
  delay(dotDuration * 2);
}

void delayBetweenWords() {
  delay(dotDuration * 6);
}

void loop() {
  // Buchstabe 'S' im Morsecode: "..."; blinkt drei kurze Blitze
  blink(3);
  // Pause zwischen den Buchstaben
  delayBetweenLetters();

  // Buchstabe 'O' im Morsecode: "---"; blinkt drei lange Blitze
  blink(3, true);
  // Pause zwischen den Buchstaben
  delayBetweenLetters();

  // Buchstabe 'S' im Morsecode: "..."; blinkt drei kurze Blitze
  blink(3);
  // Pause zwischen den Wörtern
  delayBetweenWords();
}

