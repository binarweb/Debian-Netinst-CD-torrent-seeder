### Debian Netinst CD torrent seeder

This script will download and seed a Debian CD image with [BitTorrent](https://en.wikipedia.org/wiki/BitTorrent) (communication protocol) by using [webtorrent-cli](https://www.npmjs.com/package/webtorrent-cli).  
The download location is the `/tmp` folder (using [tmpfs](https://www.kernel.org/doc/html/latest/filesystems/tmpfs.html) file system).

#### Requirements

- NodeJS
- NPM

```bash
sudo apt update
sudo apt install nodejs npm -y
```