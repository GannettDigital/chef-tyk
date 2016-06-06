#
# Cookbook Name:: tyk
# Recipe:: install_pump
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

packagecloud_repo 'tyk/tyk-pump'

include_recipe 'firewall'

packagecloud_repo 'tyk/tyk-pump'

firewall_rule 'tyk-pump' do
  port node['tyk']['pump']['config']['listen_port']
  protocol :tcp
  command :allow
  notifies :restart, 'firewall[default]', :immediately
end

package 'tyk-pump'

template '/opt/tyk-pump/tyk.conf' do
  source 'tyk.conf.erb'
  variables(
    :config => node['tyk']['pump']['config']
  )
  notifies :restart, 'service[tyk-pump]'
end

service 'tyk-pump' do
  action [:enable, :start]
  supports restart: true, reload: false, status: true
end
