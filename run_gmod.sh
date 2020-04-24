#!/bin/sh
installGmod(){
    mkdir /steam/cmd -p \
    && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar -C /steam/cmd -zxf - \
    && chmod +x /steam/cmd/steamcmd.sh \
    && /steam/cmd/steamcmd.sh +login anonymous +force_install_dir /steam/cstrike +app_update 232330 validate +force_install_dir /steam/gmod +app_update 4020 validate +quit \
    && echo '"mountcfg"{"cstrike" "/steam/cstrike"}' >> /steam/gmod/garrysmod/cfg/mount.cfg echo '/usr/bin/python3.5 -m $MODULE_NAME $@' > /run_module.sh
}

runGmod(){
    /steam/gmod/srcds_run -game garrysmod -nohltv -norestart +port $port +gamemode $gamemode -maxplayers $maxplayers +map $map
}


if  [ ! -f "/steam/gmod/srcds_run" ]; then
    installGmod
fi
runGmod

