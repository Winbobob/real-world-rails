# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Extension: Acts as Condition', type: :model do
  class self::DummyConditionClass < ApplicationRecord
    def self.columns
      []
    end

    def self.load_schema!; end

    acts_as_condition
  end

  describe 'objects which act as conditions' do
    subject { self.class::DummyConditionClass.new }

    it 'implements #title' 


    it 'implements #satisfied_by?' 


    it 'implements #dependent_object' 


    describe 'callbacks' do
      describe 'after condition is saved' do
        context 'when there are changes' do
          it 'rebuild satisfiability graph' 

        end

        context 'when there are no changes' do
          it 'does not rebuild satisfiability graph' 

        end
      end
    end
  end

  describe 'classes which implement acts_as_condition' do
    subject { self.class::DummyConditionClass }

    it 'implements .dependent_class' 


    describe '.evaluate_conditional_for' do
      let(:instance) { Instance.default }
      with_tenant(:instance) do
        let(:course_user) { create(:course_user) }

        it 'returns an ActiveJob' 


        with_active_job_queue_adapter(:test) do
          it 'queues the job' 

        end
      end
    end
  end
end

