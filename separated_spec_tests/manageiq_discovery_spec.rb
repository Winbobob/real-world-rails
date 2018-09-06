require 'manageiq/network_discovery/discovery'
require 'ostruct'
require 'util/miq-ipmi'

RSpec.describe ManageIQ::NetworkDiscovery::Discovery do
  context '#scan_host' do
    let(:ost) { OpenStruct.new(:discover_types => [:ipmi], :ipaddr => '127.0.0.1', :hypervisor => []) }
    it 'hypervisor is ipmi when available' 


    it 'no hypervisor unless ipmi is available' 

  end
end

