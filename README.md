# minecraft-server-scripts
A collection of scripts to run a set of minecraft servers.

Each minecraft server has a directory in `$HOME/servers` that includes the server jar and all other server files.

`install.sh` links the scripts into `$HOME/bin`
```
@reboot
 \_ on_startup
     \_ start_all_servers
     |   \_ start_server
     :   :
     |   \_ start_server
     \_ upload_all_backups

0 4 * * *
 \_ reboot
     \_ announce_restart_all
     |   \_ announce_restart
     :   :
     |   \_ announce_restart
     \_ stop_all_servers
     |   \_ stop_server
     :   :
     |   \_ stop_server
     \_ backup_all_servers
     |   \_ backup_server
     :   :
     |   \_ backup_server
     \_ shutdown
```

`uninstall.sh` removes the links from `$HOME/bin`
