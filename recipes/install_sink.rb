# Cookbook Name:: tyk
# Recipe:: install_mdcb
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

include_recipe 'firewall'

#firewall_rule 'tyk-sink' do
#  port node['tyk']['dashboard']['config']['listen_port']
#  protocol :tcp
#  command :allow
#  notifies :restart, 'firewall[default]', :immediately
#end

ark 'tyk-sink_package' do
  url node['tyk']['sink']['package_source']
  path node['tyk']['sink']['package_path']
  creates 'tyk-sink'
  action :cherry_pick
end

#template '/opt/tyk-sink/tyk_sink.conf' do
#  source 'tyk.conf.erb'
#  variables(
#    :config => node['tyk']['sink']['config']
#  )
#  notifies :restart, 'service[tyk-sink]'
#end

#service 'tyk-sink' do
#  action [:enable, :start]
#  supports restart: true, reload: false, status: true
#end
