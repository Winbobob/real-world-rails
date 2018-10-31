require 'rails_helper'

RSpec.describe Admin::AccountModerationNotesController, type: :controller do
  render_views

  let(:user) { Fabricate(:user, admin: true) }
  let(:target_account) { Fabricate(:account) }

  before do
    sign_in user, scope: :user
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    context 'when parameters are valid' do
      let(:params) { { account_moderation_note: { target_account_id: target_account.id, content: 'test content' } } }

      it 'successfully creates a note' 

    end

    context 'when parameters are invalid' do
      let(:params) { { account_moderation_note: { target_account_id: target_account.id, content: '' } } }

      it 'falls to create a note' 

    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: note.id } }

    let!(:note) { Fabricate(:account_moderation_note, account: account, target_account: target_account) }
    let(:account) { Fabricate(:account) }

    it 'destroys note' 

  end
end

