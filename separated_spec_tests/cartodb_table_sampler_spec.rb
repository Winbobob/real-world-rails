# encoding: utf-8

require_relative '../../lib/importer/table_sampler'
require_relative '../../../../spec/rspec_configuration.rb'

# Open the class for adition of some stuff used only for testing
class CartoDB::Importer2::TableSampler

  def ids_count= n
    @ids_count = n
  end

  def min_id= n
    @min_id = n
  end

  def max_id= n
    @max_id = n
  end

  def min_max_ids= h
    @min_max_ids = h
  end


  public :sample_query, :sample_indices, :sample_indices_add_method, :sample_indices_delete_method
  public :min_id, :max_id, :min_max_ids_query, :ids_count

end


describe CartoDB::Importer2::TableSampler do

  describe '#sample_query' do
    it 'should return the whole dataset if sample_size >= rows' 


    it 'should have a WHERE clause if sample_size < rows' 

  end

  describe '#sample_indices' do
    it 'should add indices to the null set if the space of candidates is bigger than sample size' 


    it 'should remove indices from the index space when sample size is comparable to index space' 

  end

  describe '#sample_indices_add_method' do
    it 'should return x indices in the search space' 

  end

  describe '#sample_indices_delete_method' do
    it 'should return x indices in the search space' 

  end

  describe '#min_max_ids_query' do
    it 'should get the min and max ids of the ids_column' 

  end

  describe '#ids_count' do
    it 'should return 0 if there is no min_id nor max_id' 

  end

end

