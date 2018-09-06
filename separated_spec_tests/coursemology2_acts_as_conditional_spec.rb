# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Extension: Acts as Conditional', type: :model do
  class self::DummyConditionalClass < ApplicationRecord
    def self.columns
      []
    end

    def self.load_schema!; end

    acts_as_conditional
  end

  class self::DummyConditionClass < ApplicationRecord
    def self.columns
      []
    end

    def self.load_schema!; end

    acts_as_condition
  end

  describe 'objects which act as conditional' do
    subject { self.class::DummyConditionalClass.new }

    it { is_expected.to have_many(:conditions).inverse_of(:conditional) }

    it 'implements #permitted_for!' 


    it 'implements #precluded_for!' 


    describe '#specific_conditions' do
      it 'is of the specific condition type' 

    end

    describe '#conditions_satisfied_by?' do
      let(:satisfied_condition) do
        condition = instance_double(Course::Condition)
        allow(condition).to receive(:satisfied_by?).and_return(true)
        condition
      end
      let(:unsatisfied_condition) do
        condition = instance_double(Course::Condition)
        allow(condition).to receive(:satisfied_by?).and_return(false)
        condition
      end

      context 'all conditions are satisfied' do
        it 'returns true' 

      end

      context 'a condition is not satisfied' do
        it 'returns false' 

      end
    end
  end
end

