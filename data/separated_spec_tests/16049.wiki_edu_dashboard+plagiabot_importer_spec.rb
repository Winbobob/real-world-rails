# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/importers/plagiabot_importer"

describe PlagiabotImporter do
  describe '.check_recent_revisions' do
    it 'saves ithenticate_id for recent suspect revisions' 

  end

  describe '.api_get_url' do
    it 'returns an ithenticate report url for an ithenticate_id' 


    it 'redirects to a 404 page if no url is available' 

  end

  describe '.find_recent_plagiarism' do
    it 'saves ithenticate_id for recent suspect revisions' 


    it 'handles API failures gracefully' 

  end

  describe 'error handling' do
    it 'handles connectivity problems gracefully' 

  end
end

