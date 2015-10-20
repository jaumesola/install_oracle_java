Script for fast installing ORACLE Java JDK on Ubuntu Linux (and hopefully other "deb like" systems)
--------------------------

### Use

```
sudo su
./install_java.sh PATH_TO_JDK_TAR_FILE [INSTALL_PATH]
```

##### Example
```
sudo su
./install_java.sh /home/jean/Downloads/jdk-8u65-linux-x64.tar.gz
```

The default installation path is ```/usr/local/java```.

This script is still not definite and works at the moment. If Oracle
significantly changes something I will probably fix the script. :)

The whole thing is taken and converted into this script from here: http://www.wikihow.com/Install-Oracle-Java-on-Ubuntu-Linux

The script was tested only on Kubuntu 14.04.3 LTS but should work on other "deb like" systems as well.
