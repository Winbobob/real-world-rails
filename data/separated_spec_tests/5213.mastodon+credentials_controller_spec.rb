require 'rails_helper'

describe Api::V1::Accounts::CredentialsController do
  render_views

  let(:user)  { Fabricate(:user, account: Fabricate(:account, username: 'alice')) }
  let(:token) { Fabricate(:accessible_access_token, resource_owner_id: user.id, scopes: scopes) }

  context 'with an oauth token' do
    before do
      allow(controller).to receive(:doorkeeper_token) { token }
    end

    describe 'GET #show' do
      let(:scopes) { 'read:accounts' }

      it 'returns http success' 

    end

    describe 'PATCH #update' do
      let(:scopes) { 'write:accounts' }

      describe 'with valid data' do
        before do
          allow(ActivityPub::UpdateDistributionWorker).to receive(:perform_async)

          patch :update, params: {
            display_name: "Alice Isn't Dead",
            note: "Hi!\n\nToot toot!",
            avatar: fixture_file_upload('files/avatar.gif', 'image/gif'),
            header: fixture_file_upload('files/attachment.jpg', 'image/jpeg'),
            source: {
              privacy: 'unlisted',
              sensitive: true,
            }
          }
        end

        it 'returns http success' 


        it 'updates account info' 


        it 'queues up an account update distribution' 

      end

      describe 'with invalid data' do
        before do
          patch :update, params: { note: 'This is too long. ' * 10 }
        end

        it 'returns http unprocessable entity' 

      end
    end
  end

  context 'without an oauth token' do
    before do
      allow(controller).to receive(:doorkeeper_token) { nil }
    end

    describe 'GET #show' do
      it 'returns http unauthorized' 

    end

    describe 'PATCH #update' do
      it 'returns http unauthorized' 

    end
  end
end

