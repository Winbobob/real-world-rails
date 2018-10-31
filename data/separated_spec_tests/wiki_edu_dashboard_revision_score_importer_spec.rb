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
end

