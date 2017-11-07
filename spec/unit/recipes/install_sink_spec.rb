#
# Cookbook Name:: tyk
# Spec:: default
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

require 'spec_helper'

describe 'tyk::install_sink' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'downloads and extracts the tyk-sink binary' do
      expect(chef_run).to dump_ark('tyk-sink_package').with(
        url: chef_run.node['tyk']['sink']['package_source'],
        path: chef_run.node['tyk']['sink']['package_path'],
        action: [:dump]
      )
    end

    it 'creates firewall rules' do
      chef_run.converge(described_recipe)
      expect(chef_run).to create_firewall_rule('tyk-sink')
    end

    it 'creates a template `/opt/tyk-sink/tyk-sink.conf`' do
      expect(chef_run).to create_template('/opt/tyk-sink/tyk-sink.conf')
    end

    it 'creates a template `/usr/lib/systemd/system/tyk-sink.service`' do
      expect(chef_run).to create_template('/usr/lib/systemd/system/tyk-sink.service')
    end

    it 'creates a symlink `/opt/tyk-sink/tyk-sink`' do
      expect(chef_run).to create_link('/opt/tyk-sink/tyk-sink')
    end

    it 'creates a template `/etc/rsyslog.d/tyk-sink.conf`' do
      expect(chef_run).to create_template('/etc/rsyslog.d/tyk-sink.conf')
    end

    it 'starts service `tyk-sink`' do
      expect(chef_run).to start_service('tyk-sink')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
