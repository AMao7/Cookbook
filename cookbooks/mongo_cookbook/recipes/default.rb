
apt_update 'update' do
  action :update
end

apt_repository 'mongodb-org' do
  uri "https://repo.mongodb.org/apt/ubuntu"
  distribution "xenial/mongodb-org/3.2"
  components ['multiverse']
  keyserver "hkp://keyserver.ubuntu.com:80"
  key "EA312927"
end

package "mongodb-org" do
  options '--allow-unauthenticated'
  action :upgrade
end

template /lib/systemd/system/mongod.service do
  source 'mongod.service.erb'
  mode '0600'
  owner 'root'
  group 'root'
  notifies :restart, 'service[mongod]'
end

#template /etc/mongod.conf do
#  source 'mongod.conf.erb'
#  mode '0600'
#  owner 'root'
#  group 'root'
#  notifies :restart, 'service[mongod]'
#end




# Chef Configuration Lab

## Timings
