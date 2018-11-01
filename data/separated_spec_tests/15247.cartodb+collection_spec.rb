# encoding: utf-8
require 'minitest/autorun'
require_relative '../../../structures/collection'

include DataRepository

describe Collection do
  before do
    @repository = DataRepository::Repository.new
    @dummy_class = Class.new do
      attr_accessor :id
      def initialize(arguments={}); self.id = arguments.fetch(:id); end
      def fetch; self; end
      def to_hash; { id: id }; end
      def ==(other); id.to_s == other.id.to_s; end
    end

    @defaults = { repository: @repository, member_class: @dummy_class}
  end

  describe '#add' do
    it 'adds a member to the collection' 

  end

  describe '#delete' do
    it 'deletes a member from the collection' 

  end #delete

  describe '#each' do
    it 'yields members of the collection as the initialized member_class' 


    it 'returns an enumerator if no block given' 

  end #each

  describe '#fetch' do
    it 'resets the collection with data from the data repository' 


    it 'empties the collection if it was not persisted to the repository' 

  end #fetch

  describe '#store' do
    it 'persists the collection to the data repository' 

  end #store

  describe '#to_json' do
    it 'renders a JSON representation of the collection' 

  end #to_json
end # Collection


