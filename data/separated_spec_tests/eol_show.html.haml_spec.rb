require "spec_helper"

def create_measurement_for_uri(known_uri)
  DataMeasurement.new(subject: TaxonConcept.gen, resource: Resource.gen,
    predicate: known_uri.uri, object: 'whatever').update_triplestore
end

describe 'data_glossary/show' do

  before(:all) do
    drop_all_virtuoso_graphs
    load_foundation_cache
    @user = User.gen
    @user.grant_permission(:see_data)
  end

  before(:each) do
    view.stub(:current_user) { @user }
    view.stub(:current_language) { Language.default }
  end

  it 'only shows measurement URIs which have measurement records' 


  it 'shows URIs exactly the same as created' 

  
  it 'does not show URIs which are hidden from the glossary' 


end

