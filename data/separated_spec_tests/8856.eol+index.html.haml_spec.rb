require "spec_helper"

describe 'taxa/data/index' do

  def assign_nothing
    assign(:assistive_section_header, 'whatever')
    assign(:recently_used, nil)
    assign(:taxon_page, @taxon_page)
    # assign(:taxon_data, @taxon_page.data)
    @data = []
    @data.stub(:empty?).and_return(false)
    assign(:data_point_uris, @data)
    assign(:toc_id, nil)
    assign(:selected_data_point_uri_id, nil)
    # assign(:categories, TocItem.for_uris(Language.english).select{ |toc| @taxon_page.data.categories.include?(toc) })
    assign(:toc_id, nil)
    assign(:supress_disclaimer, true)
    assign(:range_data, [])
    assign(:glossary_terms, [])
    assign(:units_for_select, KnownUri.default_units_for_form_select)
  end

  before(:all) do
    load_foundation_cache
    Visibility.create_enumerated
    Vetted.create_enumerated
    CuratorLevel.create_enumerated
    KnownUri.create_enumerated
    UriType.create_enumerated
    License.create_enumerated
    ContentPartnerStatus.create_enumerated
    Language.create_english # :\
    @anonymous = EOL::AnonymousUser.new('en')
    @curator = FactoryGirl.create(:curator)
    @taxon = TaxonConcept.gen()
  end

  before(:each) do
    view.stub(:meta_open_graph_data).and_return([])
    view.stub(:tweet_data).and_return({})
  end

  describe '(logged out)' do

    before(:each) do
      @taxon_page = TaxonUserClassificationFilter.new(@taxon, @anonymous)
      view.stub(:current_user).and_return(@anonymous)
      assign_nothing
    end

    it 'should NOT show the key' 


  end

  describe '(as a full curator)' do

    before(:each) do
      @taxon_page = TaxonUserClassificationFilter.new(@taxon, @curator)
      view.stub(:current_user).and_return(@curator)
      assign_nothing
    end

    it 'should show the key' 


  end

  context 'logged in' do

    before(:each) do
      taxon_concept = build_stubbed(TaxonConcept)
      taxon_concept.stub(:latest_version) { taxon_concept }
      taxon_data = double(TaxonData, taxon_concept: taxon_concept, bad_connection?: false)
      taxon_data.stub(:get_data) { [] }
      taxon_page = double(TaxonPage)
      taxon_page.stub(:scientific_name) { 'Arspecius viewicaa' }
      taxon_page.stub(:id) { 1 }
      assign(:taxon_page, taxon_page)
      assign(:taxon_data, taxon_data)
      assign(:toc_id, nil)
      assign(:selected_data_point_uri_id, nil)
      assign(:supress_disclaimer, true) # I don't even know what this is.  remove it?
      assign(:assistive_section_header, 'assist my taxon_data')
      assign(:categories, [])
      assign(:glossary_terms, [])
      assign(:range_data, [])
      assign(:include_other_category, true)
      assign(:units_for_select, KnownUri.default_units_for_form_select)
      user = build_stubbed(User)
      view.stub(:current_user) { user }
      view.stub(:current_language) { Language.default }
      view.stub(:logged_in?) { false }
      @ku = FactoryGirl.build(:known_uri_unit)
      FactoryGirl.build(:translated_known_uri, name: 'chucks', known_uri: @ku)
      @tc = TaxonConcept.gen
    end

    context "without data_point_uris" do
      before :each do
        dpu_min = DataPointUri.gen(unit_of_measure_known_uri: @ku,
                                object: "10",
                                taxon_concept: @tc,
                                vetted: Vetted.trusted,
                                visibility: Visibility.visible)
        dpu_max = DataPointUri.gen(unit_of_measure_known_uri: @ku,
                                object: "100",
                                taxon_concept: @tc,
                                vetted: Vetted.trusted,
                                visibility: Visibility.visible)
        dpu_min.reload
        dpu_max.reload
        ranges = {attribute: @ku, min: dpu_min, max: dpu_max}
        assign(:range_data, [ranges])
        assign(:data_point_uris, [])
      end
      it "go to data_summaries subtab by default" 

    end

    context 'with data' do
      before(:each) do
        @data_point_uris = []
        for i in 0..10
          @data_point_uris << DataPointUri.gen(unit_of_measure_known_uri: @ku,
                                              object: i.to_s,
                                              taxon_concept: @tc,
                                              vetted: Vetted.trusted,
                                              visibility: Visibility.visible)
        end
        curator = User.gen(curator_level_id: 1, curator_approved: 1, :credentials => 'Blah', :curator_scope => 'More blah')
        session[:user_id] = curator.id
        allow(controller).to receive(:current_user) { curator }
        @comment = Comment.gen(parent_id: @data_point_uris[0].id, parent_type: "DataPointUri", body: "This is a comment")
        assign(:data_point_uris, @data_point_uris)
      end

      it "should NOT show units when undefined" 


      it "should show units when defined" 


      it "should show statistical method" 


      it "should show life stage" 


      it "should show sex" 


      it "should show sex and life stage together" 


      it "displays the comment" 


      it "displays date of comment" 


      it "should not display show 1 more" 


      it "display show n more" 


    end
    context "treat values as strings" do

      before(:all) do
        @known_uri = KnownUri.gen_if_not_exists(uri: Rails.configuration.uri_term_prefix+"verbatim_uri", value_is_verbatim: true)
        @big_value = "199999999999.99999999"
      end

      it "doesn't format data value for verbatim known uris" 


      it "doesn't format data value for verbatim known uris" 

    end
  end
end

