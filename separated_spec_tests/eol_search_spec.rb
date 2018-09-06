require "spec_helper"

class EOL::NestedSet
 extend EOL::Data
end

require 'solr_api'

def assert_results(options)
  search_string = options[:search_string] || 'tiger'
  per_page = options[:per_page] || 10
  visit("/search?q=#{search_string}&per_page=#{per_page}#{options[:page] ? "&page=#{options[:page]}" : ''}")
  body.should have_selector('#main ul')
  result_index = options[:num_results_on_this_page]
  body.should have_selector("li:nth-child(#{result_index})")
  body.should_not have_selector("li:nth-child(#{result_index + 1})")
end

describe 'Search' do
  before(:all) do
    truncate_all_tables
    load_scenario_with_caching(:search_names)
    data = EOL::TestInfo.load('search_names')

    @panda                      = data[:panda]
    @name_for_all_types         = data[:name_for_all_types]
    @name_for_multiple_species  = data[:name_for_multiple_species]
    @unique_taxon_name          = data[:unique_taxon_name]
    @text_description           = data[:text_description]
    @image_description          = data[:image_description]
    @video_description          = data[:video_description]
    @sound_description          = data[:sound_description]
    @tiger_name                 = data[:tiger_name]
    @tiger                      = data[:tiger]
    @tiger_lilly_name           = data[:tiger_lilly_name]
    @tiger_lilly                = data[:tiger_lilly]
    @tricky_search_suggestion   = data[:tricky_search_suggestion]
    @suggested_taxon_name       = data[:suggested_taxon_name]
    @user1                      = data[:user1]
    @user2                      = data[:user2]
    @community                  = data[:community]
    @collection                 = data[:collection]
    @cms_page                   = data[:cms_page]

    # A taxon with a name we want:
    tc = build_taxon_concept(canonical_form: 'Blueberry cake',
                             comments: [], bhl: [], sounds: [], images: [], youtube: [], flash: [])
    # A trait with the same name:
    kuri = FactoryGirl.create(:known_uri_measurement, name: "Blueberry")
    instance = DataMeasurement.new(predicate: KnownUri.last.uri, :object => "13.8", :resource => Resource.last, :subject => tc)
    instance.add_to_triplestore
    Capybara.reset_sessions!
    visit('/logout')
    EOL::Data.make_all_nested_sets
    EOL::Data.flatten_hierarchies
    ci_solr_api = SolrAPI.new($SOLR_SERVER, $SOLR_COLLECTION_ITEMS_CORE)
    ci_solr_api.delete_all_documents
    EOL::Solr::SiteSearchCoreRebuilder.begin_rebuild
  end

  it 'should redirect to species page if only 1 possible match is found (also for pages/searchterm)' 


  it 'should redirect to search page if a string is passed to a species page' 


  it 'should show a list of possible results (linking to /found) if more than 1 match is found  (also for pages/searchterm)' 


  it 'should be able to return suggested results for "bacteria"' 


  it 'should treat empty string search gracefully when javascript is switched off' 


  it 'should show only common names which include whole search query' 


  it 'should return a helpful message if no results' 


  it 'should place suggested search results at the top of the list' 


  it 'should sort by score by default' 


  it 'should sort by newest and oldest' 


  # the following tests are for redirecting when there is only one result
  it 'should redirect to species page if only 1 possible match is found' 


  it 'should redirect to a text page if only 1 possible match is found' 


  it 'should redirect to an image page if only 1 possible match is found' 


  it 'should redirect to a video page if only 1 possible match is found' 


  it 'should redirect to a sound page if only 1 possible match is found' 


  it 'should redirect to user page if only 1 possible match is found' 


  it 'should redirect to cms page if only 1 possible match is found' 


  it 'should redirect to community page if only 1 possible match is found' 


  it 'should redirect to collection page if only 1 possible match is found' 




  # the following tests are for testing filtering. There is an entry for panda in each category, but only one, so
  # we should get redirected when the filter is on
  it 'should return all results when not filtering' 


  it 'should filter by collection' 


  it 'should filter by community' 


  it 'should filter by image' 


  it 'should filter by sound' 


  it 'should filter by video' 


  it 'should filter by text' 


  it 'should filter by taxon concept' 


  it 'should filter by user' 


  it 'should only show next and previous links when necessary' 


  it 'should properly list matches found on names which are not the preferred names' 


  context 'With a taxon result and a trait result' do

    before do
      visit(search_url(q: 'Blueberry'))
    end

    # Technically, we could check ALL of the other filter types are disabled, but this is a sanity check that is helpful and images aren't going away any
    # time soon.
    it 'gives no_results class to images' 


    it 'does not give a class to all results' 


    context 'when you click on traits' do

      before do
        visit(search_url(q: 'Blueberry', type: ['data']))
      end

      it 'still gives no_results class to images' 


      it 'still does not give a class to all results' 


    end

  end

end

