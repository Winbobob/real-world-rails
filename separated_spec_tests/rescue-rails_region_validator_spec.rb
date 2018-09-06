require 'rails_helper'

RSpec.describe RegionValidator do
  class RegionTest
    include ActiveModel::Validations
    validates_with RegionValidator

    attr_accessor :country
    attr_accessor :region
  end

  describe '#validate' do
    before :each do
      @region_test = RegionTest.new
    end

    it 'requires country to validate' 


    context 'in US regions' do
      before :each do
        @region_test.country = 'USA'
      end

      context 'is not valid when' do
        it 'is fewer than 2 characters' 


        it 'is more than 2 characters' 

      end

      context 'is valid when' do
        it 'is specified' 

      end
    end

    context 'for Candian regions' do
      before :each do
        @region_test.country = 'CAN'
      end

      context 'is not valid when' do
        it 'is fewer than 2 characters' 


        it 'is more than 2 characters' 


        it 'is not a real province' 

      end

      context 'is valid when' do
        it 'is a real province' 

      end
    end
  end
end

