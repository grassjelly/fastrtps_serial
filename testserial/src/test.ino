void setup() {
    Serial.begin(115200);
}

void loop() {
    while(Serial.available()) {
        //wait for call
        if(Serial.read() == '+'){
            //send the response
            Serial.println("Hello from uC");
        }
    }
}
