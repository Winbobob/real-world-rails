require 'spec_helper'


describe CalculateTotalRedeemableVacation do

  describe '#total_redeemable_for_year' do
    let(:user) { FactoryGirl.create(:user) }
    let(:year) { 2013 }
    let(:vacation) { CalculateTotalRedeemableVacation.new(user, year) }

    it 'returns the total available vacations for the given year' 


    it 'returns 0 for a year without employment' 


    context 'rounding' do
      it 'handles 55% correctly' 


      it 'handles 53% correctly' 

    end

    context 'multiple employments' do
      before do
        employment = user.employments.first
        employment.workload = 30
        employment.start_date = '2013-01-01'.to_date
        employment.end_date = '2013-03-31'.to_date
        employment.save!

        # create second employment
        FactoryGirl.create(:employment, user: user, workload: 50, start_date: '2013-04-01'.to_date, end_date: '2013-12-31'.to_date)
      end

      it 'returns the correct value for multiple employments' 

    end

    context 'employment starts in the middle of the month' do
      before do
        employment = user.employments.first
        employment.workload = 100
        employment.start_date = '2013-01-21'.to_date
        employment.end_date = '2013-12-31'.to_date
        employment.save!
      end

      it 'returns the reedemable year' 

    end

    context 'adjustments' do
      it 'includes adjustments for vacation' 

    end
  end

end

