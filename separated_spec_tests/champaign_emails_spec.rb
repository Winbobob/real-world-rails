require 'rails_helper'

describe 'Emails', type: :request do
  describe 'POST /emails' do
    let!(:page) { create(:page, title: 'Foo Bar', slug: 'foo-bar') }
    let!(:plugin) do
      create(:email_tool,
             page: page,
             from_email_address: create(:registered_email_address),
             use_member_email: true,
             targets: build_list(:email_tool_target, 1))
    end

    context 'given valid params' do
      let(:params) do
        {
          email: {
            body: 'Lorem ipsum',
            subject: 'A Subject',
            from_email: 'john@email.com',
            from_name: 'John Doe',
            country: 'GB'
          }
        }
      end

      before do
        allow_any_instance_of(Aws::DynamoDB::Client).to receive(:put_item)
      end

      it 'returns 200 OK' 


      it 'sends an email with the expected params' 


      it 'creates an action' 


      it 'creates a member' 


      it 'publishes an event' 

    end

    context 'given invalid params' do
      let(:params) do
        { email: { body: 'Lorem ipsum' } }
      end

      it 'returns 422 Unprocessable entity' 


      it 'returns a json response with the error messages' 

    end
  end
end

