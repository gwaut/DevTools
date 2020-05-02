```bash
git clone https://github.com/kliment/Printrun.git 
```
--> Follow instructions in README.

For Ubuntu: 
```bash
sudo apt install python3-serial python3-numpy cython3 python3-libxml2 python3-gi python3-dbus python3-psutil python3-cairosvg libpython3-dev python3-appdirs python3-wxgtk4.0
```

### Problems:
Permission denied: '/dev/ttyUSB0'
```bash
ls -l /dev/ttyUSB0
crw-rw---- 1 root dialout 188, 0 apr 29 19:20 /dev/ttyUSB0

sudo usermod -a -G dialout ${USER}
```
--> logout / login 

