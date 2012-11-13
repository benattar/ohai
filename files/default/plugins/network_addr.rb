provides "network"

require_plugin "hostname"
require_plugin "#{os}::network"

network['interfaces'].each do |iface, addrs|

  addrs['addresses'].each do |ip, params|
    network["ipaddress_#{iface}"] = ip if params['family'].eql?('inet')
    network["ipaddress6_#{iface}"] = ip if params['family'].eql?('inet6')
    network["macaddress_#{iface}"] = ip if params['family'].eql?('lladdr')
  end

end

network

