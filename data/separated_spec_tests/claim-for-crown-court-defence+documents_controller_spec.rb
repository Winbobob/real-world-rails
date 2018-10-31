# == Schema Information
#
# Table name: documents
#
#  id                                      :integer          not null, primary key
#  claim_id                                :integer
#  created_at                              :datetime
#  updated_at                              :datetime
#  document_file_name                      :string
#  document_content_type                   :string
#  document_file_size                      :integer
#  document_updated_at                     :datetime
#  external_user_id                        :integer
#  converted_preview_document_file_name    :string
#  converted_preview_document_content_type :string
#  converted_preview_document_file_size    :integer
#  converted_preview_document_updated_at   :datetime
#  uuid                                    :uuid
#  form_id                                 :string
#  creator_id                              :integer
#  verified_file_size                      :integer
#  file_path                               :string
#  verified                                :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
  let(:external_user) { create(:external_user) }
  let(:user) { external_user.user }

  before { sign_in user }

  describe 'GET #index' do
    let(:params) { {} }

    context 'when form_id not present' do
      it 'returns an empty JSON set' 

    end

    context 'when form_id present' do
      let!(:form_id) { SecureRandom.uuid }
      let!(:matching_documents) { create_list(:document, 2, form_id: form_id ) }
      let!(:not_matching_documents) { create_list(:document, 1, form_id: SecureRandom.uuid ) }

      let(:params) { { form_id: form_id } }

      before { get :index, params: params }

      it 'returns documents matching the form_id' 

    end
  end

  describe 'GET #show' do
    let(:document) { create(:document, external_user_id: external_user.id) }

    it 'downloads a preview of the document' 

  end

  describe 'GET #download' do
    let(:document) { create(:document, external_user_id: external_user.id) }

    it 'downloads the document' 

  end

  describe 'POST #create' do
    let(:params) do
      {
        document: Rack::Test::UploadedFile.new(Rails.root + 'features/examples/longer_lorem.pdf', 'application/pdf')
      }
    end

    context 'when valid' do
      it 'creates a document' 


      it 'returns status created' 


      it 'returns the created document as JSON' 

    end

    context 'when invalid' do
      let(:params) { { document: nil } }

      it 'does not create a document' 


      it 'returns status unprocessable entity' 


      it 'returns errors in response' 

    end
  end

  describe 'GET #download' do
    it 'downloads the file' 

  end

  describe 'DELETE #destroy' do
    let!(:document) { create(:document, external_user_id: external_user.id) }

    it 'destroys the document' 


    it 'responds with errors if unable to destroy the document' 

  end

  def binread(path)
    5.times do
      break if File.exist?(path)
      sleep 0.5
    end
    IO.binread(path)
  end

end

