require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveRecord::HaveDbIndexMatcher, type: :model do
  context 'have_db_index' do
    it 'accepts an existing index' 


    it 'rejects a nonexistent index' 

  end

  context 'have_db_index with unique option' do
    it 'accepts an index of correct unique' 


    it 'rejects an index of wrong unique' 

  end

  context 'have_db_index on multiple columns' do
    it 'accepts an existing index' 


    it 'rejects a nonexistent index' 

  end

  it 'join columns with and when describing multiple columns' 


  it 'describes a unique index as unique' 


  it 'describes a unique index as unique when no argument is given' 


  it 'describes a non-unique index as non-unique' 


  it "does not display an index's uniqueness when it's not important" 


  it 'allows an IndexDefinition to have a truthy value for unique' 


  def with_index_on(column_name, index_options = {})
    create_table 'employees' do |table|
      table.integer column_name
    end.add_index(:employees, column_name, index_options)
    define_model_class('Employee').new
  end
end

