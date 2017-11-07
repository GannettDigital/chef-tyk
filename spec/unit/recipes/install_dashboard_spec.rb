#
# Cookbook Name:: tyk
# Spec:: default
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

require 'spec_helper'

describe 'tyk::install_dashboard' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'should create packagecloud_repo `tyk/tyk-dashboard`' do
      expect(chef_run).to create_packagecloud_repo('tyk/tyk-dashboard')
    end

    it 'creates firewall rules' do
      chef_run.converge(described_recipe)
      expect(chef_run).to create_firewall_rule('tyk-dashboard')
    end

    it 'installs the package `tyk-dashboard`' do
      expect(chef_run).to install_package('tyk-dashboard')
    end

    it 'creates a template `/etc/rsyslog.d/tyk-analytics.conf`' do
      expect(chef_run).to create_template('/etc/rsyslog.d/tyk-analytics.conf')
    end

    it 'creates a template `/opt/tyk-dashboard/tyk_analytics.conf`' do
      expect(chef_run).to create_template('/opt/tyk-dashboard/tyk_analytics.conf')
    end

    it 'starts service `tyk-dashboard`' do
      expect(chef_run).to start_service('tyk-dashboard')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
