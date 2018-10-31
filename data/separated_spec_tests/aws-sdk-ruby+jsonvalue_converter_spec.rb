require_relative '../../spec_helper'

describe 'Client Interface:' do
  describe 'Jsonvalue Converter' do

    before(:all) do
      SpecHelper.generate_service(['JsonvalueConverter'], multiple_files: false)
    end

    let(:client) {
      JsonvalueConverter::Client.new(
        region: 'us-west-2',
        access_key_id: 'akid',
        secret_access_key: 'secret',
        stub_responses: true,
        endpoint: 'http://svc.us-west-2.amazonaws.com'
      )
    }

    it 'converts ruby object to json string before validation' 


    it 'raises exception when an object is not JSON serializable' 

  end
end

