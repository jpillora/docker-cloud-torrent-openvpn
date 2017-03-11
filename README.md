# docker-cloud-torrent-openvpn

[cloud-torrent](https://github.com/jpillora/cloud-torrent) + openvpn

[![Docker Pulls](https://img.shields.io/docker/pulls/jpillora/cloud-torrent-openvpn.svg)][dockerhub]
[![Image Size](https://images.microbadger.com/badges/image/jpillora/cloud-torrent-openvpn.svg)][dockerhub]

[dockerhub]: https://hub.docker.com/r/jpillora/cloud-torrent-openvpn/

### Usage

1. Place your OpenVPN client configuration in `client.conf` 
1. *Optionally*, add the configuration line: `auth-user-pass /opt/openvpn/auth.txt` and place your OpenVPN authentication details in `auth.txt`
1. Run the container with:

    ```sh
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
    ```

1. Confirm everything works (the logs should say `Initialization Sequence Completed`) and your public IP should have changed (`docker exec cto wget -qO- canihazip.com/s`)
1. Re-run the above with `--rm -it` swapped for `-d --restart always`

### Extras

* To start `cloud-torrent` with custom command-line options, create a script like [scripts/cloud-torrent.sh](scripts/cloud-torrent.sh) and mount it with: `-v $(pwd)/cloud-torrent.sh:/opt/scripts/cloud-torrent.sh`

#### MIT License

Copyright &copy; 2017 Jaime Pillora &lt;dev@jpillora.com&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
