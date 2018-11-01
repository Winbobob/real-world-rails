# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/commons"

describe Commons do
  describe '.get_uploads' do
    it 'gets upload data for a user with many uploads' 


    it 'gets upload data from a particular time period' 


    it 'handles a user with no uploads' 


    it 'handles a user with one upload' 

  end

  describe '.get_usages' do
    it 'gets usage data for a widely-used file' 


    it 'gets usage data for an unused file' 


    it 'gets usage data for a file used only once' 


    it 'does not fail when missing files are queried' 

  end

  describe '.find_missing_files' do
    let(:deleted_file) { create(:commons_upload, id: 4) }
    let(:existing_file) { create(:commons_upload, id: 20523186) }

    it 'returns CommonsUploads that are reported missing' 


    it 'returns an empty array if all files exist' 

  end

  describe '.get_urls' do
    it 'gets thumbnail url data for files' 


    it 'does not fail for files that have placeholder thumbnails' 

  end

  describe '.api_get' do
    it 'handles typical network errors' 


    it 'raises unexpected errors' 

  end
end

