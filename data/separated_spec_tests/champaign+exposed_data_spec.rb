require 'rails_helper'

describe CallTool::ExposedData do
  describe 'to_h' do
    let(:url_params) do
      {
        source: 'fwd',
        akid: '1234.5678.4567',
        target_phone_number: '+1 213-555-6789',
        target_phone_extension: '5698',
        target_name: 'Courtney Love',
        target_title: 'High Priestess'
      }
    end
    let(:plugin_instance_data) do
      {
        page_id: 96,
        locale: 'en',
        active: true,
        restricted_country_code: nil,
        targets: []
      }
    end
    let(:plugin_data) { { default: plugin_instance_data } }
    let(:expected_keys) do
      %i[target_phone_number target_phone_extension target_name target_title]
    end

    subject { CallTool::ExposedData.new(plugin_data, url_params).to_h }

    it 'passes the phone number and checksum to the validator' 


    it 'returns just the original params when checksum is invalid' 


    it 'adds all/only the relevant parameters when checksum is valid' 


    it 'adds the relevant parameters when checksum is valid and multiple plugins' 

  end
end

