Install Chef DK + Vagrant

Install the following Vagrant Plugins:

vagrant-librarian-chef-nochef (0.2.0)

vagrant-omnibus (1.4.1)

vagrant-share (1.1.4, system)

vagrant-vbguest (0.10.1)

This cookbook installs a Rails/MqSQL stack managed by NGINX/Passenger. Please add the rails application as a subdirectory withing ./apps and configure the appropriate attributes for 'shelly'. node['shelly']['appname'] should map to the directory of the rails application.
