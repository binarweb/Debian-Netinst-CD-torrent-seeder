### Debian Netinst CD torrent seeder

This script will download and seed a Debian CD image with [BitTorrent](https://en.wikipedia.org/wiki/BitTorrent) (communication protocol) by using [webtorrent-cli](https://www.npmjs.com/package/webtorrent-cli) NodeJS package.  
The download location is the `/tmp` folder. By using the [tmpfs](https://www.kernel.org/doc/html/latest/filesystems/tmpfs.html) file system, it strives for performance and no HDD/SSD wear.  

#### Requirements

- NodeJS
- NPM

```bash
sudo apt update
sudo apt install nodejs npm -y
```

#### Installation

```bash
git clone --depth 1 https://github.com/binarweb/Debian-Netinst-CD-torrent-seeder/blob/master/debian-netinstaller-cd-torrent-seeder.sh
cd debian-netinstaller-cd-torrent-seeder
chmod u+x debian-netinstaller-cd-torrent-seeder.sh
```

#### Configuration

Edit the `debian-netinstaller-cd-torrent-seeder.sh` file and change `TORRENT_URL` to match the latest version of Debian Netinst CD available at [https://www.debian.org/CD/torrent-cd/](https://www.debian.org/CD/torrent-cd/).  

#### Running

```bash
./debian-netinstaller-cd-torrent-seeder.sh
```
