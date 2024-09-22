# minecraft-server-scripts
A collection of scripts to run a set of minecraft servers

@reboot
 \_ on_startup.sh
     \_ start_all_servers.sh
     |   \_ start_server.sh
     :   :
     |   \_ start_server.sh
     \_ upload_all_backups.sh

0 4 * * *
 \_ reboot.sh
     \_ announce_restart_all.sh
     |   \_ announce_restart.sh
     :   :
     |   \_ announce_restart.sh
     \_ stop_all_servers.sh
     |   \_ stop_server.sh
     :   :
     |   \_ stop_server.sh
     \_ backup_all_servers.sh
     |   \_ backup_server.sh
     :   :
     |   \_ backup_server.sh
     \_ shutdown

