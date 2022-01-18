# vpnInDocker
openvpn server in Docker container

You can use it in AWS or IDS


Usage:
connect to remote server
git clone https://github.com/Stamka/vpnInDocker

cd vpnInDocker
docker build .
docker run -it --privileged -p 31337:31337 <docker id from prev step>

# in container

iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE
openvpn --config ovpn-server.conf


# On your host 
openvpn --config ./cli_keys/stamka.conf


# You can generate your own keys and config using easyRSA
