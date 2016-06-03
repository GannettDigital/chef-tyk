#
# Cookbook Name:: tyk
# Spec:: default
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

require 'spec_helper'

describe 'tyk::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'includes the `install_redis` recipe' do
      expect(chef_run).to include_recipe('tyk::install_redis')
    end

    it 'includes the `install_mongo` recipe' do
      expect(chef_run).to include_recipe('tyk::install_mongo')
    end

    it 'includes the `install_gateway` recipe' do
      expect(chef_run).to include_recipe('tyk::install_gateway')
    end

    it 'includes the `install_dashboard` recipe' do
      expect(chef_run).to include_recipe('tyk::install_dashboard')
    end

    it 'includes the `install_pump` recipe' do
      expect(chef_run).to include_recipe('tyk::install_pump')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
