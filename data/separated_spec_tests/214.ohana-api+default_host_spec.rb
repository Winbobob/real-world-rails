require 'rails_helper'

describe DefaultHost do
  describe '#call' do
    context 'heroku domain' do
      it 'only allows the configured domain name' 

    end

    context 'custom domain with subdomain' do
      it 'uses the full domain with subdomain' 

    end

    context 'custom domain but domain_name is not set to naked domain' do
      it 'will not redirect properly to subdomains' 

    end

    context 'unauthorized host' do
      it 'returns the configured domain name' 

    end
  end
end

