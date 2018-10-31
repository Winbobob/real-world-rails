# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/importers/article_importer"

describe ArticleImporter do
  before { stub_wiki_validation }

  let(:en_wiki) { Wiki.default_wiki }
  let(:es_wiki) { create(:wiki, language: 'es', project: 'wikipedia') }

  describe '.import_articles' do
    it 'creates an Article from a English Wikipedia page_id' 


    it 'works for a language besides the default' 

  end

  describe '.import_articles_by_title' do
    it 'creates an Article from a title with the correct mw_page_id' 


    it 'does not create an article if there is no matching title' 


    it 'works for a language besides the default' 

  end
end

