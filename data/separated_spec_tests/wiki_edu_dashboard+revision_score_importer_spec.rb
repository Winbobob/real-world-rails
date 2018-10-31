# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/importers/revision_score_importer"

describe RevisionScoreImporter do
  before do
    create(:article,
           id: 45010238,
           mw_page_id: 45010238,
           title: 'Manspreading',
           namespace: 0)
    create(:revision,
           mw_rev_id: 675892696, # latest revision as of 2015-08-19
           article_id: 45010238,
           mw_page_id: 45010238)
    create(:revision,
           mw_rev_id: 641962088, # first revision, barely a stub
           article_id: 45010238,
           mw_page_id: 45010238)
    create(:revision,
           mw_rev_id: 1, # arbitrary deleted revision
           deleted: true,
           article_id: 45010238,
           mw_page_id: 45010238)

    create(:article,
           id: 1538038,
           mw_page_id: 1538038,
           title: 'Performativity',
           namespace: 0)
    create(:revision,
           mw_rev_id: 662106477, # revision from 2015-05-13
           article_id: 1538038,
           mw_page_id: 1538038)
    create(:revision,
           mw_rev_id: 46745264, # revision from 2006-04-03
           article_id: 1538038,
           mw_page_id: 1538038)
    create(:revision,
           mw_rev_id: 777777777, # does not exist
           article_id: 1538038,
           mw_page_id: 1538038)
  end

  it 'saves wp10 scores and features for revisions' 


  it 'saves wp10 scores by article' 


  it 'marks TextDeleted revisions as deleted' 


  it 'marks RevisionNotFound revisions as deleted' 


  it 'does not try to query deleted revisions' 


  it 'handles network errors gracefully' 


  # This probably represents buggy behavior from ores.
  it 'handles revisions that return an array' 


  describe '#update_previous_wp10_scores' do
    it 'saves the wp10_previous score for a set of revisions' 

  end

  describe '#fetch_ores_data_for_revision_id' do
    let(:rev_id) { 860858080 } # https://en.wikipedia.org/w/index.php?title=Hamlin_Park&oldid=860858080
    let(:subject) { described_class.new.fetch_ores_data_for_revision_id(rev_id) }

    it 'returns a hash with a predicted rating and features' 

  end

  context '.update_revision_scores_for_all_wikis' do
    before do
      stub_wiki_validation
      RevisionScoreImporter::AVAILABLE_WIKIPEDIAS.each do |lang|
        wiki = Wiki.get_or_create(language: lang, project: 'wikipedia')
        article = create(:article, wiki: wiki)
        create(:revision, article: article, wiki: wiki, mw_rev_id: 12345)
      end
    end

    it 'imports data and calcuates an article completeness score for available wikis' 

  end

  context 'for a wiki without the articlequality model' do
    it 'raises an error' 

  end
end

