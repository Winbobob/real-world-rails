require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveRecord::AssociationMatchers::ModelReflection do
  it 'delegates other methods to the given Reflection object' 


  describe '#associated_class' do
    it 'returns the model that the association refers to' 

  end

  describe '#through?' do
    it 'returns true if the reflection is for a has_many :through association' 


    it 'returns false if not' 

  end

  describe '#join_table_name' do
    context 'when the association was defined with a :join_table option' do
      it 'returns the value of the option' 

    end

    context 'when the association was not defined with :join_table' do
      it 'returns the default join_table that ActiveRecord generates' 

    end
  end

  describe '#association_relation' do
    if rails_4_x?
      context 'when the reflection object has a #scope method' do
        context 'when the scope is a block' do
          it 'executes the block in the context of an empty scope' 

        end

        context 'when the scope is nil' do
          it 'returns an empty scope' 

        end
      end
    end

    if rails_3_x?
      context 'when the reflection object does not have a #scope method' do
        context 'when the reflection options contain :conditions' do
          it 'creates an ActiveRecord::Relation from the conditions' 

        end

        context 'when the reflection options contain :order' do
          it 'creates an ActiveRecord::Relation from the order' 

        end

        context 'when the reflection options contain :include' do
          it 'creates an ActiveRecord::Relation from the include' 

        end

        context 'when the reflection options contain :group' do
          it 'creates an ActiveRecord::Relation from the group' 

        end

        context 'when the reflection options contain :having' do
          it 'creates an ActiveRecord::Relation from the having' 

        end

        context 'when the reflection options contain :limit' do
          it 'creates an ActiveRecord::Relation from the limit' 

        end

        context 'when the reflection options contain :offset' do
          it 'creates an ActiveRecord::Relation from the offset' 

        end

        context 'when the reflection options contain :select' do
          it 'creates an ActiveRecord::Relation from the select' 

        end
      end
    end
  end
end

