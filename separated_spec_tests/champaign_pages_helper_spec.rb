# frozen_string_literal: true

require 'rails_helper'

describe PagesHelper do
  let(:page) { build :page, id: 77 }

  describe '#page_nav_item' do
    it 'returns li element with link' 

  end

  describe '#toggle_switch' do
    it 'returns link when active' 


    it 'returns link when inactive' 

  end

  describe 'ak_report_url' do
    it 'returns the report url for the passed page uri' 

  end

  describe 'ak_resource_id' do
    it 'parses an ak petition resource uri to an ID' 


    it 'parses an ak donation resource uri to an ID' 


    it 'works without a trailing slash' 

  end

  describe '#prefill_link' do
    it 'prefills link for twitter' 


    it 'prefills link for twitter' 


    it 'prefills nothing for facebook' 

  end

  describe 'serialize' do
    it 'can serialize with a symbol keys and symbol query' 


    it 'can serialize with a symbol keys and string query' 


    it 'can serialize with a string keys and symbol query' 


    it 'can serialize with a string keys and string query' 


    it 'renders empty object if key is missing' 


    it 'renders empty object if value is nil' 


    it 'renders empty string if value is blank' 


    it 'renders empty array if value is empty array' 


    it 'serializes a subhash into appropriate json' 

  end

  describe 'share_card' do
    it 'returns {} if no associated share' 


    it 'returns content of the only share if just one' 


    it 'returns content of last share if multiple' 


    it 'returns the url of the image if one exists' 

  end

  describe 'twitter_meta' do
    it 'has all expected keys' 


    it 'uses title, description, and image from share_card if present' 


    it 'ignores share_card if empty' 


    it 'uses only non-blank elements in share_card' 

  end

  describe 'facebook_meta' do
    it 'has all expected keys' 


    it 'uses title, description, and image from share_card if present' 


    it 'ignores share_card if empty' 


    it 'uses only non-blank elements in share_card' 

  end

  describe 'toggle_featured_link' do
    subject { helper.toggle_featured_link(page) }

    context 'when page is featured' do
      let(:page) { double(featured?: true, to_param: '1', id: '1') }

      describe 'rendering' do
        it 'with correct data-method' 


        it 'with correct path' 

      end
    end

    context 'when page is not featured' do
      let(:page) { double(featured?: false, to_param: '1', id: '1') }

      describe 'rendering' do
        it 'with correct data-method' 


        it 'with correct path' 

      end
    end
  end

  describe '#share_url' do
    let(:button) { double(sp_id: '2', sp_type: 'facebook') }

    it 'returns share url' 

  end
end

