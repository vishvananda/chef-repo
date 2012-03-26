
# Override these values with a local config defined in VD_CONF
conf = {
    'ip_prefix' => '192.168.28',
    'mac_prefix' => '080027028',
    'box_name' => 'precise',
    'box_url' => 'http://c479942.r42.cf2.rackcdn.com/precise64.box',
    'allocate_memory' => 1024,
    'cache_dir' => 'cache',
    'ssh_dir' => '~/.ssh/',
}


vd_conf = ENV.fetch('VD_CONF', 'etc/vagrant.yaml')
if File.exist?(vd_conf)
    require 'yaml'
    user_conf = YAML.load_file(vd_conf)
    conf.update(user_conf)
end

Vagrant::Config.run do |config|

  config.vm.box = conf['box_name']
  config.vm.box_url = conf['box_url']

  memory = conf['allocate_memory'].to_s()
  config.vm.customize ["modifyvm", :id, "--memory", memory]

  suffix = "100"

  ip_prefix = conf['ip_prefix']
  ip = "#{ip_prefix}.#{suffix}"

  mac_prefix = conf['mac_prefix']
  mac = "#{mac_prefix}#{suffix}"

  Vagrant::Config.run do |config|
    config.vm.network(:hostonly, ip, :mac => mac)
  end

  cache_dir = conf['cache_dir']
  config.vm.share_folder("v-cache", "/home/vagrant/cache", cache_dir,
                         :nfs => true)

  ssh_dir = conf['ssh_dir']
  config.vm.share_folder("v-ssh", "/home/vagrant/.host-ssh", ssh_dir)

  cookbooks_dir = conf['cookbooks_dir']
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.log_level = :debug
    chef.run_list = [
      "recipe[vagrant-openstack::hostname]",
      "recipe[vagrant-openstack::cache]",
      "recipe[vagrant-openstack::dotfiles]",
      "recipe[nova]",
    ]
    chef.json.merge!({
      :controller_address => ip,
      :my_ip => ip,
    })
  end
end
