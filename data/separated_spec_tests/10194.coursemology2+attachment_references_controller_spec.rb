# frozen_string_literal: true
require 'rails_helper'

RSpec.describe AttachmentReferencesController, type: :controller do
  let(:instance) { Instance.default }

  with_tenant(:instance) do
    let(:user) { create(:administrator) }
    before { sign_in(user) }

    describe '#create' do
      render_views
      let(:file) { fixture_file_upload('files/picture.jpg', 'image/jpeg') }
      let(:filename) { 'Foo' }
      let(:json) { JSON.parse(response.body) }
      subject { post :create, format: :json, params: { file: file, name: filename } }
      before { subject }

      context 'when file is not specified or invalid' do
        subject { post :create, format: :json, params: { name: filename } }

        it 'returns success: false in the response' 

      end

      context 'when file is valid' do
        it 'returns success: true in the response' 


        it 'returns the url of the attachment and id of the attachment_reference' 

      end
    end

    describe '#show' do
      let(:attachment_reference) { create(:attachment_reference) }
      subject { get :show, params: { id: attachment_reference } }

      it { is_expected.to redirect_to(attachment_reference.attachment.url) }
    end
  end
end

