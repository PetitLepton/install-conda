#!/bin/bash

SYSTEM=$(uname -s)

if [ $SYSTEM = "Linux" ]; then
    export PLATFORM="Linux"
elif [ $SYSTEM = "Darwin" ]; then
    export PLATFORM="MacOSX"
else
    echo "The system is not supported."
fi

# Download miniconda
MINICONDA="Miniconda3-latest-"$PLATFORM"-x86_64.sh"
wget -P /tmp https://repo.continuum.io/miniconda/$MINICONDA
chmod u+x /tmp/$MINICONDA

# Install conda
MINICONDA_DIR=$HOME/miniconda3 # default
if [ -d $MINICONDA_DIR ]; then
    /tmp/$MINICONDA -u -b -p $MINICONDA_DIR
else
    /tmp/$MINICONDA -b -p $MINICONDA_DIR
fi

# Add conda to the PATH
[ ! -d "$HOME/bin" ] && mkdir $HOME/bin
ln -s $MINICONDA_DIR/bin/conda $HOME/bin/conda
