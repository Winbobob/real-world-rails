require 'rails_helper'

RSpec.describe PostalCodeValidator do
  class PostalCodeTest
    include ActiveModel::Validations
    validates_with PostalCodeValidator

    attr_accessor :country
    attr_accessor :postal_code
  end

  describe '#validate' do
    before :each do
      @postal_code_test = PostalCodeTest.new
    end

    it 'can be blank' 


    it 'requires country if not blank' 


    context 'for US addresses' do
      before :each do
        @postal_code_test.country = 'USA'
      end

      context 'is not valid when' do
        it 'is fewer than 5 digits' 


        it 'is between 5 and 9 digits' 


        it 'is more than 9 digits' 


        it 'is 9 digits without a dash' 

      end

      context 'is valid when' do
        it 'is 5 digits' 


        it 'is 5 digits then a dash then 4 digits' 

      end
    end

    context 'for Canadian addresses' do
      before :each do
        @postal_code_test.country = 'CAN'
      end

      context 'is not valid when' do
        it 'it is not a postal code' 


        it 'it is an invalid postal code' 


        it 'it is 5 characters' 


        it 'it is 7 characters' 

      end

      context 'is valid when' do
        it 'is 6 valid characters' 

      end
    end
  end
end

