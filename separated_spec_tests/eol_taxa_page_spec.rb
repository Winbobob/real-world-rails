require "spec_helper"

# NOTE - I hate this spec. It's really, really hard to debug when something goes wrong. ...if anything is actually wrong.  In
# fact, I wonder if this spec is effectively useless.
#
# UPDATE: Yup, I'm going to say it again: I doubt that this spec proves much of anything. It's brittle, it doesn't show where
# problems really are, it doesn't really help with debugging, and it doesn't show how anything should actually be used. It may
# help *slightly* with confidence that things are working... but I'm not sure how or where. We need to re-write this... which
# is awful.
#
# Moreover, the it.should syntax used below hides (AFAICT) the actual variables being tested. I appreciate the brevity, but
# I'm not sure how to bug-test it. "p puts body" doesn't work, nor does "page.body", nor "@body" (which you would really
# expect, since we're setting it), nor "save_and_open_page"... I'm at a loss. Nor can I find a guide online for how this type
# of test came about.
#
# UPDATE 2: I've decided that, as someone said (not sure where): "feature specs should be about *behaviour*, not about
# *structure*."  ...Use view specs for structure; they are much, much faster (and easier to write). I've taken this to heart and
# am moving the non-behaviour specs out of this file. ...which, I'm guessing, will be all of them...  :\

def remove_classification_filter_if_used
  begin
    click_on 'Remove classification filter'
  rescue
    nil # Sometimes we're in a hierarchy. Oof.
  end
end

