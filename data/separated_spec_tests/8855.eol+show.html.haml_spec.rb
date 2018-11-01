require 'spec_helper'

describe 'taxa/overview/show' do

  before(:all) do
    Language.create_english
    UriType.create_enumerated
    Vetted.create_enumerated
    Visibility.create_enumerated
    License.create_enumerated
    ContentPartnerStatus.create_enumerated
  end

  before(:each) do
    # TODO - generalize these extends for the other view specs.
    taxon_concept = double(TaxonConcept)
    taxon_concept.stub(:id) { 1 }
    taxon_data = double(TaxonData, distinct_predicates: [])
    data = []
    data.stub(:categorize) { {} }
    data.stub(:count) { 0 }
    data.stub(:blank?) { true }
    overview = double(TaxonOverview)
    overview.stub(:taxon_concept) { taxon_concept }
    overview.stub(:media) { [] }
    overview.stub(:map?) { false }
    overview.stub(:iucn_status) { 'lucky' }
    overview.stub(:iucn_url) { 'http://iucn.org' }
    overview.stub(:summary?) { false }
    overview.stub(:details?) { false }
    overview.stub(:collections_count) { 0 }
    overview.stub(:communities_count) { 0 }
    overview.stub(:classification_filter?) { false }
    overview.stub(:classification_curated?) { false }
    overview.stub(:classifications_count) { 0 }
    overview.stub(:curators_count) { 0 }
    overview.stub(:hierarchy_entry) { nil } # This is a little dangerous, but it avoids rendinger the entire node partial..
    overview.stub(:activity_log) { [].paginate } # CHEAT!  :D
    taxon_page = double(TaxonPage, id: 123, scientific_name: 'Aus bus')
    taxon_page.stub(:data) { taxon_data }
    assign(:taxon_page, taxon_page)
    assign(:overview, double(TaxonOverview))
    assign(:overview_data, { })
    assign(:range_data, { })
    assign(:assistive_section_header, 'assist my overview')
    assign(:rel_canonical_href, 'some canonical stuff')
    assign(:overview, overview)
    view.stub(:meta_open_graph_data).and_return([])
    view.stub(:tweet_data).and_return({})
    view.stub(:current_language) { Language.default }
    view.stub(:current_url) { 'http://yes.we/really_have/this-helper.method' }
  end

  context 'logged out' do

    before(:each) do
      user = EOL::AnonymousUser.new(Language.default)
      view.stub(:current_user) { user }
      view.stub(:logged_in?) { false }
    end

    it "should NOT show quick facts when the user doesn't have access (FOR NOW)" 


  end

  context 'logged with see_data permission' do

    before(:each) do
      user = double(User)
      user.stub(:min_curator_level?) { false }
      user.stub(:watch_collection) { nil }
      user.stub(:logo_url) { 'whatever' }
      view.stub(:current_user) { user }
      view.stub(:logged_in?) { false }
      allow(EolConfig).to receive(:data?) { true }
    end

    it "should show quick facts" 


    it "should have a show more link when a row has more data" 


    it "should show statistical method" 


    it "should show life stage" 


    it "should show sex" 


    it "should show combinations of context modifiers" 


  end

end

