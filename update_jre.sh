#!/bin/bash

if [ $# -lt 1 ]
then
    echo "usage $0 PATH_TO_TAR_FILE [INSTALL_PATH]"
    exit
fi

TAR_FILE=$1

if [ ! -r $TAR_FILE ]
then
    echo -e "Missing $TAR_FILE \n"
    exit
fi


TAR_PATH="/opt/java/64"
[ -n "$2"  ] && TAR_PATH=$2

if [ ! -d $TAR_PATH ]
then
    echo -e "Oh-oh, I expected $TAR_PATH to exist...\n"
    exit
fi

echo "Extracting... "
sudo tar -xf "$TAR_FILE" --directory "$TAR_PATH"

VERSION=`basename $TAR_FILE | sed 's/jre-\(.*\)-linux-x64.*$/\1/'`
MAJOR=`echo $VERSION | sed 's|\([0-9]\+\)u.*$|\1|'`
MINOR=`echo $VERSION | sed 's|^.*u\([0-9]\+\)|\1|'`

JRE_PATH="$TAR_PATH/jre1.$MAJOR.0_$MINOR"
TARGET="$JRE_PATH/bin/java"

if [ ! -f $TARGET ] 
then
    echo -e "Oh-oh, I expected $TARGET to exist...\n"
    exit
fi

echo "Switching... "
sudo update-alternatives --install /usr/bin/java java $TARGET 1
sudo update-alternatives --set java $TARGET

java -version


echo "Firefox plug-in..."

rm ~/.mozilla/plugins/libnjp2.so
ln -s $JRE_PATH/lib/amd64/libnpjp2.so ~/.mozilla/plugins/libnjp2.so
