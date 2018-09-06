require 'rails_helper'

RSpec.describe 'ExpenseV1Validator and ExpenseV2Validator', type: :validator do
  context 'schema_version 2' do
    let(:claim)                       { build :claim }
    let(:expense)                     { build :expense, :train, claim: claim }
    let(:car_travel_expense)          { build(:expense, :car_travel, claim: claim ) }
    let(:bike_travel_expense)         { build(:expense, :bike_travel, claim: claim ) }
    let(:parking_expense)             { build(:expense, :parking, claim: claim ) }
    let(:hotel_accommodation_expense) { build(:expense, :hotel_accommodation, claim: claim) }
    let(:train_expense)               { build(:expense, :train, claim: claim) }
    let(:road_tolls_expense)          { build(:expense, :road_tolls, claim: claim) }
    let(:cab_fares_expense)           { build(:expense, :cab_fares, claim: claim) }
    let(:subsistence_expense)         { build(:expense, :subsistence, claim: claim) }
    let(:travel_time_expense)         { build(:expense, :travel_time, claim: claim) }
    let(:other_reason_type_expense)   { build(:expense, :train, claim: claim, reason_id: 5)}

    before do
      allow(Settings).to receive(:expense_schema_version).and_return(2)
      claim.force_validation = true
    end

    it { should_error_if_equal_to_value(expense, :amount, 200_001, 'item_max_amount') }

    describe '#validate_vat_amount for LGFS claims' do
      let(:claim) { build :litigator_claim, force_validation: true }
      before { expense.amount = 100 }

      it { should_error_if_equal_to_value(expense, :vat_amount, 200_001, 'item_max_amount') }

      it 'is valid if absent' 


      it 'is valid if blank' 


      it 'is valid if zero' 


      it 'is valid if less than the total amount' 


      it 'is invalid if greater than the total amount' 


      it 'is valid if less than VAT% of total amount' 


      it 'is valid if rounded value is less than VAT% of total amount' 


      it 'is invalid if greater than current VAT% of the total amount' 


      it 'is invalid if rounded value greater than current VAT% of the total amount' 


      it 'is invalid if negative' 

    end

    describe '#validate_date' do
      it 'is valid for todays date' 


      it 'is valid for dates in the past' 


      it 'is invalid for dates too far in the past' 


      it 'is invalid for dates in the future' 


      it 'is invalid if absent' 

    end

    describe '#validate_hours' do
      context 'travel time' do
        it 'is invalid if absent' 


        it 'is invalid if zero' 


        it 'is invalid if negative' 


        it 'is invalid if more than two places of decimals' 


        it 'is valid if present and above zero with one place of decimals' 


        it 'is valid if present and above zero with two places of decimals' 


        it 'is valid if present and above zero with no decimals' 

      end

      context 'not travel time' do
        let(:expenses_to_test) { [car_travel_expense, bike_travel_expense, parking_expense, hotel_accommodation_expense, train_expense, road_tolls_expense, cab_fares_expense, subsistence_expense] }

        it 'is invalid if present' 


        it 'is valid if absent' 

      end
    end

    describe 'reason_text' do
      context 'other reason types' do
        it 'should be valid if present' 


        it 'should be invalid if absent' 

      end
    end

    describe '#validate_claim' do
      it { should_error_if_not_present(expense, :claim, 'blank') }
    end

    describe '#validate_expense_type' do
      it { should_error_if_not_present(expense, :expense_type, 'blank') }
    end

    describe '#validate_location' do
      let(:expenses_to_test) { [car_travel_expense, bike_travel_expense, hotel_accommodation_expense, train_expense, road_tolls_expense, cab_fares_expense, subsistence_expense] }

      it 'should be mandatory for everything except parking and travel time ' 


      it 'should be valid when a location specified for everything except parking and travel time' 


      it 'enforces absence for parking' 


      it 'is valid when empty for parking' 

    end

    describe '#validate_reason_id' do
      it 'should be valid with values 1-4 for reason set A' 


      it 'should be valid with value 5 for reason set A with reason text filled' 


      it 'should be invalid with value 5 for reason set A without reason text filled' 


      it 'should be invalid with values 6 and above for reason set A' 


      it 'should be valid with values 1-4 for reason set B' 


      it 'should be invalid with values 5 and above for reason set B' 

    end

    describe '#validate_reason_text' do
      context 'validates presence when reason ID is 5 for reason set A' do
        before do
          expense.expense_type.reason_set = 'A'
          expense.reason_id = 5
        end

        it 'reason text is present' 


        it 'reason text is not present' 

      end

      context 'validates absence when reason ID is other than 5 regardless of the reason set' do
        before do
          expense.reason_id = 3
        end

        it 'reason text is present' 


        it 'reason text is not present' 

      end
    end

    describe '#validate distance' do
      context 'valid' do

        it 'is valid when present for car travel' 


        it 'is valid when present for bike travel' 


        it 'is valid when distance is decimal' 


        it 'is valid when absent for train' 


        it 'is valid when absent for parking' 


        it 'is valid when absent for hotel' 

      end

      context 'invalid' do
        it 'is invalid when absent for car travel' 


        it 'is invalid when zero for car travel' 


        it 'is invalid when negative for car travel' 


        it 'is invalid when present for train' 


        it 'is invalid when zero for train' 


        it 'is invalid when present for parking' 


        it 'is invalid when present for hotel' 

      end
    end

    describe 'validate_mileage_rate_id' do
      context 'not car or bike travel' do
        let(:expenses_to_test) { [parking_expense, travel_time_expense, hotel_accommodation_expense, train_expense, road_tolls_expense, cab_fares_expense, subsistence_expense] }

        it 'is invalid if present' 


        it 'is valid when absent' 

      end

      context 'car travel' do
        it 'is invalid if not a value in the settings' 


        it 'is invalid if bike travel rate' 


        it 'is valid if present for car travel' 


        it 'is invalid if absent' 

      end

      context 'bike travel' do
        it 'is invalid if not a value in the settings' 


        it 'is invalid if car travel rate' 


        it 'is valid if the correct rate for bike travel' 


        it 'is invalid if absent' 

      end
    end
  end

  context 'schema_version 1' do

    let(:claim)      { FactoryBot.build :claim, force_validation: true }
    let(:expense)    { FactoryBot.build :expense, claim: claim, expense_type: build(:expense_type) }

    before(:each) { allow(Settings).to receive(:expense_schema_version).and_return(1) }

    describe '#validate_claim' do
      it { should_error_if_not_present(expense, :claim, 'blank') }
    end
  end
end




