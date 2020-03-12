#
# Cookbook:: node_cookbook
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongo_cookbook::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    platform 'ubuntu', '16.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'should install mongodb-org' do
      expect(chef_run).to add_apt_repository "mongodb-org"
    end

    it 'should install mongodb-org' do
      expect(chef_run).to upgrade_package "mongodb-org"
    end
  end
end
