#
# Cookbook Name:: tyk
# Recipe:: install_pump
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

packagecloud_repo node['tyk']['pump']['packagecloud_source']

package 'tyk-pump'

template '/opt/tyk-pump/pump.conf' do
  source 'tyk.conf.erb'
  variables(
    :config => node['tyk']['pump']['config']
  )
  notifies :restart, 'service[tyk-pump]'
end

template '/etc/rsyslog.d/tyk-pump.conf' do
  source 'rsyslog.conf.erb'
  variables(
    :processname => 'tyk-pump'
  )
  notifies :restart, 'service[rsyslog]', :delayed
end

service 'rsyslog' do
  action [:nothing]
end

service 'tyk-pump' do
  action [:enable, :start]
  supports restart: true, reload: false, status: true
end
