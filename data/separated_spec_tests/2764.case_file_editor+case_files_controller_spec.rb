require 'rails_helper'

RSpec.describe CaseFilesController, type: :controller do
  let(:attributes) {
    {
      raw: Rack::Test::UploadedFile.new(
        Rails.root.join("spec/fixtures/#{json}"))
    }
  }
  let(:json) { 'minimal.json' }

  describe 'GET #index' do
    it 'renders the "index" template' 

  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'assigns an upload' 


      it 'responds with success (200)' 

    end

    context 'with invalid JSON' do
      let(:json) { 'garbage.json' }

      it 'assigns an upload' 


      it 'responds with bad request (400)' 

    end

    context 'with no upload' do
      it 'redirects to the index' 

    end
  end
end

