require 'spec_helper'
require 'support/model_builder'

describe Api::ChildMediaController, :type => :controller do
  include ModelBuilder
  include CustomMatchers
  include MiniMagickConversions
  before do
    fake_login
  end

  shared_examples 'photos' do
    describe 'routing' do
      it 'should have a route for a child current photo' 


      it 'should have a route for a child current recorded audio' 


      it 'should have a route for a child current recorded audio' 


      it 'should have a route for a child specific photo' 

    end

    describe '#send_photo_data' do
      it 'should add expires header if timestamp is supplied in query params' 


      it 'should not add expires header for normal requests' 

    end

    describe 'response' do
      it "should return current child's photo" 


      it "should return requested child's photo" 


      it 'should return no photo available clip when no image is found' 

    end

    describe 'download audio' do
      it 'should return an amr audio file associated with a child' 

      it 'should return an mp3 audio file associated with a child' 

    end
  end

  describe 'child photos' do
    it_behaves_like 'photos' do
      let(:model_class) { 'Child' }
    end
  end

end

