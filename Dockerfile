FROM debian




WORKDIR /etc/openvpn    
RUN mkdir /etc/openvpn/ccd/; \
    apt-get update; \
    apt-get install -y openvpn easy-rsa net-tools iptables tcpdump nano

# Move serv keys into container 
COPY ./serv_keys/* /etc/openvpn/
#Move user's cfg into container
COPY ./cli_keys/* /etc/openvpn/ccd/


#Turn on forwarding and set iptables rules
RUN echo "net.ipv4.ip_forward = 1" > /etc/sysctl.conf
RUN iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE
#RUN 

# make default work dir 
WORKDIR /etc/openvpn
