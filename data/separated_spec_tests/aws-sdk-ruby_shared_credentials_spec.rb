require_relative '../spec_helper'

module Aws
  describe SharedCredentials do

    before(:each) do
      stub_const('ENV', {})
      allow(Dir).to receive(:home).and_raise(ArgumentError)
    end

    let(:mock_credential_file) {
      File.expand_path(File.join(File.dirname(__FILE__),
        '..', 'fixtures', 'credentials', 'mock_shared_credentials'))
    }

    let(:mock_config_file) {
      File.expand_path(File.join(File.dirname(__FILE__),
        '..', 'fixtures', 'credentials', 'mock_shared_config'))
    }

    it 'reads the correct default credentials from a credentials file' 


    it 'supports fetching profiles from ENV' 


    it 'supports a manually specified profile' 


    it 'raises when a profile does not exist' 


    it 'is set when credentails is valid' 


    it 'is not set when key_id or access_key is missing' 


    it 'supports inline comments with the profile' 


    it 'supports fetching credentials from config' 


    it 'properly falls back when credentials incomplete' 


    it 'will source from credentials over config' 


    it 'will ignore incomplete credentials' 


  end
end

