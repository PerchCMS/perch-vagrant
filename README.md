perch-vagrant
=============

A simple packaged Vagrant environment for [Perch](http://grabaperch.com) sites. Not really Perch specific - it just sets up a simple LAMP environment and allows you to run multiple sites from one VM, rather than needing to run multiple VMs.

Uses hiera for the configuration so you just need to edit the Vagrantfile to get it running and then set up your sites in heira. No Puppet knowledge needed.

I built this on a Mac, it uses nfs which gets ignored on Windows. If you are running Vagrant on Windows, it blows up and you know why, send a pull request!

## To run this

You need [VirtualBox](https://www.virtualbox.org/) and [Vagrant](http://www.vagrantup.com/) installed.

Git clone this box.

Edit the Vagrantfile, set the webroot to be the folder in which individual site folders live. This will be mapped to `/var/www` on the guest

Use an IP address not on your network. You will need to edit your hosts file or other internal DNS to map site URLs to that IP address.

The rest of your config happens via Hiera. In `puppet/manifests/hiera/config.yaml` you can set up some sites, databases and specify PHP.ini values.

Put your site folders into the folder you specified in the Vagrantfile and set the docroot as `/var/www/foldername`

Save the config, run vagrant up.