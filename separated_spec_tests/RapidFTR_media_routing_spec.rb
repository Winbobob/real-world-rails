require 'spec_helper'

describe MediaController, :type => :routing do

  shared_examples 'routing' do
    describe 'routing' do
      it 'should have a route for manage photos' 


      it 'should have a route for specific photo' 


      it 'should have a route for resized photo' 


      it 'should have a route for specific thumbnail' 


      it 'recognizes thumbnail path without photo_id' 


      it 'should have a route for current recorded audio' 


      it 'should have a route for specific recorded audio' 

    end
  end

  describe 'legacy routing to support old Android APK' do
    it 'should a photos index route' 


    it 'should have a route for current photo' 


    it 'should have a route for requesting a resized version of the current photo' 

  end

  describe 'child_media' do
    it_behaves_like 'routing' do
      let(:model) { 'child' }
      let(:model_id) { 'child_id' }
    end
  end

  describe 'enquiry_media' do
    it_behaves_like 'routing' do
      let(:model) { 'enquiry' }
      let(:model_id) { 'enquiry_id' }
    end
  end
end

