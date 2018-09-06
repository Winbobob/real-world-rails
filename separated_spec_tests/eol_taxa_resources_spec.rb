require "spec_helper"

describe 'Taxa page' do

  before(:all) do
    truncate_all_tables
    load_scenario_with_caching(:testy)
    @testy = EOL::TestInfo.load('testy')
    @taxon_concept = @testy[:taxon_concept]
    EOL::Solr::DataObjectsCoreRebuilder.begin_rebuild
  end
  
  it 'should display Citizen science articles when we have them' 

end

