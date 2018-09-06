require 'rails_helper'

describe AssetHosts do
  describe '#call' do
    let(:request_with_port) { double(host: 'example.com', port: '3000') }
    let(:request_with_subdomain_and_port) do
      double(host: 'admin.example.com', port: '3000')
    end
    let(:request) { double(host: 'example.com', port: nil) }
    let(:request_with_unauthorized_host) do
      double(host: 'evil.example.com.evil.com', port: nil)
    end
    let(:request_without_port) do
      double(host: 'admin.example.com', port: nil)
    end

    context 'heroku domain' do
      it 'only allows the configured asset host' 

    end

    context 'port but no subdomains' do
      it 'returns host with port' 

    end

    context 'subdomain with port' do
      it 'returns the host with subdomain and port' 

    end

    context 'no subdomains, no port' do
      it 'returns the host' 

    end

    context 'unauthorized host' do
      it 'returns the default asset host' 

    end

    context 'subdomain, no port' do
      it 'returns the host' 

    end

    context 'custom domain but asset host is not set to naked domain' do
      it 'will use asset_host' 

    end

    context 'request made from subdomain but asset host is not set to naked domain' do
      it 'will use asset_host' 

    end

    it 'returns nil if request argument is nil' 

  end
end

