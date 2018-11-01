# == Schema Information
#
# Table name: messages
#
#  id                      :integer          not null, primary key
#  body                    :text
#  claim_id                :integer
#  sender_id               :integer
#  created_at              :datetime
#  updated_at              :datetime
#  attachment_file_name    :string
#  attachment_content_type :string
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#

require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  context 'standard sign in' do
    let(:sender) { create(:external_user) }

    before do
      sign_in sender.user
    end

    describe "POST #create" do
      let(:claim) { create(:advocate_claim) }
      let(:message_params) do
        {
          claim_id: claim.id,
          sender_id: sender.user.id,
          body: 'lorem ipsum',
        }
      end

      it 'renders the create js template' 


      context 'when valid' do
        it 'creates a message' 


        context 'when redetermining/awaiting written reasons' do
          it 'redirects to externl users claim show path with messages param and accordion anchor' 

        end
      end

      context 'when invalid' do
        before do
          message_params.delete(:claim_id)
        end

        #TODO: We must handle the fact that if the message cannot be created, there will not be ID to redirect to (redirect_to_url)
        xit 'does not create a message' do
          expect {
            post :create, params: { message: message_params }
          }.to_not change(Message, :count)
        end
      end
    end

    describe 'GET #download_attachment' do
      context 'when message has attachment' do
        subject { create(:message, :with_attachment) }

        it 'returns the attachment file' 

      end

      context 'when message does not have attachment' do
        subject { create(:message) }

        it 'redirects to 500 page' 

      end
    end
  end


  context 'email notifications' do
    let(:claim) { create :claim }
    let(:message_params) { message_params = { claim_id: claim.id, sender_id: sender.user.id, body: 'lorem ipsum' } }

    context 'external_user_sending_messages' do

      let(:sender) { claim.creator }

      context 'claim creator is set up to receive mails' do
        it 'does not attempt to send an email' 

      end

      context 'claim creator is set up NOT to receive mails' do
        it 'does not attempt to send an email' 

      end
    end

    context 'case_worker_sending_messages' do

      let(:sender) { create :case_worker}

      context 'claim creator is set up to receive mails' do
        it 'sends an email' 


        context 'but has been deleted' do
          before do
            claim.creator.email_notification_of_message = 'true'
            claim.creator.soft_delete
            sign_in sender.user
          end

          it 'does not send an email' 

        end
      end
      context 'external_user_is_not_setup_to_recieve_emails' do
        it 'does not send an email' 

      end
    end
  end


end

