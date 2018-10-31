require 'rails_helper'

RSpec.describe ExpenseTypePresenter do

  let(:expense)   { build(:expense, expense_type) }
  let(:presenter) { ExpenseTypePresenter.new(expense.expense_type, view) }

  describe '#data_attributes' do
    context 'Car Travel' do
      let(:expense_type) { :car_travel }

      it 'returns the right data attributes' 

    end

    context 'Bike Travel' do
      let(:expense_type) { :bike_travel }

      it 'returns the right data attributes' 

    end

    context 'Train/public transport' do
      let(:expense_type) { :train }

      it 'returns the right data attributes' 

    end

    context 'Parking' do
      let(:expense_type) { :parking }

      it 'returns the right data attributes' 

    end

    context 'Hotel accommodation' do
      let(:expense_type) { :hotel_accommodation }

      it 'returns the right data attributes' 

    end

    context 'Travel time' do
      let(:expense_type) { :travel_time }

      it 'returns the right data attributes' 

    end

    context 'Road or tunnel tolls' do
      let(:expense_type) { :road_tolls }

      it 'returns the right data attributes' 

    end

    context 'Cab fares' do
      let(:expense_type) { :cab_fares }

      it 'returns the right data attributes' 

    end

    context 'Subsistence' do
      let(:expense_type) { :subsistence }

      it 'returns the right data attributes' 

    end
  end
end

