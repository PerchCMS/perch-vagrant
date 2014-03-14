perch-vagrant
=============

Vagrant box for Perch sites

You need VirtualBox and Vagrant installed.

Git Clone this box.

Edit the Vagrantfile, set the webroot to be the folder in which individual site folders live. This will be mapped to /var/www on the guest

Use an IP address not on your network. You will need to edit your hosts file or other internal DNS to map site URLs to that IP address.

The rest of your config happens via Hiera. In puppet/manifests/hiera/config.yaml you can set up some sites, databases and specify PHP.ini values.

Put your site folders into the folder you specified in the Vagrantfile and set the docroot as /var/www/foldername

Save the config, run vagrant up.