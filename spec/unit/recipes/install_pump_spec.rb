#
# Cookbook Name:: tyk
# Spec:: default
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

require 'spec_helper'

describe 'tyk::install_pump' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'should create packagecloud_repo `tyk/tyk-pump`' do
      expect(chef_run).to create_packagecloud_repo('tyk/tyk-pump')
    end

    it 'installs the package `tyk-pump`' do
      expect(chef_run).to install_package('tyk-pump')
    end

    it 'creates a template `/opt/tyk-pump/pump.conf`' do
      expect(chef_run).to create_template('/opt/tyk-pump/pump.conf')
    end

    it 'creates a template `/etc/rsyslog.d/tyk-pump.conf`' do
      expect(chef_run).to create_template('/etc/rsyslog.d/tyk-pump.conf')
    end

    it 'starts service `tyk-pump`' do
      expect(chef_run).to start_service('tyk-pump')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
