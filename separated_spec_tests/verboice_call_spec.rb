require 'spec_helper'
require 'socket'

describe "calls", integration: true do

  self.use_transactional_fixtures = false

  before(:all) do
    ActiveRecord::Base.logger.level = Logger::INFO
    Account.destroy_all
    sleep 1

    @account = Account.make
    @sip_channel = Channels::SipServer.create! name: "custom-sip", account: @account, number: 1234567890, password: "1234"
    @host_ip = Socket.ip_address_list.detect{ |intf| intf.ipv4? && !intf.ipv4_loopback? && !intf.ipv4_multicast? && intf.ipv4_private? }.ip_address

    config_verboice_asterisk(@host_ip)
    wait_for_channel_definition(@sip_channel.id)
    config_remote_asterisk(@host_ip, @sip_channel.id)

    @project = @account.projects.create! name: "Testing", languages: [{
      "language" => "en",
      "voice" => TTS::SystemSynthesizer.instance.voices["en"].first[:id]
    }], default_language: "en", tts_engine: "built-in"
  end

  after(:all) do
    @account.try(:destroy)
    unconfig_remote_asterisk
  end

  it "captures a digit" 


  it "captures multiple digits" 


  it "listens to a specific digit" 


  it "records a file" 


end

