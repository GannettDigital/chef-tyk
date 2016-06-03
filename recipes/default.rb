# Cookbook Name:: tyk
# Recipe:: default
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

# This recipe can be used to install an all-in-one server
# for testing purposes. For production you probably want to
# install Mongo and redis on separate machines. Also you
# will probably want to have more gateways and put the
# dashboard on separate server too.

include_recipe 'tyk::install_redis'
include_recipe 'tyk::install_mongo'
include_recipe 'tyk::install_gateway'
include_recipe 'tyk::install_dashboard'
include_recipe 'tyk::install_pump'
