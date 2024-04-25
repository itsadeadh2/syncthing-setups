# EmuELEC Setup #

This is a setup guide for setting up syncthing for [EmuELEC](https://github.com/EmuELEC/EmuELEC).

### Pre-requisites
- EmuELEC installed on a compatible device
- Wifi or ethernet connection properly configured and working in EmuELEC

### Steps
1. Connect to emuelec using SSH (user is `root`, password is `emuelec`)
2. Install syncthing: `curl -sL https://gist.githubusercontent.com/itsadeadh2/06bc0d6d3c5a8f013941027ac5cdcf6b/raw/e517212485573d5e925038f94ca344de46003e03/install_syncthing_emuelec.sh | sh`
    * This is a custom bash script that I've created. It is going to install syncthing and create a systemd service to make sure it initializes with the system.

After that, syncthing gui should be available at your host machine under your arkos device ip followed by the port 8443.  
E.g: `192.168.100.85:8443`  

**And that's it, you now have a syncthing instance running on your device that is ready to included in other instances.**

### Syncing states
> This is my personal configuration, use it at your own risk.

EmuELEC saves the states in the `/storage/roms/savestates` folder so if you want to sync them, you have to create a syncthing folder that watches that. Here's how you'd set it up:

1. Go to the syncthing gui and click on the **Add Folder** option
2. Configure your folder like this: ![1](imgs/1.png)
    * You can change **Folder ID** and **Folder Label** as you'd like, but keep **Folder Path** as `/storage/roms/savestates`    
3. Click on save
4. Now, click on you newly created folder 
5. Go to the **Ignore Patterns** option and set the following: ![2](imgs/2.png)
    * This will make it so that any file that is not a `.state` file is ignored
    * We add a specific entry for `.png` files because emuelec does save them every time you save a state
6. Click on **Save**