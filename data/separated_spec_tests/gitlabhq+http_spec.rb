require 'spec_helper'

describe Gitlab::HTTP do
  describe 'allow_local_requests_from_hooks_and_services is' do
    before do
      WebMock.stub_request(:get, /.*/).to_return(status: 200, body: 'Success')
    end

    context 'disabled' do
      before do
        allow(Gitlab::CurrentSettings).to receive(:allow_local_requests_from_hooks_and_services?).and_return(false)
      end

      it 'deny requests to localhost' 


      it 'deny requests to private network' 


      context 'if allow_local_requests set to true' do
        it 'override the global value and allow requests to localhost or private network' 

      end
    end

    context 'enabled' do
      before do
        allow(Gitlab::CurrentSettings).to receive(:allow_local_requests_from_hooks_and_services?).and_return(true)
      end

      it 'allow requests to localhost' 


      it 'allow requests to private network' 


      context 'if allow_local_requests set to false' do
        it 'override the global value and ban requests to localhost or private network' 

      end
    end
  end

  describe 'handle redirect loops' do
    before do
      WebMock.stub_request(:any, "http://example.org").to_raise(HTTParty::RedirectionTooDeep.new("Redirection Too Deep"))
    end

    it 'handles GET requests' 


    it 'handles POST requests' 


    it 'handles PUT requests' 


    it 'handles DELETE requests' 


    it 'handles HEAD requests' 

  end
end

