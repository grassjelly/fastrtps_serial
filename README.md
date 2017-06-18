### Running the demo
1. Upload fake data to uC. This package is configured to work on an Arduino Uno by default. You can change it at testserial/platformio.ini
    ```sh
    $ cd testserial
    $ platformio run --target upload
    ```
2. Compile the DDS app.
    ```sh
    $ ./compile.sh
    ```
3. Running the serial parser and publisher.
    ```sh
    $ ./build/app publisher
    ```
4. Run the subscriber.
    ```sh
    $ ./build/app subscriber
    ```
5. Check if the data is received. The subscriber must receive "Hello from uC".

### Reference

Serial Library from: https://github.com/wjwwood/serial
