require 'spec_helper'

describe API::Helpers::RelatedResourcesHelpers do
  subject(:helpers) do
    Class.new.include(described_class).new
  end

  describe '#expose_url' do
    let(:path) { '/api/v4/awesome_endpoint' }
    subject(:url) { helpers.expose_url(path) }

    def stub_default_url_options(protocol: 'http', host: 'example.com', port: nil)
      expect(Gitlab::Application.routes).to receive(:default_url_options)
        .and_return(protocol: protocol, host: host, port: port)
    end

    it 'respects the protocol if it is HTTP' 


    it 'respects the protocol if it is HTTPS' 


    it 'accepts port to be nil' 


    it 'includes port if provided' 

  end
end

