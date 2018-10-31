# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/wikitext"

describe Wikitext do
  let(:subject) { described_class }

  describe '.markdown_to_mediawiki' do
    it 'returns a wikitext formatted version of the markdown input' 


    it 'renders a list without a blank line preceding it, a la GitHub-style markdown' 


    it 'handles raw links with unicode characters correctly' 

  end

  describe '.replace_code_with_nowiki' do
    it 'converts code formatting syntax from html to wikitext' 


    it 'does not return nil if there are no code snippet' 

  end

  describe '.replace_at_sign_with_template' do
    it 'reformats email addresses' 

  end

  describe '.substitute_bad_links' do
    it 'finds links and munge them into readable non-urls' 

  end

  describe '.assignments_to_wikilinks' do
    let(:en_wiki) { Wiki.find_by(language: 'en', project: 'wikipedia') }
    let(:es_wiki) { create(:wiki, language: 'es', project: 'wikipedia') }
    let(:es_wiktionary) { create(:wiki, language: 'es', project: 'wiktionary') }
    let(:en_wikinews) { create(:wiki, language: 'en', project: 'wikinews') }
    let(:en_wikibooks) { create(:wiki, language: 'en', project: 'wikibooks') }
    let(:pl_wikiquote) { create(:wiki, language: 'pl', project: 'wikiquote') }
    let(:es_wikisource) { create(:wiki, language: 'es', project: 'wikisource') }
    let(:wikidata) { create(:wiki, project: 'wikidata') }
    let(:de_wikiversity) { create(:wiki, language: 'de', project: 'wikiversity') }
    let(:en_wikivoyage) { create(:wiki, language: 'en', project: 'wikivoyage') }
    let(:commons) { create(:wiki, language: 'commons', project: 'wikimedia') }
    # Disabled due to Invalid Project:
    # (`raise InvalidWikiError unless PROJECTS.include?(project)`) in app/models/wiki.rb
    # let(:metawikipedia) { create(:wiki, language: 'en', project: 'metawikipedia') }
    # let(:meta) { create(:wiki, language: 'en', project: 'meta') }
    # let(:wikispecies) { create(:wiki, project: 'wikispecies') }

    let(:assignments) do
      [
        create(:assignment, article_title: 'Selfie'),
        create(:assignment, article_title: 'Category:Photography'),
        create(:assignment, article_title: 'Bishnu Priya'),
        create(:assignment, article_title: 'Blanca de Beaulieu', wiki: es_wiki),
        create(:assignment, article_title: 'agrazarías', wiki: es_wiktionary),
        create(
          :assignment,
          article_title: 'Manned Soyuz space mission aborts during launch',
          wiki: en_wikinews
        ),
        create(:assignment, article_title: 'Q60', wiki: wikidata),
        create(:assignment, article_title: 'Mastering the Kitchen', wiki: en_wikibooks),
        create(:assignment, article_title: 'Theodore Roosevelt', wiki: pl_wikiquote),
        create(:assignment, article_title: 'Novelas y fantasías', wiki: es_wikisource),
        create(:assignment, article_title: 'Mathematik', wiki: de_wikiversity),
        create(:assignment, article_title: 'Previous Featured travel topics', wiki: en_wikivoyage),
        create(:assignment,
               article_title: 'File:Black-headed lapwing (Vanellus tectus tectus).jpg',
               wiki: commons),
        # Disabled due to Invalid Project:
        # (`raise InvalidWikiError unless PROJECTS.include?(project)`) in app/models/wiki.rb
        # create(:assignment, article_title: 'Hardware donation program', wiki: meta)
        # create(:assignment, article_title: 'Wiki4MediaFreedom contest - II edition', wiki: metawik
        # ipedia),
        # create(:assignment, article_title: 'Sitta europaea caesia', wiki: wikispecies),
      ]
    end

    before { stub_wiki_validation }

    it 'converts a set of assignments into wikilink format' 

  end
end

