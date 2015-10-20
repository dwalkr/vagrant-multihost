## Setting up a LAMP environment using Vagrant

1. Install virtualbox and vagrant
2. Create a folder to contain your shared server files e.g. `documents/server.dev`
3. Clone this repo into your server folder
4. Open bootstrap.sh in a text editor and change the PASSWORD variable. You may optionally change the TLD variable. I recommend using a non-recognized TLD, as you will be overriding DNS by sending domains on that TLD to your local server.
5. If desired or deemed necessary, open your Vagrantfile and change the IP address of your server. You may also change the memory and CPU allocation if desired.
6. Open a command prompt, navigate to your server folder, and run the command `vagrant up` to provision your server.
7. To shut down the server, run the `vagrant halt` command.

## Adding new sites to your Vagrant server

1. Everything in the `/vhosts` directory inside your server folder is shared with the machine's `var/www/vhosts` directory.
2. To add a new dev site, add a folder to the `vhosts` directory. All of your public files should be added to a subdirectory called `httpdocs`
3. Update your Windows hosts file to point `{folder}`.`{TLD}` to the server's IP. For example, if you use the default TLD of `.dev` and your dev site is in `/mysite/httpdocs` then your hosts entry will be `mysite.dev XXX.XXX.XXX.XXX`
*NOTE: you can use a service like Acrylic [http://mayakron.altervista.org/wikibase/show.php?id=AcrylicHome] to insert a wildcard subdomain so you only have to do this once