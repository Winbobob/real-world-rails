require 'rails_helper'

describe AttachmentsController, type: :controller do
  describe 'GET #show' do
    let(:an_attachment) { create(:attachment) }

    context 'logged in with standard folder access' do
      include_context 'signed in user'

      it 'can access attachments' 

    end

    context 'not logged in' do
      it 'can not access attachments' 

    end
  end
end

