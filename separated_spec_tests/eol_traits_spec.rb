require File.dirname(__FILE__) + '/../../spec_helper'

describe 'API:traits' do
  before(:all) do
    load_foundation_cache
    drop_all_virtuoso_graphs
    @taxon_concept = build_taxon_concept(
      hierarchy_entry: HierarchyEntry.gen(rank: Rank.gen_if_not_exists(label: 'species')),
      comments: [], bhl: [], toc: [], sounds: [], youtube: [], flash: [], images: [])
    @target_taxon_concept = build_taxon_concept(comments: [], bhl: [], toc: [], sounds: [], youtube: [], flash: [], images: [])
    @resource = Resource.gen
    @default_data_options = { subject: @taxon_concept, resource: @resource }
    KnownUri.gen_if_not_exists({ uri: 'http://eol.org/weight', name: 'Weight' })
    KnownUri.gen_if_not_exists({ uri: 'http://eol.org/preys_on', name: 'Preys On' })
    @measurement = DataMeasurement.new(@default_data_options.merge(predicate: 'http://eol.org/weight',
      object: '12345.0', unit: KnownUri.grams.uri))
    @measurement.update_triplestore
    @association = DataAssociation.new(@default_data_options.merge(object: @target_taxon_concept,
      type: 'http://eol.org/preys_on'))
    @association.update_triplestore
  end

  # not logging API anymore!
  # it 'creates an API log including an API key' do
    # user = User.gen(api_key: User.generate_key)
    # check_api_key("/api/traits/#{@taxon_concept.id}?key=#{user.api_key}", user)
  # end

  it 'renders a JSON response' 


  it 'adds metadata URIs to context' 

end
