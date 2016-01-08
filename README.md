This is just scotchbox with a mod_vhost_alias rule to make it easy to run multiple sites on it

## Setting up a LAMP environment using Vagrant

1. Install virtualbox and vagrant
2. Create a folder to contain your shared server files e.g. `documents/server.dev`
3. Clone this repo into your server folder
4. If desired, open your Vagrantfile and change the IP address of your server. You may also change the memory and CPU allocation.
6. Open a command prompt, navigate to your server folder, and run the command `vagrant up` to provision your server.
7. To shut down the server, run the `vagrant halt` command.

## Adding new sites to your Vagrant server

1. Everything inside your server folder is shared with the machine's `var/www/` directory.
2. To add a new dev site, add a new folder to the root of your server directory. All of your public files should be added to a subdirectory called `httpdocs`
3. Update your hostfile. The domain name without the TLD should be the same as the folder of your new site. For example, if you have a site with public files in `VAGRANT_SERVER/mysite/httpdocs`, you can create a hostfile entry to point `mysite.dev` to your server's IP. You can use any TLD you want. When you visit `mysite.dev` the server will load the files in `/mysite/httpdocs/`.

## Recommended approach
- You can use this to create as many environments as you want, but make sure each environment has a unique IP (change the IP address in the Vagrantfile.) I am maintaining three separate environments for the three major platforms we build on.
- The advantage to this is if different platforms need different server configurations (or use different public folders by default) you can address this in `bootstrap.sh`.
- I use different TLDs to identify different environments. For example `.wp` for wordpress sites, `.mg` for magento sites.
- The process of adding new dev sites is greatly simplified by using Acrylic Dynamic DNS [http://mayakron.altervista.org/wikibase/show.php?id=AcrylicHome] if using Windows. This allows you to insert wildcards in your host entries. So, for example, you can have all \*.wp domains direct to your WordPress environment.
- Using the Acrylic method, to add a new site you just add a new folder to your root server folder with the name of the site and it should automatically be accessible from {foldername}.{TLD in Acrylic} when your server is running.