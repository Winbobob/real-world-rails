require 'rails_helper'

RSpec.describe ExpensePresenter do

  let(:claim)     { create(:claim) }
  let(:expense_type)  { create(:expense_type) }
  let(:expense)       { create(:expense, quantity: 4, claim: claim, expense_type: expense_type) }
  let(:presenter) {ExpensePresenter.new(expense, view) }

  describe '#dates_attended_delimited_string' do

    before {
      claim.expenses .each do |fee|
        expense.dates_attended << create(:date_attended, attended_item: fee, date: Date.parse('21/05/2015'), date_to: Date.parse('23/05/2015'))
        expense.dates_attended << create(:date_attended, attended_item: fee, date: Date.parse('25/05/2015'), date_to: nil)
      end
    }

    it 'outputs string of dates or date ranges separated by comma' 

  end

  describe '#amount' do
    it 'formats as currency' 

  end

  describe '#vat_amount' do
    it 'formats as currency' 

  end

  describe '#total' do
    it 'formats as currency' 

  end

  describe '#distance' do
    it 'formats as decimal number, 2 decimals precision, with rounding' 


    it 'strips insignificant zeros' 

  end

  describe '#hours' do
    it 'formats as decimal number, 2 decimals precision with rounding' 


    it 'strips insignificant zeros' 

  end

  describe '#name' do
    it 'outputs "Not selected" if there is no expense type' 


    it 'outputs the type name is there is an expense type' 

  end

  describe '#display_reason_text_css' do
    def reason_requiring_text
      ExpenseType::REASON_SET_A.map { |reason| reason[1] if reason[1].allow_explanatory_text? }.compact.sample
    end

    it 'should return "none" for expense reasons NOT requiring explanantory' 


    it 'should return "inline-block" for expense reasons requiring explanantory text' 

  end

  describe '#reason' do
    context 'when a specific reason was selected' do
      before do
        expense.reason_id = 1
      end

      it 'outputs the reason text' 

    end

    context 'when Other was selected' do
      before do
        expense.reason_id = 5
      end

      it 'outputs a placeholder text if no free text reason was provided' 


      it 'outputs the free text reason if provided' 

    end
  end

  describe '#mileage_rate' do
    it 'outputs the mileage rate name if any' 


    it 'outputs n/a if no mileage rate was selected' 

  end
end

