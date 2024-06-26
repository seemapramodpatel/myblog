#!/bin/bash

# Check if pip3 is installed
if ! command -v pip3 &> /dev/null
then
    echo "pip3 not found. Installing..."
    apt-get update && apt-get install -y python3-pip
else
    echo "pip3 is installed."
    pip3 --version
fi

# Ensure Python and pip are installed
if ! command -v python3 &> /dev/null
then
    echo "Python3 not found. Installing..."
    apt-get update && apt-get install -y python3
fi

# Ensure correct version of Python is installed
if ! python3 --version | grep -q "Python 3.11.9"
then
    echo "Installing Python 3.11.9..."
    apt-get update && apt-get install -y python3.11
    ln -sf /usr/bin/python3.11 /usr/bin/python3
fi

# Install required Python packages
pip3 install -r requirements.txt

# Run your build script
python3 script.py
