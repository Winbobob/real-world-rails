require 'manageiq/network_discovery/discovery'
require 'ostruct'
require 'benchmark'

RSpec.describe ManageIQ::NetworkDiscovery::Port do
  before do
    @ost = OpenStruct.new
    @ost.ipaddr = '172.16.254.1'
  end

  context '#open?' do
    it 'with an open port' 


    it 'with a closed port' 


    it 'with a changed timeout value' 

  end

  context '#scan_open' do
    before do
      allow(described_class).to receive(:open?).with(@ost, 902).and_return(true)
      allow(described_class).to receive(:open?).with(@ost, 903).and_return(false)
      allow(described_class).to receive(:open?).with(@ost, 904).and_return(true)
      allow(described_class).to receive(:open?).with(@ost, 905).and_return(false)
    end

    it 'has some open with array of ports' 


    it 'has some open with range of ports' 

  end
end

