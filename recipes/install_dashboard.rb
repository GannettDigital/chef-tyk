# Cookbook Name:: tyk
# Recipe:: install_dashboard
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

include_recipe 'firewall'

packagecloud_repo node['tyk']['dashboard']['packagecloud_source']

firewall_rule 'tyk-dashboard' do
  port node['tyk']['dashboard']['config']['listen_port']
  protocol :tcp
  command :allow
  notifies :restart, 'firewall[default]', :immediately
end

package 'tyk-dashboard'

template '/opt/tyk-dashboard/tyk_analytics.conf' do
  source 'tyk.conf.erb'
  variables(
    :config => node['tyk']['dashboard']['config']
  )
  notifies :restart, 'service[tyk-dashboard]'
end

template '/etc/rsyslog.d/tyk-analytics.conf' do
  source 'rsyslog.conf.erb'
  variables(
    :processname => 'tyk-analytics'
  )
  notifies :restart, 'service[rsyslog]', :delayed
end

service 'rsyslog' do
  action [:nothing]
end

service 'tyk-dashboard' do
  action [:enable, :start]
  supports restart: true, reload: false, status: true
end
