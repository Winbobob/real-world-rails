require 'spec_helper'

describe Settings, type: 'model' do
  describe 'in production' do
    before do
      ENV['PRIVILEGED_USERS'] = "one@example.com, two@example.com"
    end

    it 'has specific privileged_users fed through ENV' 

  end
end

