# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/importers/view_importer"

describe ViewImporter do
  before { stub_wiki_validation }

  describe '.update_views_for_article' do
    it 'does not fail if there are no revisions for an article' 

  end

  describe '.update_all_views' do
    let!(:course) do
      create(:course, id: 10001,
                      start: Date.today - 1.week,
                      end: Date.today + 1.week)
    end
    let!(:articles_course) { create(:articles_course, id: 1, course_id: 10001, article_id: 1) }
    let!(:revision) { create(:revision, article_id: 1) }
    let(:en_wiki) { Wiki.default_wiki }
    let(:es_wiki) { create(:wiki, id: 2, language: 'es', project: 'wikipedia') }

    it 'gets view data for all articles' 


    it 'works for non-default wikis' 

  end

  describe '.update_new_views' do
    it 'gets view data for new articles' 

  end
end

