#
# Cookbook Name:: tyk
# Spec:: default
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

require 'spec_helper'

describe 'tyk::install_mongo' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'includes the `mongodb` recipe' do
      expect(chef_run).to include_recipe('mongodb')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
