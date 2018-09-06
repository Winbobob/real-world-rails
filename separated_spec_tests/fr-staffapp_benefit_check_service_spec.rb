# coding: utf-8

require 'rails_helper'

describe BenefitCheckService do

  context 'called with invalid object' do
    it 'fails' 

  end

  context 'called with valid params' do
    let(:user) { create(:user) }
    let(:check) { create(:benefit_check, user_id: user.id, date_of_birth: '19800101', ni_number: 'AB123456A', last_name: 'LAST_NAME') }

    context 'passing a benefit_check object' do

      before do
        dwp_api_response 'Yes'
        described_class.new(check)
      end

      it 'does not raise error' 


      it 'sets the dwp_result' 


      it 'sets the benefits valid' 


      it 'sets the dwp_api_token' 


      context 'simulating a 500 error' do

        before do
          stub_request(:post, "#{ENV['DWP_API_PROXY']}/api/benefit_checks").
            to_return(status: 500, body: '', headers: {})
          described_class.new(check)
        end

        it 'returns the error in message' 


        it 'returns fail' 

      end

      context 'simulating a 400 error' do
        let(:message) { { 'error': "LSCBC210: Error in request parameter 'Surname'" }.to_json }

        before do
          stub_request(:post, "#{ENV['DWP_API_PROXY']}/api/benefit_checks").
            to_return(status: 400, body: message, headers: {})
          described_class.new(check)
        end

        it 'returns the error in message' 


        it 'returns fail' 

      end
    end

  end

  context 'called with invalid params' do
    context 'when api_proxy returns undetermined' do
      let(:invalid_check) { create(:invalid_benefit_check) }
      before do
        dwp_api_response 'Undetermined'
        described_class.new(invalid_check)
      end

      it 'returns the error message' 


      it 'returns fail' 

    end
  end
end

