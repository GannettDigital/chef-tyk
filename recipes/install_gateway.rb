# Cookbook Name:: tyk
# Recipe:: install_gateway
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

include_recipe 'firewall'
include_recipe 'sysctl::apply'

limits_config 'system limits' do
  limits [
    { domain: '*', type: 'hard', item: 'nofile', value: '65536' },
    { domain: '*', type: 'soft', item: 'nofile', value: '65536' },
    { domain: '*', type: 'hard', item: 'nproc', value: '65536' },
    { domain: '*', type: 'soft', item: 'nproc', value: '65536' },
    { domain: 'root', type: 'hard', item: 'nofile', value: '65536' },
    { domain: 'root', type: 'soft', item: 'nofile', value: '65536' },
    { domain: 'root', type: 'hard', item: 'nproc', value: '65536' },
    { domain: 'root', type: 'soft', item: 'nproc', value: '65536' }
  ]
  use_system true
end

packagecloud_repo node['tyk']['gateway']['packagecloud_source']

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
