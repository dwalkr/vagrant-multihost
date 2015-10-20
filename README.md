## Setting up a LAMP environment using Vagrant

1. Install latest stable ver. of VirtualBox
2. Install latest stable ver. of Vagrant
3. Ensure hardware virtualization is enabled in BIOS
4. Create a folder on your machine to hold your server info
5. Clone this repo into that folder
6. If desired, open bootstrap.sh and change values of PASSWORD and HOSTNAME variables 
7. If desired (or if you are adding additional Vagrant servers), change the IP address of the server in the Vagrantfile
8. Open command prompt, navigate to server folder and run `vagrant up` to create and provision the VM.
9. The initial vagrant up will take some time; subsequent runs will be much faster
10. To shut down the server, type `vagrant halt` in the command prompt.


## Adding new sites to your Vagrant server

1. Everything in the `/vhosts` directory inside your server folder is shared with the machine's `var/www/vhosts` directory.
2. To add a new dev site, add a folder to the `vhosts` directory. All of your public files should be added to a subdirectory called `httpdocs`
3. Update your Windows hosts file to point {folder}.{hostname} to the server's IP. For example, if you use the default hostname of `srv.dev` and your dev site is in `/mysite/httpdocs` then your hosts entry will be `mysite.srv.dev XXX.XXX.XXX.XXX`
*NOTE: you can use a service like Acrylic http://mayakron.altervista.org/wikibase/show.php?id=AcrylicHome to insert a wildcard subdomain so you only have to do this once