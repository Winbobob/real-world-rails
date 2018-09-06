require File.dirname(__FILE__) + '/../../spec_helper'

def details_do_index
  get :index, :taxon_id => @testy[:taxon_concept].id.to_i
end

describe Taxa::DetailsController do

  before(:all) do
    load_foundation_cache
    Vetted.create_enumerated
    @testy = {}
    @testy[:overview] = TocItem.overview
    @testy[:overview_text] = 'This is a test Overview'
    @testy[:image] = FactoryGirl.generate(:image)
    @testy[:taxon_concept] =  build_taxon_concept(images: [{object_cache_url: @testy[:image], data_rating: 2}],
                              toc: [{toc_item: @testy[:overview], description: @testy[:overview_text]}], sname: [], comments: [],
                              flash: [], sounds: [], bhl: [], biomedical_terms: nil)
    @testy[:user] = User.gen
    @testy[:curator] = build_curator(@testy[:taxon_concept] )
    EOL::Solr::DataObjectsCoreRebuilder.begin_rebuild
  end

  describe 'GET index' do

    it 'should instantiate the taxon concept' 

    it 'should instantiate the details Array containing text data objects and special content' 

    it 'should instantiate an assistive header' 


    it 'should add make an entry in the table of contents for Education Resources objects' 


    it 'should add make an entry in the table of contents for Education objects' 


  end

  describe 'GET set_article_as_exemplar' do

    it 'should throw error if user is not logged in' 


    it 'should throw error if user is not curator' 


    it 'should instantiate the taxon concept and the data object' 


  end

end

