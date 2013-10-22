# Installs & Initializes the Chef Exception & Reporting Handler for Splunk.
#
# Recipe:: default
# Cookbook Name:: splunk_handler
# Source:: https://github.com/ampledata/cookbook-splunk_handler
# Author:: Greg Albrecht <mailto:gba@splunk.com>
# Copyright:: Copyright 2012 Splunk, Inc.
# License:: Apache License 2.0
#


splunk_params = node['chef_client']['handler']['splunk']

if (splunk_params['username'] and splunk_params['password'] and
    splunk_params['host'])

  include_recipe 'chef_handler'

  cookbook_file File.join(node['chef_handler']['handler_path'], 'splunk.rb') do
    source "splunk.rb"
    action :nothing
  end.run_action(:create)

  chef_handler 'Chef::Handler::SplunkHandler' do
    action :nothing
    arguments [
      username=splunk_params['username'],
      password=splunk_params['password'],
      host=splunk_params['host'],
      port=splunk_params['port'],
      index=splunk_params['index'],
      scheme=splunk_params['scheme']
    ]
    source File.join(node['chef_handler']['handler_path'], 'splunk.rb')
  end.run_action(:enable)
end
