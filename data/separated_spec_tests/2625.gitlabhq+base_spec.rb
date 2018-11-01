# frozen_string_literal: true

describe QA::Factory::Base do
  include Support::StubENV

  let(:factory) { spy('factory') }
  let(:location) { 'http://location' }

  shared_context 'fabrication context' do
    subject do
      Class.new(described_class) do
        def self.name
          'MyFactory'
        end
      end
    end

    before do
      allow(subject).to receive(:current_url).and_return(location)
      allow(subject).to receive(:new).and_return(factory)
    end
  end

  shared_examples 'fabrication method' do |fabrication_method_called, actual_fabrication_method = nil|
    let(:fabrication_method_used) { actual_fabrication_method || fabrication_method_called }

    it 'yields factory before calling factory method' 


    it 'does not log the factory and build method when QA_DEBUG=false' 

  end

  describe '.fabricate!' do
    context 'when factory does not support fabrication via the API' do
      before do
        expect(described_class).to receive(:fabricate_via_api!).and_raise(NotImplementedError)
      end

      it 'calls .fabricate_via_browser_ui!' 

    end

    context 'when factory supports fabrication via the API' do
      it 'calls .fabricate_via_browser_ui!' 

    end
  end

  describe '.fabricate_via_api!' do
    include_context 'fabrication context'

    it_behaves_like 'fabrication method', :fabricate_via_api!

    it 'instantiates the factory, calls factory method returns the resource' 


    it 'logs the factory and build method when QA_DEBUG=true' 

  end

  describe '.fabricate_via_browser_ui!' do
    include_context 'fabrication context'

    it_behaves_like 'fabrication method', :fabricate_via_browser_ui!, :fabricate!

    it 'instantiates the factory and calls factory method' 


    it 'returns fabrication resource' 


    it 'logs the factory and build method when QA_DEBUG=true' 

  end

  shared_context 'simple factory' do
    subject do
      Class.new(QA::Factory::Base) do
        attribute :test do
          'block'
        end

        attribute :no_block

        def fabricate!
          'any'
        end

        def self.current_url
          'http://stub'
        end
      end
    end

    let(:factory) { subject.new }
  end

  describe '.attribute' do
    include_context 'simple factory'

    it 'appends new attribute' 


    context 'when the attribute is populated via a block' do
      it 'returns value from the block' 

    end

    context 'when the attribute is populated via the api' do
      let(:api_resource) { { no_block: 'api' } }

      before do
        expect(factory).to receive(:api_resource).and_return(api_resource)
      end

      it 'returns value from api' 


      context 'when the attribute also has a block' do
        let(:api_resource) { { test: 'api_with_block' } }

        before do
          allow(QA::Runtime::Logger).to receive(:info)
        end

        it 'returns value from api and emits an INFO log entry' 

      end
    end

    context 'when the attribute is populated via direct assignment' do
      before do
        factory.test = 'value'
      end

      it 'returns value from the assignment' 


      context 'when the api also has such response' do
        before do
          allow(factory).to receive(:api_resource).and_return({ test: 'api' })
        end

        it 'returns value from the assignment' 

      end
    end

    context 'when the attribute has no value' do
      it 'raises an error because no values could be found' 

    end
  end

  describe '#web_url' do
    include_context 'simple factory'

    it 'sets #web_url to #current_url after fabrication' 

  end

  describe '#visit!' do
    include_context 'simple factory'

    before do
      allow(factory).to receive(:visit)
    end

    it 'calls #visit with the underlying #web_url' 

  end
end

