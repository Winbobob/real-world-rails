require File.dirname(__FILE__) + '/../../spec_helper'

describe EOL::Sparql do

  before(:all) do
    truncate_all_tables
    populate_tables(:visibilities, :uri_types)
    # UriType.create_enumerated
  end

  before(:each) do
    KnownUri.destroy_all
    TranslatedKnownUri.destroy_all
    KnownUriRelationship.destroy_all
    KnownUri.gen_if_not_exists(uri: Rails.configuration.uri_measurement_unit, name: 'unit_of_measure')
    # clear the cached version of KnownUri.unit_of_measure before each spec
    KnownUri.remove_class_variable('@@unit_of_measure') if KnownUri.class_variable_defined?('@@unit_of_measure')
  end

  it 'should create a connection' 


  it 'should to_underscore' 


  it 'should uri_to_readable_label' 


  it 'should explicit_measurement_uri_components' 


  it 'should implicit_measurement_uri_components' 


  it 'should implied_unit_of_measure_for_uri' 


  it 'should is_known_unit_of_measure_uri?' 


  it 'should uri_components' 


  it 'should is_uri' 


  it 'should enclose_value' 


  it 'should expand_namespaces' 


  it 'should convert' 


  # moved the feature ro tramea!
  # it 'should count_triples_in_graph' do
    # drop_all_virtuoso_graphs
    # EOL::Sparql.count_triples_in_graph("fictional_graph").should == 0
    # EOL::Sparql.count_triples_in_graph(UserAddedData::GRAPH_NAME).should == 0
    # UserAddedData.gen
    # EOL::Sparql.count_triples_in_graph(UserAddedData::GRAPH_NAME).should == 5
  # end
end


