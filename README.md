# openvpn client

Thereis simple usage:

    docker network create --driver=bridge --subnet=172.28.0.0/24 test_vpn
    docker run -v /etc/openvpn:/etc/openvpn --name ovpn_client --privileged --rm --network=test_vpn --ip=172.28.0.2 -e OPENVPN_SERVER=ru01.secretvpn.net romantix74/openvpn_client

On main system you should route you traffic. For example for ifconfig.me
    ip route add 216.239.0.0/16 via 172.28.0.2
    curl ifconfig.me

Available on [Docker Hub](https://hub.docker.com/r/romantix74/openvpn_client).

## Run from docker-compose [github](https://github.com/romantix74/openvpn_client/blob/master/docker-compose.yml)

Insert remote openvpn server using env variable:
    $OPENVPN_SERVER=ca02.secretvpn.net

