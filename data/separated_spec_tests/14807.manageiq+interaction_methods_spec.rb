require_relative '../interaction_methods'

$LOAD_PATH << Rails.root.join("tools").to_s

describe Openstack::InteractionMethods do
  let(:host1_data) { {:name => "name1", :connection_state => 'connection_state1', :settings => {}} }
  let(:host2_data) { {:name => "name2", :connection_state => 'connection_state2', :settings => {}} }
  let(:host3_data) { {:name => "name3", :connection_state => 'connection_state', :settings => {}} }
  let(:host4_data) { {:name => "name4", :connection_state => 'connection_state', :settings => {}} }
  let(:host5_data) do
    {
      :name             => "name5",
      :connection_state => 'connection_state5',
      :settings         => {
        :ip_addr => "1.2.3.4",
      }
    }
  end

  let(:host6_data) do
    {
      :name             => "name6",
      :connection_state => 'connection_state6',
      :settings         => {
        :ip_addr => "1.2.3.4",
        :gateway => "192.0.2.1",
      }
    }
  end

  let(:host7_data) do
    {
      :name             => "name7",
      :connection_state => 'connection_state7',
      :settings         => {
        "ip_addr" => "1.2.3.5",
        "gateway" => "192.0.2.2",
      }
    }
  end

  let(:host1) { FactoryGirl.create(:host, host1_data) }
  let(:host2) { FactoryGirl.create(:host, host2_data) }
  let(:host3) { FactoryGirl.create(:host, host3_data) }
  let(:host4) { FactoryGirl.create(:host, host4_data) }
  let(:host5) { FactoryGirl.create(:host, host5_data) }
  let(:host6) { FactoryGirl.create(:host, host6_data) }
  let(:host7) { FactoryGirl.create(:host, host7_data) }

  let(:data) do
    [
      host1,
      host2,
      host3,
      host4,
      host5,
      host6,
      host7,
    ]
  end

  context "#Openstack::InteractionMethods" do
    let(:subject) { (Class.new { include Openstack::InteractionMethods }).new }

    before do
      allow($stdout).to receive(:puts)
    end

    context "#find_all" do
      it "should find one host with unique attribute value" 


      it "should find all hosts with not unique attribute value" 


      it "should find all hosts with nested hash in lookup pairs" 


      it "should find all hosts with blank nested hash in lookup pairs" 


      it "should not find any hosts with bad value in nested hash in lookup pairs" 

    end
  end
end
