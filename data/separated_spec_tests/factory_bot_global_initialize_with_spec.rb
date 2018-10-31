require 'spec_helper'

describe 'global initialize_with' do
  before do
    define_class('User') do
      attr_accessor :name

      def initialize(name)
        @name = name
      end
    end

    define_class('Post') do
      attr_reader :name

      def initialize(name)
        @name = name
      end
    end

    FactoryBot.define do
      initialize_with { new("initialize_with") }

      trait :with_initialize_with do
        initialize_with { new("trait initialize_with") }
      end

      factory :user do
        factory :child_user

        factory :child_user_with_trait do
          with_initialize_with
        end
      end

      factory :post do
        factory :child_post

        factory :child_post_with_trait do
          with_initialize_with
        end
      end
    end
  end

  it 'handles base initialize_with' 


  it 'handles child initialize_with' 


  it 'handles child initialize_with with trait' 


  it 'handles inline trait override' 


  it 'uses initialize_with globally across FactoryBot.define' 

end

