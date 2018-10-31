require 'rails_helper'

describe PageLayoutHelper do
  describe 'page_description' do
    it 'defaults to nil' 


    it 'returns the last-pushed description' 


    it 'squishes multiple newlines' 


    it 'truncates' 


    it 'sanitizes all HTML' 

  end

  describe 'favicon' do
    it 'defaults to favicon.ico' 


    it 'has blue favicon for development' 


    it 'has yellow favicon for canary' 

  end

  describe 'page_image' do
    it 'defaults to the GitLab logo' 


    %w(project user group).each do |type|
      context "with @#{type} assigned" do
        it "uses #{type.titlecase} avatar if available" 


        it 'falls back to the default when avatar_url is nil' 

      end

      context "with no assignments" do
        it 'falls back to the default' 

      end
    end
  end

  describe 'page_card_attributes' do
    it 'raises ArgumentError when given more than two attributes' 


    it 'rejects blank values' 

  end

  describe 'page_card_meta_tags' do
    it 'returns the twitter:label and twitter:data tags' 


    it 'escapes content' 

  end
end

