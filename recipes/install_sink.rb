# Cookbook Name:: tyk
# Recipe:: install_mdcb
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

include_recipe 'firewall'

firewall_rule 'tyk-sink' do
  port node['tyk']['sink']['config']['listen_port']
  protocol :tcp
  command :allow
  notifies :restart, 'firewall[default]', :immediately
end

ark 'tyk-sink_package' do
  url node['tyk']['sink']['package_source']
  path node['tyk']['sink']['package_path']
  action :dump
end

template '/usr/lib/systemd/system/tyk-sink.service' do
  source 'tyk-sink.service.erb'
  variables(
    :open_file_limit_nofile => node['tyk']['sink']['open_file_limit_nofile'],
    :open_file_limit_nproc => node['tyk']['sink']['open_file_limit_nproc']
  )
end

link "#{node['tyk']['sink']['package_path']}/tyk-sink" do
  to "#{node['tyk']['sink']['package_path']}/#{node['tyk']['sink']['package_extracted_path']}/tyk-sink"
end

service 'tyk-sink' do
  supports start: true, stop: true, restart: true, status: true
  action [:enable, :start]
end

template '/opt/tyk-sink/tyk-sink.conf' do
  source 'tyk.conf.erb'
  variables(
    :config => node['tyk']['sink']['config']
  )
  notifies :restart, 'service[tyk-sink]'
end
