require 'rails_helper'

RSpec.describe Fee::BaseFeePresenter do

  let(:claim)     { create(:advocate_claim) }
  let(:fee_type)  { create(:basic_fee_type, description: 'Basic fee type C') }
  let(:fee)       { create(:basic_fee, quantity: 4, claim: claim, fee_type: fee_type) }
  let(:presenter) {Fee::BaseFeePresenter.new(fee, view) }

  describe '#dates_attended_delimited_string' do

    before {
      claim.fees.each do |fee|
        fee.dates_attended << create(:date_attended, attended_item: fee, date: Date.parse('21/05/2015'), date_to: Date.parse('23/05/2015'))
        fee.dates_attended << create(:date_attended, attended_item: fee, date: Date.parse('25/05/2015'), date_to: nil)
      end
    }

    it 'outputs string of dates or date ranges separated by comma' 

  end

  describe '#quantity' do
    context 'quantity  is decimal' do
      it 'returns a decimal quantity' 

    end

    context 'quantity is not decimal' do

      before(:each) { allow(fee).to receive(:quantity_is_decimal?).and_return(false) }

      context 'valid' do
        it 'returns an integer quantity' 

      end

      context 'invalid' do
        it 'returns decimal quantity' 

      end
    end
  end

  describe '#amount' do
    it 'formats as currency' 

  end

  describe '#date' do
    it 'formats as date' 


    it 'returns nil if date attribute is nil' 

  end

  describe '#rate' do
    context 'calculated fees' do
      it 'rounds to 2 decimal places in string format' 

    end
    context 'for uncalculated fees' do
      it 'outputs placeholder html indicating rate is not applicable' 

    end
  end

  describe '#section_header' do
    context 'NOT PPE and NPW fees' do
      it 'outputs fee type description' 

    end
    context 'PPE and NPW fees' do
      it 'outputs header' 


      it 'outputs hint' 

    end
  end

end

