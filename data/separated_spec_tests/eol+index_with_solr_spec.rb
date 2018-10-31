require "spec_helper"

describe 'Index With Solr' do

  before(:all) do
    Language.create_english
    @solr_connection = SolrAPI.new($SOLR_SERVER, $SOLR_SITE_SEARCH_CORE)
    @original_index_config = $INDEX_RECORDS_IN_SOLR_ON_SAVE
    $INDEX_RECORDS_IN_SOLR_ON_SAVE = true
  end

  after(:all) do
    # remove callbacks
    class GlossaryTerm < ActiveRecord::Base
      remove_index_with_solr
    end
    $INDEX_RECORDS_IN_SOLR_ON_SAVE = @original_index_config
  end

  it 'should define new methods and set callback functions' 


  it 'should index the object on creation' 


  it 'should update the index records on update' 


  it 'should remove index records on destroy' 


  it 'should index based on methods as well as fields' 


  it 'should throw an error if the field to index on doesnt exist' 

end

