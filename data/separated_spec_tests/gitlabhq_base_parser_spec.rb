require 'spec_helper'

describe Banzai::ReferenceParser::BaseParser do
  include ReferenceParserHelpers

  let(:user) { create(:user) }
  let(:project) { create(:project, :public) }
  let(:context) { Banzai::RenderContext.new(project, user) }

  subject do
    klass = Class.new(described_class) do
      self.reference_type = :foo
    end

    klass.new(context)
  end

  describe '.reference_type=' do
    it 'sets the reference type' 

  end

  describe '#project_for_node' do
    it 'returns the Project for a node' 

  end

  describe '#nodes_visible_to_user' do
    let(:link) { empty_html_link }

    context 'when the link has a data-project attribute' do
      it 'checks if user can read the resource' 

    end

    context 'when the link does not have a data-project attribute' do
      it 'returns the nodes' 

    end
  end

  describe '#nodes_user_can_reference' do
    it 'returns the nodes' 

  end

  describe '#referenced_by' do
    context 'when references_relation is implemented' do
      it 'returns a collection of objects' 

    end

    context 'when references_relation is not implemented' do
      it 'raises NotImplementedError' 

    end
  end

  describe '#references_relation' do
    it 'raises NotImplementedError' 

  end

  describe '#gather_attributes_per_project' do
    it 'returns a Hash containing attribute values per project' 

  end

  describe '#grouped_objects_for_nodes' do
    it 'returns a Hash grouping objects per node' 


    it 'returns an empty Hash when entry does not exist in the database', :request_store do
      link = double(:link)

      expect(link).to receive(:has_attribute?)
          .with('data-user')
          .and_return(true)

      expect(link).to receive(:attr)
          .with('data-user')
          .and_return('1')

      nodes = [link]
      bad_id = user.id + 100

      expect(subject).to receive(:unique_attribute_values)
          .with(nodes, 'data-user')
          .and_return([bad_id.to_s])

      hash = subject.grouped_objects_for_nodes(nodes, User, 'data-user')

      expect(hash).to eq({})
    end
  end

  describe '#unique_attribute_values' do
    it 'returns an Array of unique values' 

  end

  describe '#process' do
    it 'gathers the references for every node matching the reference type' 

  end

  describe '#gather_references' do
    let(:link) { double(:link) }

    it 'does not process links a user can not reference' 


    it 'does not process links a user can not see' 


    it 'returns the references if a user can reference and see a link' 

  end

  describe '#can?' do
    it 'delegates the permissions check to the Ability class' 

  end

  describe '#find_projects_for_hash_keys' do
    it 'returns a list of Projects' 

  end

  describe '#collection_objects_for_ids' do
    context 'with RequestStore disabled' do
      it 'queries the collection directly' 

    end

    context 'with RequestStore enabled' do
      before do
        cache = Hash.new { |hash, key| hash[key] = {} }

        allow(RequestStore).to receive(:active?).and_return(true)
        allow(subject).to receive(:collection_cache).and_return(cache)
      end

      it 'queries the collection on the first call' 


      it 'does not query previously queried objects' 


      it 'casts String based IDs to Fixnums before querying objects' 


      it 'queries any additional objects after the first call' 


      it 'caches objects on a per collection class basis' 

    end
  end

  describe '#collection_cache_key' do
    it 'returns the cache key for a Class' 


    it 'returns the cache key for an ActiveRecord::Relation' 

  end
end

