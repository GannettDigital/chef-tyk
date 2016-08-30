#
# Cookbook Name:: tyk
# Spec:: default
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

require 'spec_helper'

describe 'tyk::install_gateway' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'creates a new system file limit' do
      expect(chef_run).to create_limits_config('system limits')
        .with(
          use_system: true,
          limits: [
            { domain: '*', type: 'hard', item: 'nofile', value: '65536' },
            { domain: '*', type: 'soft', item: 'nofile', value: '65536' },
            { domain: '*', type: 'hard', item: 'nproc', value: '65536' },
            { domain: '*', type: 'soft', item: 'nproc', value: '65536' },
            { domain: 'root', type: 'hard', item: 'nofile', value: '65536' },
            { domain: 'root', type: 'soft', item: 'nofile', value: '65536' },
            { domain: 'root', type: 'hard', item: 'nproc', value: '65536' },
            { domain: 'root', type: 'soft', item: 'nproc', value: '65536' }
          ]
        )
    end

    it 'should create packagecloud_repo `tyk/tyk-gateway`' do
      expect(chef_run).to create_packagecloud_repo('tyk/tyk-gateway')
    end

    it 'creates firewall rules' do
      chef_run.converge(described_recipe)
      expect(chef_run).to create_firewall_rule('tyk-gateway')
    end

    it 'installs the package `tyk-gateway`' do
      expect(chef_run).to install_package('tyk-gateway')
    end

    it 'creates a template `/opt/tyk-gateway/tyk.conf`' do
      expect(chef_run).to create_template('/opt/tyk-gateway/tyk.conf')
    end

    it 'starts service `tyk-gateway`' do
      expect(chef_run).to start_service('tyk-gateway')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
