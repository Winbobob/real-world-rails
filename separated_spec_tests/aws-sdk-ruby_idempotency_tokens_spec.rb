require_relative '../../spec_helper'

describe 'Client Interface:' do
  describe 'Idempotency Tokens' do

    before(:all) do
      SpecHelper.generate_service(['IdempotencyToken'], multiple_files: false)
    end

    let(:client) {
      IdempotencyToken::Client.new(
        region: 'us-west-2',
        access_key_id: 'akid',
        secret_access_key: 'secret',
        stub_responses: true
      )
    }

    it 'auto-populates request parameters that are idempotency tokens' 


    it 'does not modify given idempotency tokens' 


  end
end