describe 'Taxa page' do

  before(:all) do
    # so this part of the before :all runs only once
    unless User.find_by_username('testy_taxa_page_spec')
      truncate_all_tables
      load_scenario_with_caching(:testy)
      User.gen(username: 'testy_taxa_page_spec')
    end
    @testy = EOL::TestInfo.load('testy')
    @taxon_concept = @testy[:taxon_concept]
    @hierarchy_entry = @taxon_concept.published_browsable_hierarchy_entries[0]
    @user = @testy[:user]
    @res = Resource.gen(title: "IUCN Structured Data")
    (DataMeasurement.new(predicate: "<http://rs.tdwg.org/ontology/voc/SPMInfoItems#ConservationStatus>", object: "Wunderbar", resource: @res, subject: @taxon_concept)).add_to_triplestore
    Capybara.reset_sessions!
    Activity.create_enumerated
  end

  shared_examples_for 'taxon details tab' do

    # NOTE - all of these strings come from the scenario loaded above...
    it 'should show links to literature tab' 

    it 'should show links to resources tab' 

    it 'should not show references container if references do not exist' 


    it 'should show actions for text objects' 


    it 'should show action to set article as an exemplar' 


    it 'should show "Add an article or link to this page" button to the logged in users' 

  end

  shared_examples_for 'taxon overview tab' do
    it 'should show a gallery of four images' 

    it 'should have taxon links for the images in the gallery' 


    it 'should have sanitized descriptive text alternatives for images in gallery'

    # TODO
    # it 'should show IUCN Red List status' do
      # expect(page).to have_tag('div#iucn_status a')
    # end

    it 'should show summary text' 


    it 'should show table of contents label when text object title does not exist' 


    it 'should show classifications'
    it 'should show collections'
    it 'should show communities'

    it 'should show curators'
  end

  shared_examples_for 'taxon resources tab' do
    it 'should include About Resources' 

    it 'should include Partner Links' 

  end

  shared_examples_for 'taxon community tab' do
    it 'should include Curators' 

    it 'should include Collections' 

    it 'should include Communities' 

  end

  shared_examples_for 'taxon names tab' do
    it 'should list the classifications that recognise the taxon' 


    it 'should show related names and their sources' 


    it 'should show common names grouped by language with preferred flagged and status indicator' 


    it 'should allow curators to add common names' 


    it 'should allow curators to choose a preferred common name for each language'
    it 'should allow curators to change the status of common names'

    it 'should show synonyms grouped by their source hierarchy' 

  end

  shared_examples_for 'taxon literature tab' do
    it 'should show some references' 

  end

  shared_examples_for 'taxon name - taxon_concept page' do
    it 'should show the concepts preferred name style and ' 

  end

  # NOTE - I changed this, since it was failing. It doesn't look like we show the ital name on other pages...
  shared_examples_for 'taxon common name - hierarchy_entry page' do
    it 'should show the concepts preferred name in the heading' 

  end

  shared_examples_for 'taxon updates tab' do
    it 'should include Taxon newsfeed' 

    it 'should include Page statistics' 

  end

  # overview tab - taxon_concept
  context 'overview when taxon has all expected data - taxon_concept' do
    before(:all) do
      EOL::Solr::DataObjectsCoreRebuilder.begin_rebuild
    end
    it_should_behave_like 'taxon name - taxon_concept page' do
      before { visit taxon_overview_path(@testy[:id]) }
    end
    it_should_behave_like 'taxon overview tab' do
      before { visit taxon_overview_path(@testy[:id]) }
    end
    it 'should allow logged in users to post comment in "Latest Updates" section' 

  end

  # overview tab - hierarchy_entry
  context 'overview when taxon has all expected data - hierarchy_entry' do
    before(:all) do
      EOL::Solr::DataObjectsCoreRebuilder.begin_rebuild
    end
    it_should_behave_like 'taxon common name - hierarchy_entry page' do
      before { visit taxon_entry_overview_path(@taxon_concept, @hierarchy_entry) }
    end
    it_should_behave_like 'taxon overview tab' do
      before { visit taxon_entry_overview_path(@taxon_concept, @hierarchy_entry) }
    end
  end

  # resources tab - taxon_concept
  context 'resources when taxon has all expected data - taxon_concept' do
    it_should_behave_like 'taxon name - taxon_concept page' do
      before { visit("/pages/#{@testy[:id]}/resources") }
    end
    it_should_behave_like 'taxon resources tab' do
      before { visit("/pages/#{@testy[:id]}/resources") }
    end
  end

  # resources tab - hierarchy_entry
  context 'resources when taxon has all expected data - hierarchy_entry' do
    it_should_behave_like 'taxon common name - hierarchy_entry page' do
      before { visit taxon_entry_resources_path(@taxon_concept, @hierarchy_entry) }
    end
    it_should_behave_like 'taxon resources tab' do
      before { visit taxon_entry_resources_path(@taxon_concept, @hierarchy_entry) }
    end
  end

  # details tab - taxon_concept
  context 'details when taxon has all expected data - taxon_concept' do
    before(:all) do
      [:partner_links]
      visit logout_url
      EOL::Solr::DataObjectsCoreRebuilder.begin_rebuild unless
        TaxonDetails.new(@taxon_concept, @testy[:curator]).resources_links.include?(:education)
      login_as @testy[:curator]
    end
    it_should_behave_like 'taxon name - taxon_concept page' do
      before { visit taxon_details_path(@taxon_concept) }
    end
    it_should_behave_like 'taxon details tab' do
      before { visit taxon_details_path(@taxon_concept) }
    end
  end

  # details tab - hierarchy_entry
  context 'details when taxon has all expected data - hierarchy_entry' do
    before(:all) do
      visit logout_url
      EOL::Solr::DataObjectsCoreRebuilder.begin_rebuild unless
        TaxonDetails.new(@taxon_concept, @testy[:curator], @hierarchy_entry).resources_links.include?(:education)
      login_as @testy[:curator]
    end
    it_should_behave_like 'taxon common name - hierarchy_entry page' do
      before { visit taxon_entry_details_path(@taxon_concept, @hierarchy_entry) }
    end
    it_should_behave_like 'taxon details tab' do
      before { visit taxon_entry_details_path(@taxon_concept, @hierarchy_entry) }
    end
  end

  # names tab - taxon_concept
  context 'names when taxon has all expected data - taxon_concept' do
    it_should_behave_like 'taxon name - taxon_concept page' do
      before { visit taxon_names_path(@taxon_concept) }
    end
    it_should_behave_like 'taxon names tab' do
      before { visit taxon_names_path(@taxon_concept) }
    end
  end

  # names tab - hierarchy_entry
  context 'names when taxon has all expected data - hierarchy_entry' do
    it_should_behave_like 'taxon common name - hierarchy_entry page' do
      before { visit taxon_entry_names_path(@taxon_concept, @hierarchy_entry) }
    end
    it_should_behave_like 'taxon names tab' do
      before { visit taxon_entry_names_path(@taxon_concept, @hierarchy_entry) }
    end
  end

  # literature tab - taxon_concept
  context 'literature when taxon has all expected data - taxon_concept' do
    it_should_behave_like 'taxon name - taxon_concept page' do
      before { visit taxon_literature_path(@taxon_concept) }
    end
    it_should_behave_like 'taxon literature tab' do
      before { visit taxon_literature_path(@taxon_concept) }
    end
  end

  # literature tab - hierarchy_entry
  context 'literature when taxon has all expected data - hierarchy_entry' do
    it_should_behave_like 'taxon common name - hierarchy_entry page' do
      before { visit taxon_entry_literature_path(@taxon_concept, @hierarchy_entry) }
    end
    it_should_behave_like 'taxon literature tab' do
      before { visit taxon_entry_literature_path(@taxon_concept, @hierarchy_entry) }
    end
  end


  # community tab
  context 'community tab' do
    it_should_behave_like 'taxon name - taxon_concept page' do
      before { visit(taxon_communities_path(@testy[:id])) }
    end
    it_should_behave_like 'taxon community tab' do
      before { visit(taxon_communities_path(@testy[:id])) }
    end
    it "should render communities - curators page" 

    it "should render communities - collections page" 

    it "should render communities - curators page" 

  end


  context 'when taxon does not have any common names' do
    it 'should not show a common name' 

  end

  # @see 'should render when an object has no agents' in old taxa page spec
  context 'when taxon image does not have an agent' do
    it 'should still render the image'
  end

  context 'when taxon does not have any data' do
    it 'details should show empty text' 

  end

  context 'when taxon supercedes another concept' do
    it 'should use supercedure to find taxon if user visits the other concept' 

  end

  context 'when taxon is unpublished' do
    it 'should deny anonymous user' 

    it 'should deny unauthorised user' 

  end

  context 'when taxon does not exist' do
    it 'should show a missing content error message' 

  end

  context 'updates tab - taxon_concept' do
    it_should_behave_like 'taxon updates tab' do
      before { visit(taxon_updates_path(@taxon_concept)) }
    end
    it 'should allow logged in users to post comment' 

  end

  context 'updates tab - hierarchy_entry' do
    it_should_behave_like 'taxon updates tab' do
      before { visit taxon_entry_updates_path(@taxon_concept, @hierarchy_entry) }
    end
    it 'should allow logged in users to post comment' 

  end
end

