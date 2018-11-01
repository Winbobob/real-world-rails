require 'spec_helper'
require 'support/model_builder'

describe MediaController, :type => :controller do
  include ModelBuilder
  include CustomMatchers
  include MiniMagickConversions

  shared_examples 'photos' do
    before do
      fake_login
    end

    describe '#send_photo_data' do
      it 'should add expires header if timestamp is supplied in query params' 


      it 'should not add expires header for normal requests' 

    end

    describe 'response' do
      it 'should return current photo' 


      it 'should return requested photo' 


      it 'should return current photo resized to a particular size' 


      it 'should return current photo resized to a particular size' 


      it 'should return requested thumbnail' 


      it 'should return no photo available clip when no image is found' 


      it 'should return no photo available clip when no image is found' 


      it 'should redirect to proper cacheable URL if photo ID is not given' 

    end

    describe 'download audio' do
      it 'should return an amr audio file' 


      it 'should return an mp3 audio file' 

    end
  end

  describe 'children photos' do
    it_behaves_like 'photos' do
      let(:model) { 'child' }
      let(:model_class) { 'Child' }
    end
  end

  describe 'enquiries photos' do
    it_behaves_like 'photos' do
      let(:model) { 'enquiry' }
      let(:model_class) { 'Enquiry' }
    end
  end
end

