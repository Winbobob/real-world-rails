# frozen_string_literal: true

require 'rails_helper'

describe 'API::Calls' do
  before do
    allow_any_instance_of(Twilio::REST::Calls).to receive(:create)
  end

  describe 'POST /api/pages/:id/call' do
    let!(:page) { create(:page, :with_call_tool) }
    let!(:call_tool) { Plugins::CallTool.find_by_page_id(page.id) }
    let(:target) { Plugins::CallTool.find_by_page_id(page.id).targets.sample }

    context 'given valid params' do
      let(:params) do
        {
          call: {
            member_phone_number: '+1 343-700-3482',
            target_id: target.id
          }
        }
      end

      it 'returns successfully' 


      it 'creates a call' 


      it 'creates a call on Twilio' 


      context 'given a valid akid is passed' do
        let(:params_with_akid) { params.merge(akid: '1234.5678.tKK7gX') }
        let!(:member) { create(:member, actionkit_user_id: '5678') }

        it 'returns successfully' 


        it 'creates a call and action assigning the recognized member' 

      end
    end

    context 'given invalid params' do
      let(:params) do
        {
          call: {
            member_phone_number: 'wrong number',
            target_id: target.id
          }
        }
      end

      it 'returns 422 Unprocessable Entity' 


      it 'returns the error messages' 

    end
  end
end

