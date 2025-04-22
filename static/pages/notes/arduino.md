# Arduino

## Reset and Restore after misconfiguration before upload attempt that bricked pro micro

https://www.shellhacks.com/arduino-pro-micro-reset-restore-bootloader/

## Arduino setup from scratch

Install `libyaml libserialport python-pyserial arduino-cli arduino-builder` from the official Arch repositories.

Install `arduino-mk-git` from the AUR.

Clone the [repo](https://github.com/sudar/Arduino-Makefile) locally

Set some config env vars by running the following script every time before starting developing on the current project:

```sh
#!/bin/sh
export ARDUINO_DIR=/home/raffaele/Arduino/arduino-1.0.5
export ARDMK_DIR=$(pwd)/Arduino-Makefile
export AVR_TOOLS_DIR=/usr
```

At this point the main makefile is installed globally, but another makefile must be created in the current project folder (for project-specific settings).

Write the following into the project-specific `Makefile`:

```
BOARD_TAG     = SparkFun Pro Micro
MONITOR_PORT  = /dev/tty0
ARDUINO_LIBS  = Keyboard
ALTERNATE_CORE_PATH = $(ARDUINO_SKETCHBOOK)/hardware/sparkfun/samd
```

Then, create the arduino sketch.

Connect the device to the pc.

Check if the device is recognized with `ls -l /dev/ | grep tty`.

To build the sketch: `make`

To check the serial output: `make monitor`

To upload the compiled sketch: `make upload`

### Sources

- https://hardwarefun.com/tutorials/compiling-arduino-sketches-using-makefile
- https://www.shellhacks.com/arduino-pro-micro-board-selection/
- https://blog.robertelder.org/arduino-make-file-command-line/ (?)
