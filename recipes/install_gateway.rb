# Cookbook Name:: tyk
# Recipe:: install_gateway
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

include_recipe 'firewall'

packagecloud_repo 'tyk/tyk-gateway'

firewall_rule 'tyk-gateway' do
  port node['tyk']['gateway']['config']['listen_port']
  protocol :tcp
  command :allow
  notifies :restart, 'firewall[default]', :immediately
end

package 'tyk-gateway'

template '/opt/tyk-gateway/tyk.conf' do
  source 'tyk.conf.erb'
  variables(
    :config => node['tyk']['gateway']['config']
  )
  notifies :restart, 'service[tyk-gateway]'
end

service 'tyk-gateway' do
  action [:enable, :start]
  supports restart: true, reload: false, status: true
end
