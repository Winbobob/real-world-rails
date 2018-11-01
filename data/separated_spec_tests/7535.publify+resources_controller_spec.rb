# frozen_string_literal: true

require 'rails_helper'

describe Admin::ResourcesController, type: :controller do
  render_views

  before do
    create(:blog)
    admin = create :user, :as_admin
    sign_in admin
  end

  describe '#index' do
    before do
      get :index
    end

    it 'renders index template' 

  end

  describe '#destroy' do
    let(:uploaded_file) { file_upload('testfile.txt', 'text/plain') }

    it 'redirects to the index' 

  end

  # TODO: Should be create, mkay?
  describe '#upload' do
    before do
      ResourceUploader.enable_processing = true
    end

    after do
      ResourceUploader.enable_processing = false
    end

    context 'when uploading a text file' do
      let(:upload) { file_upload('testfile.txt', 'text/plain') }

      it 'creates a new Resource' 


      it 'sets the content type to text/plain' 


      it 'sets the flash to success' 

    end

    context 'when uploading an image file' do
      let(:upload) { file_upload('testfile.png', 'image/png') }

      it 'creates a new Resource' 


      it 'sets the content type correctly' 


      it 'sets the flash to success' 

    end

    context 'when attempting to upload a dangerous svg' do
      let(:upload) { file_upload('exploit.svg', 'image/svg') }

      it 'does not create a new image Resource' 


      it 'does not attempt to process the image' 


      it 'sets the flash to failure' 

    end

    context 'when attempting to upload a fake png with a txt extension' do
      let(:upload) { file_upload('testfile.txt', 'image/png') }

      it 'does not create a new fake image Resource' 


      it 'does not attempt to process a new fake image Resource' 


      it 'sets the flash to failure' 

    end

    context 'when attempting to upload a fake png with a png extension' do
      let(:upload) { file_upload('fakepng.png', 'image/png') }

      it 'does not create a new fake image Resource' 


      it 'does not attempt to process a new fake image Resource' 


      it 'sets the flash to failure' 

    end

    context 'when uploading nothing' do
      it 'does not create a new Resource' 


      it 'sets the flash to failure' 

    end
  end
end

