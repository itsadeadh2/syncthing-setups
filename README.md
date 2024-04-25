# Itsadead's Syncthing Setups

[![Deploy to Amazon ECS](https://github.com/itsadeadh2/syncthing-setups/actions/workflows/deploy.yml/badge.svg)](https://github.com/itsadeadh2/syncthing-setups/actions/workflows/deploy.yml)

Collection of [syncthing](https://syncthing.net/) setups that I use to sync my save states between my retro devices.

---

### Disclaimers
- **Be sure you understand how syncthing works before using it with your devices, if you mess up you can lose data!**
- I do not **maintain** or **own** any of the actual projects in here. This is just a repo with some instructions and convenience scripts that I created to make the syncthing setup easier.

### What is syncthing?
Syncthing is a continuous file synchronization program. It synchronizes files between two or more computers in real time, safely protected from prying eyes. Your data is your data alone and you deserve to choose where it is stored, whether it is shared with some third party, and how it’s transmitted over the internet.   
_(Taken from https://syncthing.net/)_

## Setups
- [AWS](setups/aws/README.md)
- [ArkOs](setups/arkos/README.md)
- [Batocera](setups/batocera/README.md)
- [EmuELEC](setups/emuelec/README.md)
- [Docker (locally)](https://hub.docker.com/r/linuxserver/syncthing)

## Credits
This project is just a configuration layer to make setting things up easy, if you want to see where the heavy lifting actually happens checkout these projects:
- [Syncthing](https://syncthing.net/)
- [linuxserver/syncthing](https://github.com/linuxserver/docker-syncthing)
- [ArkOs](https://github.com/christianhaitian/arkos)
- [Batocera]()
- [EmuELEC]()