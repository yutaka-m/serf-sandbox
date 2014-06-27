log "Setup!"

include_recipe "apt"
package "unzip"
package "curl"

cookbook_file "/usr/local/bin/serf" do
  mode 00755
end

directory "/opt/serf/common" do
  recursive true
end

cookbook_file "/opt/serf/common/serf-member-join.sh" do
  mode 00755
end

cookbook_file "/opt/serf/common/serf-member-leave.sh" do
  mode 00755
end

cookbook_file "/opt/serf/common/serf-user-deploy.sh" do
  mode 00755
end

template "/etc/init/serf.conf" do
  source "init.conf.erb"
end

service "serf" do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end

cookbook_file "/etc/init/serf-join.conf"

service "serf-join" do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end

cookbook_file "/etc/init/serf-query.conf"

service "serf-query" do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end

