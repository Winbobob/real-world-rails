require 'spec_helper'

describe 'trusted_proxies' do
  context 'with default config' do
    before do
      set_trusted_proxies([])
    end

    it 'preserves private IPs' 


    it 'filters out localhost' 


    it 'filters out bad values' 

  end

  context 'with private IP ranges added' do
    before do
      set_trusted_proxies(["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"])
    end

    it 'filters out private and local IPs' 

  end

  context 'with proxy IP added' do
    before do
      set_trusted_proxies(["60.98.25.47"])
    end

    it 'filters out proxy IP' 


    it 'handles invalid ip addresses' 

  end

  def stub_request(headers = {})
    ActionDispatch::RemoteIp.new(proc { }, false, Rails.application.config.action_dispatch.trusted_proxies).call(headers)
    ActionDispatch::Request.new(headers)
  end

  def set_trusted_proxies(proxies = [])
    stub_config_setting('trusted_proxies' => proxies)
    load File.join(__dir__, '../../config/initializers/trusted_proxies.rb')
  end
end

