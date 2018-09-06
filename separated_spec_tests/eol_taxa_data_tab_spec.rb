require "spec_helper"

describe 'Taxa data tab basic tests' do
  before(:all) do
    load_foundation_cache
    drop_all_virtuoso_graphs
    @taxon_concept = build_taxon_concept(comments: [], bhl: [], toc: [], sounds: [], youtube: [], flash: [], images: [])
    @target_taxon_concept = build_taxon_concept(comments: [], bhl: [], toc: [], sounds: [], youtube: [], flash: [], images: [])
    @resource = Resource.gen
    @user = User.gen
    @user.grant_permission(:see_data)
    @default_data_options = { subject: @taxon_concept, resource: @resource }
    @measurement = DataMeasurement.new(@default_data_options.merge(predicate: 'http://eol.org/weight',
      object: '12345.0', unit: 'http://eol.org/g'))
    @association = DataAssociation.new(@default_data_options.merge(object: @target_taxon_concept,
      type: 'http://eol.org/preys_on'))
    @user_added_data = UserAddedData.gen(user: @user, subject: @taxon_concept, predicate: 'http://eol.org/length',
      object: '9999.0')
    @master_curator = build_curator(@taxon_concept, level: :master)
    @master_curator.grant_permission(:see_data)
  end

  before(:each) do
    drop_all_virtuoso_graphs
    login_as @user
  end

  it 'should not show data with there is nothing in the triplestore' 


  it 'should display harvested measurements' 


  it 'should display harvested associations' 


  #tramea!
  # it 'should display user added data' do
    # @user_added_data.update_triplestore
    # visit taxon_data_path(@taxon_concept.id)
    # body.should have_selector("table.data tr")
    # body.should have_selector("table.data th div", text: 'Length')
    # body.should have_selector("table.data td", text: '9,999.0')
    # body.should include("provided by <a href=\"/users/#{@user.id}\">#{@user.full_name}</a>")
  # end

  it 'should display known uri labels when available' 


  it 'should display units of measure when explicitly declared' 


  it 'should display units of measure when implied by measurement type' 

  # tramea!
  # it 'should allow master curators to add data' do
    # login_as @master_curator
    # visit taxon_data_path(@taxon_concept.id)
    # Rails.cache.clear
    # body.should_not have_tag("table.data")
    # body.should have_tag("form#new_user_added_data")
    # body.should have_tag("form#new_user_added_data input[@type='submit']", value: "submit data value")
    # within(:xpath, '//form[@id="new_user_added_data"]') do
      # fill_in 'user_added_data_predicate', with: Rails.configuration.uri_term_prefix + 'testingadddata'
      # fill_in 'user_added_data_object', with: 'testingadddata_value'
      # click_button "submit data value"
      # sleep(5)
    # end
    # visit taxon_data_path(@taxon_concept.id)
    # KnownUri.gen_if_not_exists(uri: Rails.configuration.uri_term_prefix + 'testingadddata', name: 'testingadddata')
    # body.should have_tag("table.data")
    # body.should include("testingadddata")
    # body.should include("testingadddata_value")
    # visit('/logout')
  # end

  describe "search" do
    context "clade is searchable" do
      it "should include link to search within clade"
    end
    context "clade is not searchable" do
      it "should include link to search TraitBank without clade"
    end
  end
end

