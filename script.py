from sys import platform
from shutil import which
import subprocess

def install_node():
    print("Checking if Node is installed")
    if which("node") is not None:
        print("Node has already been installed.")
    else:
        print("Installing Node")
        if platform == "linux" or platform == "linux2":
            subprocess.run(["sudo", "apt", "install", 'nodejs', "-y"], check=True)
            print("Node has been installed.")
        elif platform == "darwin":
            subprocess.run(["brew", "install", "node"], check=True)
            print("Node has been installed.")
        elif platform == "win32" or "win64" or "cygwin":
            subprocess.run(["choco", "install", "node"], check=True)
            print("Node has been installed.")
        else:
            print("Can't idetify system")

def install_wget():
    print("Checking if Wget is installed")
    if which("wget") is not None:
        print("Wget has already been installed.")
    else:
        print("Installing Wget")
        if platform == "linux" or platform == "linux2":
            subprocess.run(["sudo", "apt-get", "install", "wget",], check=True)
            print("Wget has been installed.")
        elif platform == "darwin":
            subprocess.run(["brew", "install", "wget"], check=True)
            print("Wget has been installed.")
        elif platform == "win32" or "win64" or "cygwin":
            subprocess.run(["choco", "install", "wget"], check=True)
            print("Wget has been installed.")
        else:
            print("Can't idetify system")

def install_curl():
    print("Checking if Curl is installed")
    if which("curl") is not None:
        print("Curl has already been installed.")
    else:
        print("Installing Curl")
        if platform == "linux" or platform == "linux2":
            subprocess.run(["sudo", "apt-get", "install", "curl",], check=True)
            print("Curl has been installed.")
        elif platform == "darwin":
            subprocess.run(["brew", "install", "curl"], check=True)
            print("Wget has been installed.")
        elif platform == "win32" or "win64" or "cygwin":
            subprocess.run(["choco", "install", "curl"], check=True)
            print("Curl has been installed.")
        else:
            print("Can't idetify system")


if platform == "linux" or platform == "linux2":
    print('Your system is a Linux OS')
elif platform == "darwin":
    print('Your system is a Mac OS')
elif platform == "win32" or "win64" or "cygwin":
    print('Your system is a Windows OS')
else:
    print("Can't idetify system")

install_node()
install_wget()
install_curl()
print('Node, Wget, and Curl has been installed' )