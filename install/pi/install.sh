# Script to install everything needed for donkeycar except the donkeycar library
sudo apt-get install pip3-python -y

#standard updates (5 min)
sudo apt update -y
sudo apt upgrade -y
sudo rpi-update -y

#helpful libraries (2 min)
sudo apt install build-essential python3-dev python3-distlib python3-setuptools  python3-pip python3-wheel -y

sudo apt-get install git cmake pkg-config -y
sudo apt-get install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev -y
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
sudo apt-get install libxvidcore-dev libx264-dev -y
sudo apt-get install libatlas-base-dev gfortran -y

sudo apt install libzmq-dev -y
sudo apt install xsel xclip -y
sudo apt install python3-h5py -y

#install numpy and pandas (3 min)
sudo apt install libxml2-dev python3-lxml -y
sudo apt install libxslt-dev -y

#remove python2 (1 min)
sudo apt-get remove python2.7 -y
sudo apt-get autoremove -y

#install redis-server (1 min)
sudo apt install redis-server -y

#create a python virtualenv (2 min)
sudo apt install virtualenv -y
virtualenv ~/env --system-site-packages --python python3
echo '#start env' >> ~/.bashrc
echo 'source ~/env/bin/activate' >> ~/.bashrc
source ~/env/bin/activate


#make sure the virtual environment is active
source ~/env/bin/activate

# install pandas and numpy
pip install pandas #also installs numpy


pip install tensorflow==1.9

#setup Wifi Hotspot
sudo apt-get install hostapd -y
sudo apt-get install dnsmasq -y
sudo systemctl disable hostapd
sudo systemctl disable dnsmasq
cp hostapd.conf /etc/hostapd/hostapd.conf
sed -i 's/\#DAEMON_CONF=""/DAEMON_CONF="\/etc\/hostapd\/hostapd.conf"/g' /etc/default/hostapd
sed -i 's/DAEMON_OPTS=""/#DAEMON_OPTS=""/g' /etc/default/hostapd


cat dnsmasq.conf >> /etc/dnsmasq.conf
cp /etc/network/interfaces /etc/network/interfaces.backup
cp interfaces /etc/network/interfaces

#IP forwarding
sed -i 's/\#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
echo "nohook wpa_supplicant" >> /etc/dhcpcd.conf

#setup service
sudo cp autohotspot.service /etc/systemd/system/autohotspot.service
sudo systemctl enable autohotspot.service

#uncomment to upgrade IW (not present in some old installations)
#sudo apt-get install iw

#Autohotspot Script
sudo cp autohotspotN /usr/bin/autohotspotN
sudo chmod +x /usr/bin/autohotspotN

#setup Donkeycar
cd ../..
sudo pip3 install -e .
donkey createcar ~/mycar

#setup Tornado Server

