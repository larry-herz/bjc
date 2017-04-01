#
# Cookbook Name:: bjc_infranodes
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'infranodes::default'

template '/etc/rc.local' do
  action :create
  source 'rc.local.erb'
end

file "/etc/ssl/certs/#{node['hostname']}.#{node['demo']['domain']}.crt" do
  source lazy { File.read("/tmp/#{node['hostname']}.crt") }
end

file "/home/ubuntu/#{node['hostname']}.#{node['demo']['domain']}.crt" do
  source lazy { File.read("/tmp/#{node['hostname']}.crt") }
end

include_recipe 'wombat::authorized-keys'
include_recipe 'wombat::etc-hosts'
