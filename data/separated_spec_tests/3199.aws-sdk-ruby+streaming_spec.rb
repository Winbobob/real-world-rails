require_relative '../../spec_helper'

describe 'Client Interface:' do
  describe 'Support Block Streaming' do

    before(:all) do
      SpecHelper.generate_service(['Streaming'], multiple_files: false)
    end

    let(:client) {
      Streaming::Client.new(
        region: 'us-west-2',
        credentials: Aws::Credentials.new('akid', 'secret'),
        stub_responses: true
      )
    }

    it 'support block streaming for streaming operations' 


  end
end

