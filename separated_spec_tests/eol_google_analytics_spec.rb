require "spec_helper"

describe "Google Analytics Stats Page" do

  before(:all) do
    load_foundation_cache
    Capybara.reset_sessions!
    @taxon_concept = build_taxon_concept(comments: [], bhl: [], toc: [], sounds: [], youtube: [], flash: [], images: [])
    @user = User.gen(username: 'anything')
    @user.password = 'whatevs'
    @user.save
    @content_partner = ContentPartner.gen(user: @user)

    last_month = Date.today - 1.month
    @year = last_month.year
    @month = last_month.month
    @partner_summary = GoogleAnalyticsPartnerSummary.gen(year: @year, month: @month, user: @user)
    @summary = GoogleAnalyticsSummary.gen(year: @year, month: @month)
    @page_stats = GoogleAnalyticsPageStat.gen(year: @year, month: @month, taxon_concept: @taxon_concept )
    @partner_taxa = GoogleAnalyticsPartnerTaxon.gen(year: @year, month: @month, taxon_concept: @taxon_concept, user: @user )
  end

  after(:all) do
    truncate_all_tables
  end

  before(:each) do
    login_as(@user)
  end

  after(:each) do
    visit('/logout')
  end

  it "should render monthly_page_stats page" 


  it "should get data from a form and display it" 

  click_button 'Import Ontology'
end

describe 'Ontology Importer' do

  before(:all) do
    load_foundation_cache
    drop_all_virtuoso_graphs
    @user = User.gen
    @user.grant_permission(:see_data)
    @user.grant_admin
  end

  before(:each) do
    KnownUri.destroy_all
    TranslatedKnownUri.destroy_all
    login_as @user
    stub_ontology_request
    # go to the KnownUris page, enter the ontology URL, and click submit
    visit known_uris_path
    fill_in 'ontology_uri', with: 'http://some.ontology'
    click_button 'Import Ontology'
  end

  it 'lists the terms in the ontology' 


  it 'imports the terms' 


  it 'imports with a hide_from_glossary flag' 


end

