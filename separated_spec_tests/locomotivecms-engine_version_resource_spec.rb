require 'spec_helper'

describe Locomotive::API::Resources::VersionResource do

  include Rack::Test::Methods

  describe 'GET /locomotive/api/v3/version.json' do
    context 'JSON' do
      subject { parsed_response }

      it 'returns the current engine version' 


    end
  end

end

