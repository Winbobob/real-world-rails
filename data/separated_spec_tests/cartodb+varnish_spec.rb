require_relative '../spec_helper'

describe "Varnish" do
  before(:all) do
    @first_config = Cartodb::config[:varnish_management]
  end

  before(:each) do
    @telnet_mock = mock('Net::Telnet')
    Net::Telnet.stubs(:new).returns(@telnet_mock)
    @telnet_mock.stubs(:close)
    #@telnet_mock.stubs(:cmd).with("String" => "purge wadus", "Match" => /\n\n/).yields('200')
    @telnet_mock.stubs(:puts)
    @telnet_mock.stubs(:waitfor)

  end

  describe "with HTTP requests" do
    before(:all) do
      Cartodb::config.stubs(:[]).returns(@first_config.merge({'host' => 'wadus', 'http_port' => 6081}))
    end

    it "goes over HTTP when http_port is specified" 

  end
  describe "with Telnet requests" do
    before(:each) do
      Cartodb::config.stubs(:[]).returns(@first_config)
    end

    describe "with any command" do
      describe "when connection is unsuccessful" do
        it "should raise an error on timeout" 


        it "should retry on failure before erroring" 


        it "should close the connection afterwards" 

      end

    end

    describe "when sending a purge command" do 
      it "should return successfully" 

    end
  end
end

