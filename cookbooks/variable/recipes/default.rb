#
# Cookbook Name:: variable
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package_name = "apache2"
service_name = "apache2"
document_root = "/var/www/html"

if node["platform"] == "amazon"
package_name = "httpd"
service_name = "httpd"
document_root = "/var/www/html"
end

package package_name do
action :install
end

service service_name do
action [:enable, :start]
end

template "#{document_root}/index.html" do
source "index.html.erb"
end
