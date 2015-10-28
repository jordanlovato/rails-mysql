#
# Cookbook Name:: shelly
# Recipe:: database
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
mysql_service 'shelly' do
	version '5.6'
	port '3306'
	initial_root_password node['shelly']['mysql_password']
	action [:create, :start]
end
