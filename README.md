# minecraft-server-scripts
A collection of scripts to run a set of minecraft servers.

Each minecraft server has a directory in `$HOME/servers` that includes the server jar and all other server files.

`install.sh` links the scripts into `$HOME/.local/bin`
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

`uninstall.sh` removes the links from `$HOME/.local/bin`

Problem: Can't shutdown with message 'Failed to connect to bus: no such file or directory'
Solution: `sudo service systemd-logind start`
Also run `sudo service systemd-logind status` and `sudo service dbus status`

Problem: Servers are running but client stuck on connecting.
Cause: Firewall is not running. Check that `sudo firewall-cmd --state` returns "not running", or `sudo systemctl status firewalld` indicates the firewall is down.
Solution: `sudo systemctl start firewalld`, and `sudo systemctl enable firewalld`
Run `sudo firewall-cmd --list-ports` to check that the firewall is back up
