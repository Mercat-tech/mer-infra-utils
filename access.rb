#!/usr/bin/env ruby
require 'yaml'
require 'aws-sdk-ec2'

config = YAML.load(File.read('./config.yml'))

AWS_ACCESS_KEY_ID = config['aws']['access_key_id']
AWS_SECRET_ACCESS_KEY = config['aws']['secret_access_key']
AWS_REGION = config['aws']['aws_region']
SERVER_LISTS = config['servers']

server = ARGV[0]
raise Exception.new('Server not found') unless SERVER_LISTS.keys.include?(server)
identity_file = ARGV[1]
raise Exception.new('Identity file not found') unless identity_file.present?

credentials = Aws::Credentials.new(AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
ec2 = Aws::EC2::Client.new(region: AWS_REGION, credentials: credentials)
server_description = ec2.describe_instances(filters: [
	{
		name: "tag:Name",
		values: [SERVER_LISTS[server]],
	},
])

ip = server_description.reservations.first.instances.first.private_ip_address

`ssh -i "#{identity_file}" ec2-user@#{ip}`