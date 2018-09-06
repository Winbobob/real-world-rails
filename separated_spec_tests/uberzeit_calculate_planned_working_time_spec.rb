require 'spec_helper'

describe CalculatePlannedWorkingTime do

  let(:calculator) { CalculatePlannedWorkingTime.new(date_or_range, user) }
  let(:calculator_enforce_fulltime) { CalculatePlannedWorkingTime.new(date_or_range, user, fulltime: true) }
  let(:user) { FactoryGirl.create(:user, with_employment: false) }

  describe 'with a date' do
    let(:date_or_range) { '2013-03-06'.to_date }

    it 'returns the planned work for a full time employment' 


    it 'returns the planned work for a part time employment' 


    it 'returns zero if the user did not have an employment' 


    context 'when enforcing all employments to be full time employments' do
      it 'returns the planned work (but treats the part time employment as a full time employment)' 

    end
  end

  shared_examples_for 'range' do
    it 'returns the planned work for a full time employment' 


    it 'returns the planned work for a part time employment' 


    it 'returns zero if the user did not have an employment' 


    context 'when enforcing all employments to be full time employments' do
      it 'returns the planned work (but treats the part time employment as a full time employment)' 

    end
  end

  describe 'exclusive range' do
    let(:date_or_range) { '2013-03-04'.to_date...'2013-03-09'.to_date }
    it_behaves_like 'range'
  end

  describe 'inclusive range' do
    let(:date_or_range) { '2013-03-04'.to_date..'2013-03-09'.to_date }
    it_behaves_like 'range'
  end


  describe 'special case: employment starts in the middle of the month' do
    let(:date_or_range) { '2013-01-01'.to_date..'2013-01-31'.to_date }

    it 'returns the planned work for part time employment which starts in the middle of the month' 

  end

  describe '#total_per_date' do
    let(:date_or_range) { '2013-03-03'.to_date..'2013-03-04'.to_date }

    it 'returns the calculated planned work time per day' 

  end
end

