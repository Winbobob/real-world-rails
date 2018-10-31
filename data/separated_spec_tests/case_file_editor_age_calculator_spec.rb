require 'rails_helper'

RSpec.describe AgeCalculator do
  describe 'age' do
    context 'when birthday is a normal day' do
      let(:dob) { Date.new(1980, 6, 7) }

      it 'is correct on birthday' 


      it 'is correct on birthday eve' 


      it 'is correct after birthday' 


      it 'is correct on last day of year' 


      it 'is correct on first day of year' 

    end

    context 'when birthday is a leap year' do
      let(:dob) { Date.new(1980, 2, 29) }

      context 'in a non-leap year' do
        it 'is correct on birthday eve' 


        it 'is correct on day after birthday' 

      end

      context 'in a leap year' do
        it 'is correct on birthday' 


        it 'is correct on birthday eve' 


        it 'is correct on day after birthday' 

      end
    end

    context 'when today is a leap day' do
      let(:today) { Date.new(2000, 2, 29) }

      it 'is correct when birthday is 28 February' 

    end
  end
end

