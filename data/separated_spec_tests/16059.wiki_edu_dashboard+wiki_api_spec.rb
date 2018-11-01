# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/wiki_api"

describe WikiApi do
  describe 'error handling' do
    let(:subject) { described_class.new.get_page_content('Ragesoss') }

    it 'handles mediawiki 503 errors gracefully' 


    it 'handles timeout errors gracefully' 


    it 'handles API errors gracefully' 


    it 'handles HTTP errors gracefully' 


    it 're-raises unexpected errors' 

  end

  describe '#get_page_content' do
    it 'returns the content of a page' 


    # This is really a test that Used#talk_page is returning the format
    # expected by the API, and not a URL-encoded page title.
    it 'gets the content of a user talk page with special characters' 

  end

  describe '#fetch_all' do
    it 'returns the same data as a single complete query would' 

  end

  describe '#get_article_ratings' do
    it 'returns the ratings of articles' 

  end

  describe '#get_user_id' do
    context 'for an English Wikipedia users' do
      let(:wiki) { Wiki.new(language: 'en', project: 'wikipedia') }

      it 'returns the correct user_id for all types of usernames' 

    end

    context 'for a Spanish Wikipedia user' do
      let(:wiki) { Wiki.new(language: 'es', project: 'wikipedia') }
      let(:username) { 'Ragesoss' }

      it 'returns the correct user_id' 

    end

    it 'returns nil for usernames that do not exist' 

  end

  describe '#redirect?' do
    let(:wiki) { Wiki.new(language: 'en', project: 'wikipedia') }
    let(:subject) { described_class.new(wiki).redirect?(title) }

    context 'when title is a redirect' do
      let(:title) { 'Athletics_in_Epic_Poetry' }

      it 'returns true' 

    end

    context 'when title is not a redirect' do
      let(:title) { 'Selfie' }

      it 'returns false' 

    end

    context 'when title does not exist' do
      let(:title) { 'THIS_PAGE_DOES_NOT_EXIST' }

      it 'returns false' 

    end

    context 'when no data is returned' do
      let(:title) { 'Athletics_in_Epic_Poetry' }

      it 'returns false' 

    end
  end
end

