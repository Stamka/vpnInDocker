# vpnInDocker
openvpn server in Docker container

You can use it in AWS or IDS


Usage:
connect to remote server

__git clone https://github.com/Stamka/vpnInDocker__

__cd vpnInDocker__

__docker build .__

__docker run -it --privileged -p 31337:31337 \<docker id from prev step\>__

--in container

__iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE__
  
  
__openvpn --config ovpn-server.conf__


-- On your host 
  
__openvpn --config ./cli_keys/stamka.conf__


-- You can generate your own keys and config using easyRSA
