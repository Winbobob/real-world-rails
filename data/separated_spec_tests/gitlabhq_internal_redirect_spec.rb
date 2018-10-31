require 'spec_helper'

describe InternalRedirect do
  let(:controller_class) do
    Class.new do
      include InternalRedirect

      def request
        @request ||= Struct.new(:host, :port).new('test.host', 80)
      end
    end
  end
  subject(:controller) { controller_class.new }

  describe '#safe_redirect_path' do
    it 'is `nil` for invalid uris' 


    it 'is `nil` for paths trying to include a host' 


    it 'returns the path if it is valid' 


    it 'returns the path with querystring if it is valid' 

  end

  describe '#safe_redirect_path_for_url' do
    it 'is `nil` for invalid urls' 


    it 'is `nil` for urls from a with a different host' 


    it 'is `nil` for urls from a with a different port' 


    it 'returns the path if the url is on the same host' 


    it 'returns the path including querystring if the url is on the same host' 

  end

  describe '#host_allowed?' do
    it 'allows uris with the same host and port' 


    it 'rejects uris with other host and port' 

  end
end

