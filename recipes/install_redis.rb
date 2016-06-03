#
# Cookbook Name:: tyk
# Recipe:: install_redis
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

include_recipe 'redisio'
include_recipe 'redisio::enable'
