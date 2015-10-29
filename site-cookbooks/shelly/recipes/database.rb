#
# Cookbook Name:: shelly
# Recipe:: database
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'libmysqlclient'

mysql2_chef_gem 'default' do
	action :install
end

mysql_client "default" do
	action :create
end

mysql_service 'default' do
	initial_root_password node['shelly']['database']['password']
	action [:create, :start]
end

mysql_database node['shelly']['database']['name'] do
	connection(
		:host => node['shelly']['database']['host'],
		:socket => '/var/run/mysql-default/mysqld.sock',
		:username => node['shelly']['database']['username'],
		:password => node['shelly']['database']['password']
	)
	action :create
end

mysql_database_user node['shelly']['database']['app']['username'] do
	connection(
		:host => node['shelly']['database']['host'],
		:socket => '/var/run/mysql-default/mysqld.sock',
		:username => node['shelly']['database']['username'],
		:password => node['shelly']['database']['password']
	)

	password node['shelly']['database']['app']['password']
	database_name node['shelly']['database']['name']
	host node['shelly']['database']['host']
	action [:create, :grant]
end
