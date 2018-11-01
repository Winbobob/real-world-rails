require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveRecord::HaveDbColumnMatcher, type: :model do
  it 'accepts an existing database column' 


  it 'rejects a nonexistent database column' 


  context '#of_type' do
    it 'accepts a column of correct type' 


    it 'rejects a nonexistent database column' 


    it 'rejects a column of wrong type' 

  end

  context 'with precision option' do
    it 'accepts a column of correct precision' 


    it 'rejects a column of wrong precision' 

  end

  context 'with limit option' do
    it 'accepts a column of correct limit' 


    it 'rejects a column of wrong limit' 

  end

  context 'with default option' do
    it 'accepts a column with correct default' 


    it 'rejects a column with wrong default' 

  end

  context 'with null option' do
    it 'accepts a column of correct null' 


    it 'rejects a column of wrong null' 

  end

  context 'with scale option' do
    it 'accepts a column of correct scale' 


    it 'rejects a column of wrong scale' 

  end

  context 'with primary option' do
    it 'accepts a column that is primary' 


    it 'rejects a column that is not primary' 

  end

  def model(options = {})
    define_model(:employee, options).new
  end

  def with_table(column_name, column_type, options)
    create_table 'employees' do |table|
      table.__send__(column_type, column_name, options)
    end
    define_model_class('Employee').new
  end
end

