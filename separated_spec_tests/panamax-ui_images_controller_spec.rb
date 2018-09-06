require 'spec_helper'

describe ImagesController do

  describe 'GET #index' do
    let(:fake_images) { [1, 2] }

    before do
      allow(LocalImage).to receive(:all).and_return(fake_images)
    end

    it 'renders the index view' 


    it 'assigns images' 

  end

  describe 'DELETE #destroy' do
    let(:fake_image) { double(:fake_image, id: 2, destroy: true) }

    before do
      allow(LocalImage).to receive(:find).and_return(fake_image)
    end

    it 'redirects to the listing page' 


    it 'sets a success notice when successful' 


    it 'sets a failure notice when destroy fails' 


    context 'when an error occurs' do

      before do
        allow(LocalImage).to receive(:find).and_raise(StandardError, 'oops')
      end

      it 'redirects the user to the image page' 


      it 'flashes the error message' 

    end
  end

  describe 'DELETE #destroy_multiple' do
    let(:fake_image) { double(:fake_image, id: 1, destroy: true) }

    before do
      allow(LocalImage).to receive(:find_by_id).and_return(fake_image)
    end

    it 'redirects to the listing page' 


    describe 'sets a success notice when' do
      it 'removing single image' 


      it 'removing multiple images' 

    end

    describe 'sets alert notice when' do
      before do
        allow(LocalImage).to receive(:find_by_id).and_raise(StandardError, 'oops')
      end

      it 'flashes the error message' 

    end

    context 'when an error occurs' do
      before do
        allow(LocalImage).to receive(:batch_destroy).and_raise(StandardError, 'oops')
      end

      it 'redirects the user to the image page' 


      it 'flashes the error message' 

    end
  end
end

