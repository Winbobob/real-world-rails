# coding: utf-8
require 'spec_helper'

describe Gitlab::UrlBlocker do
  describe '#blocked_url?' do
    let(:ports) { Project::VALID_IMPORT_PORTS }

    it 'allows imports from configured web host and port' 


    it 'allows imports from configured SSH host and port' 


    it 'returns true for bad localhost hostname' 


    it 'returns true for bad port' 


    it 'returns true for bad protocol' 


    it 'returns true for localhost IPs' 


    it 'returns true for loopback IP' 


    it 'returns true for alternative version of 127.0.0.1 (0177.1)' 


    it 'returns true for alternative version of 127.0.0.1 (0x7f.1)' 


    it 'returns true for alternative version of 127.0.0.1 (2130706433)' 


    it 'returns true for alternative version of 127.0.0.1 (127.000.000.001)' 


    it 'returns true for a non-alphanumeric hostname' 


    it 'returns true for invalid URL' 


    it 'returns false for legitimate URL' 


    context 'when allow_local_network is' do
      let(:local_ips) { ['192.168.1.2', '10.0.0.2', '172.16.0.2'] }
      let(:fake_domain) { 'www.fakedomain.fake' }

      context 'true (default)' do
        it 'does not block urls from private networks' 


        it 'allows localhost endpoints' 


        it 'allows loopback endpoints' 


        it 'allows IPv4 link-local endpoints' 


        # This is blocked due to the hostname check: https://gitlab.com/gitlab-org/gitlab-ce/issues/50227
        it 'blocks IPv6 link-local endpoints' 

      end

      context 'false' do
        it 'blocks urls from private networks' 


        it 'blocks IPv4 link-local endpoints' 


        it 'blocks IPv6 link-local endpoints' 

      end

      def stub_domain_resolv(domain, ip)
        allow(Addrinfo).to receive(:getaddrinfo).with(domain, any_args).and_return([double(ip_address: ip, ipv4_private?: true, ipv6_link_local?: false, ipv4_loopback?: false, ipv6_loopback?: false)])
      end

      def unstub_domain_resolv
        allow(Addrinfo).to receive(:getaddrinfo).and_call_original
      end
    end

    context 'when enforce_user is' do
      before do
        stub_resolv
      end

      context 'false (default)' do
        it 'does not block urls with a non-alphanumeric username' 

      end

      context 'true' do
        it 'blocks urls with a non-alphanumeric username' 

      end
    end
  end

  # Resolv does not support resolving UTF-8 domain names
  # See https://bugs.ruby-lang.org/issues/4270
  def stub_resolv
    allow(Resolv).to receive(:getaddresses).and_return([])
  end
end

