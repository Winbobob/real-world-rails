# frozen_string_literal: true

describe QA::Factory::ApiFabricator do
  let(:factory_without_api_support) do
    Class.new do
      def self.name
        'FooBarFactory'
      end
    end
  end

  let(:factory_with_api_support) do
    Class.new do
      def self.name
        'FooBarFactory'
      end

      def api_get_path
        '/foo'
      end

      def api_post_path
        '/bar'
      end

      def api_post_body
        { name: 'John Doe' }
      end
    end
  end

  before do
    allow(subject).to receive(:current_url).and_return('')
  end

  subject { factory.tap { |f| f.include(described_class) }.new }

  describe '#api_support?' do
    let(:api_client) { spy('Runtime::API::Client') }
    let(:api_client_instance) { double('API Client') }

    context 'when factory does not support fabrication via the API' do
      let(:factory) { factory_without_api_support }

      it 'returns false' 

    end

    context 'when factory supports fabrication via the API' do
      let(:factory) { factory_with_api_support }

      it 'returns false' 

    end
  end

  describe '#fabricate_via_api!' do
    let(:api_client) { spy('Runtime::API::Client') }
    let(:api_client_instance) { double('API Client') }

    before do
      stub_const('QA::Runtime::API::Client', api_client)

      allow(api_client).to receive(:new).and_return(api_client_instance)
      allow(api_client_instance).to receive(:personal_access_token).and_return('foo')
    end

    context 'when factory does not support fabrication via the API' do
      let(:factory) { factory_without_api_support }

      it 'raises a NotImplementedError exception' 

    end

    context 'when factory supports fabrication via the API' do
      let(:factory) { factory_with_api_support }
      let(:api_request) { spy('Runtime::API::Request') }
      let(:resource_web_url) { 'http://example.org/api/v4/foo' }
      let(:resource) { { id: 1, name: 'John Doe', web_url: resource_web_url } }
      let(:raw_post) { double('Raw POST response', code: 201, body: resource.to_json) }

      before do
        stub_const('QA::Runtime::API::Request', api_request)

        allow(api_request).to receive(:new).and_return(double(url: resource_web_url))
      end

      context 'when creating a resource' do
        before do
          allow(subject).to receive(:post).with(resource_web_url, subject.api_post_body).and_return(raw_post)
        end

        it 'returns the resource URL' 


        it 'populates api_resource with the resource' 


        context 'when the POST fails' do
          let(:post_response) { { error: "Name already taken." } }
          let(:raw_post) { double('Raw POST response', code: 400, body: post_response.to_json) }

          it 'raises a ResourceFabricationFailedError exception' 

        end
      end

      context '#transform_api_resource' do
        let(:factory) do
          Class.new do
            def self.name
              'FooBarFactory'
            end

            def api_get_path
              '/foo'
            end

            def api_post_path
              '/bar'
            end

            def api_post_body
              { name: 'John Doe' }
            end

            def transform_api_resource(resource)
              resource[:new] = 'foobar'
              resource
            end
          end
        end

        let(:resource) { { existing: 'foo', web_url: resource_web_url } }
        let(:transformed_resource) { { existing: 'foo', new: 'foobar', web_url: resource_web_url } }

        it 'transforms the resource' 

      end
    end
  end
end

