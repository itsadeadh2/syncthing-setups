# ArkOS Setup #

This is a setup guide for setting up syncthing for [ArkOS](https://github.com/christianhaitian/arkos).

### Pre-requisites
- Arkos Installed on a compatible device
- Wifi or ethernet connection properly configured and working on arkos ([see how](https://github.com/christianhaitian/arkos/wiki/Frequently-Asked-Questions---RG351V#q-how-do-i-configure-my-wifi-connection-in-arkos))

### Install
1. Connect to your device using SSH ([see how](https://github.com/christianhaitian/arkos/wiki/Frequently-Asked-Questions---RG351V#q-how-do-i-ssh-into-arkos))
2. Run installation script:   
   ```bash
   curl -fsSL https://github.com/itsadeadh2/syncthing-setups/raw/HEAD/bin/arkos_install.sh | sudo bash
   ```

After that, syncthing gui should be available at your host machine under your arkos device ip followed by the port 8443.  
E.g: `192.168.100.85:8443`  

**And that's it, you now have a syncthing instance running on your device that is ready to included in other instances.**
### Syncing states
> This is my personal configuration, use it at your own risk.

ArkOS [saves the states in the ROMS folder](https://github.com/christianhaitian/arkos/wiki/Frequently-Asked-Questions---RG351V#q-where-are-game-saves-and-savestates-stored) so if you want to sync them, you have to create a syncthing folder that watches that. Here's how you'd set it up:

1. Go to the syncthing gui and click on the **Add Folder** option
2. Configure your folder like this: ![2](imgs/2.png)
    * You can change **Folder ID** and **Folder Label** as you'd like, but keep **Folder Path** as `/roms`
    * If you are using a two-card setup, then **Folder Path** should be **/roms2**
3. Click on save
4. Now, click on you newly created folder and:
    * If you already have a lot of roms, you can click on **Pause** to stop the verification process to save you some time
    * then click on the **Edit** option
5. Go to the **Ignore Patterns** option and set the following: ![3](imgs/3.png)
    * This will make it so that any file that is not a `.state` file is ignored
6. Click on **Save**

Now your syncthing instance is watching and syncing your states with any other instances that have this folder shared with them.

### Useful resources
- [Syncthing docs](https://docs.syncthing.net/)
- [Patterns to ignore files in syncthing folders](https://docs.syncthing.net/v1.27.5/users/ignoring)

