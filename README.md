# pentaxK7Shutter

## A pentax K7 ibrid shutter that resolve pktriggercord-cli issues

### I created this project because some issuet foun with pktriggercord-cli with my Pentax K7.
### When i use the pktriggercord-cli program to donload and delete images from memory sometimes it hang the camera, and sometimes insert strange colors in downloaded files.
### Other commands do not create problems.
### So I decidet to use an hibryd system, that setup camera parameters with pktriggercord-cli, but take the picture with the wired remote shutter to the SD, then download the images from the usb drive, not using pktriggercord-cli.
### To do so, I need an automatic way to disconnect and disconnect usb from K7 to PC.
### I used usb to serial converter ch341 pin RTS connected to the usb +5V of the camera.
### Putting it at HIGH / +5V the camera is connected to PC as usb drive.
### Putting it at LOW / GND set the camera in normal state.
### I connected also the DTR pin to a resistor and a 2N2222 transistor conneted to the remote shoter connector.
### Putting it at HIGH / 5V take the picture.
### Putting it LOW / GND set the camera in normal state.

## Schematic
![schematic](img/schematics.jpg)

## The shutter
![image](img/accrocchio.jpg)
