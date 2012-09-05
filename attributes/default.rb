#
# Attributes:: default
# Cookbook Name:: splunk_handler
# Author:: Greg Albrecht (<mailto:gba@splunk.com>)
# Copyright:: Copyright 2012 Splunk, Inc.
#


default['chef_client']['handler']['splunk']['username'] = nil
default['chef_client']['handler']['splunk']['password'] = nil
default['chef_client']['handler']['splunk']['host'] = nil
default['chef_client']['handler']['splunk']['port'] = '8089'
default['chef_client']['handler']['splunk']['index'] = 'main'
default['chef_client']['handler']['splunk']['scheme'] = 'https'
