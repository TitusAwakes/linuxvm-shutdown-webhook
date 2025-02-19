# linuxvm-shutdown-webhook

Set up webhook notifications when Linux machines turn on and shutdown. Useful when dealing with cloud instances such as AWS and you want to keep everything kernel-only.

# Setup 

Clone the repository:

```bash
git clone https://github.com/TitusAwakes/linuxvm-shutdown-webhook.git
cd linuxvm-shutdown-webhook
```

Copy the .service files to systemd:

```bash
sudo cp shutdown-notify.service /etc/systemd/system/
sudo cp boot-notify.service /etc/systemd/system/
```

Copy the script files and make them executable:

```bash
sudo cp shutdown_script.sh /your/desired/path/
sudo cp boot_script.sh /your/desired/path/
sudo chmod +x /your/desired/path/shutdown_script.sh
sudo chmod +x /your/desired/path/boot_script.sh
```

Remember to set up the correct webhook URLs.

Change the following line in boot-notify.service:

`ExecStart=/your/desired/path/boot_script.sh`

And on shutdown-notify.service:

`ExecStop=/your/desired/path/shutdown_script.sh`

Enable and start the services:

```bash
sudo systemctl enable boot-notify.service
sudo systemctl enable shutdown-notify.service
sudo systemctl start boot-notify.service
sudo systemctl start shutdown-notify.service
```
