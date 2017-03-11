#!/bin/bash
docker run \
    --name cto \
    --rm -it \
    --cap-add=NET_ADMIN \
    --device /dev/net/tun:/dev/net/tun \
    -p 3000:3000 \
    -v $(pwd)/auth.txt:/opt/openvpn/auth.txt \
    -v $(pwd)/client.conf:/opt/openvpn/client.conf \
    -v $(pwd)/downloads:/opt/cloud-torrent/downloads \
    jpillora/cloud-torrent-openvpn
