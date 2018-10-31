require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveRecord::AcceptNestedAttributesForMatcher, type: :model do
  it 'accepts an existing declaration' 


  it 'rejects a missing declaration' 


  context 'allow_destroy' do
    it 'accepts a valid truthy value' 


    it 'accepts a valid falsey value' 


    it 'rejects an invalid truthy value' 


    it 'rejects an invalid falsey value' 

  end

  context 'limit' do
    it 'accepts a correct value' 


    it 'rejects a false value' 

  end

  context 'update_only' do
    it 'accepts a valid truthy value' 


    it 'accepts a valid falsey value' 


    it 'rejects an invalid truthy value' 


    it 'rejects an invalid falsey value' 

  end

  def accepting_children(options = {})
    define_model :child, parent_id: :integer
    define_model :parent do
      has_many :children
      accepts_nested_attributes_for :children, options
    end.new
  end

  def children_matcher
    accept_nested_attributes_for(:children)
  end

  def rejecting_children
    define_model :child, parent_id: :integer
    define_model :parent do
      has_many :children
    end.new
  end
end

