#!/usr/bin/env bash

function InstallNode() {
    echo "Checking if Node is installed"
    if which node > /dev/null; then
        echo "Node has already been installed."
    else
        echo "Installing Node"
        if [ "$(uname)" == "Darwin" ]; then
            brew install node
        elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
            curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
            sudo apt-get install nodejs -y
            echo "Node has been installed."
        fi
    fi
}

function InstallWget() {
    echo "Checking if Wget is installed"
    if which wget > /dev/null; then 
        echo "Wget has already been installed"
    else
        echo "Installing Wget..."
        if [ "$(uname)" == "Darwin" ]; then
            brew install wget
        elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
            sudo apt-get install wget
        fi
        echo "Wget has been installed"
    fi
}

function InstallCurl() {
    echo "Checking if Curl is installed"
    if which curl > /dev/null; then
        echo "Curl has already been installed"
    else
        echo "Installing Curl ..."
        if [ "$(uname)" == "Darwin" ]; then
            brew install curl
        elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
            sudo apt install curl
        fi
        echo "Curl has been installed"
    fi
}

function WinInstallNode() { 
    echo "Checking if Node is installed"
    if where node > /dev/null; then
        echo "Node has already been installed."
    else
        echo "Installing Node"
        choco install nodejs
        echo "Node has been installed."
    fi
}

function WinInstallWget() { 
    echo "Checking if Wget is installed"
    if where wget > /dev/null; then
        echo "Node has already been installed."
    else
        echo "Installing Wget"
        choco install wget
        echo "Node has been installed."
    fi
}

function WinInstallCurl() { 
    echo "Checking if Curl is installed"
    if where curl /dev/null; then
        echo "Curl has already been installed."
    else
        echo "Installing Curl"
        choco install curl
        echo "Curl has been installed."
    fi
}

if [ "$(uname)" == "Darwin" ]; then
    echo 'Your system is a Mac Os'        
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo 'Your system is a Linux OS'
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    echo 'Your system is a Windows 32'
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    echo 'Your system is a Windows 64'
fi

if [ "$(uname)" == "Darwin" ] || [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    InstallNode
    InstallWget
    InstallCurl
else 
    if where choco /dev/null; then
        WinInstallNode
        WinInstallWget
        WinInstallCurl
    else 
        echo "You don't have Choco Installed please check the ReadMe file and install then run"
        exit
    fi
fi

echo 'Node, Wget, and Curl has been installed' 
