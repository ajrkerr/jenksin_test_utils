#
# Cookbook Name:: jenkins_test_utils
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'jenkins::master'

def create_sample_job_xml(job)
  xml_path = File.join(Chef::Config[:file_cache_path], "sample-job.#{job}.xml")

  template xml_path do
    source 'job.xml.erb'
  end

  return xml_path
end

node[:jenkins_test_utils][:jobs].each do |job|
  xml_path = create_sample_job_xml(job)

  jenkins_job job do
    action :create
    config xml_path
  end
end