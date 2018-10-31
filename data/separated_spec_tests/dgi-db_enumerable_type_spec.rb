require 'spec_helper'


class EnumerableTypeMockBase

  #next two methods stub out active record methods
  def self.all
    type = 'ABC'
    name = 'A B C'
    (1..10).map { |id| TestRecord.new(id, type.next!.dup, name.next!.dup) }
  end

  def self.inheritance_column=(arg)
  end

  include Genome::Extensions::EnumerableType
  def self.enumerable_cache_key
    'enumerable_type_mock_base'
  end

  TestRecord = Struct.new(:id, :type, :name)
end

class EnumerableTypeWithMultipleTransForms < EnumerableTypeMockBase
  def self.transforms
    [:downcase, [:gsub, ' ', '_']]
  end

  def self.type_column
    :name
  end

  def self.enumerable_cache_key
    'enumerable_type_mock_multiple'
  end
end


describe 'EnumerableType concern' do
  before :each do
    Rails.cache.clear
  end

  it 'should allow you to call a class method with a type name' 


  it 'should transform the type column appropriately' 


  it 'should cache the value of all_types after the first call' 


  it 'should pass methods that are not types along to super' 


  it 'should return the id of the appropriate item' 

end

