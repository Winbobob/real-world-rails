require 'rails_helper'

RSpec.describe RedeterminationPresenter do
  let(:claim) { create(:claim, apply_vat: true) }
  let(:rd) { create(:redetermination, fees: 1452.33, expenses: 2455.77, disbursements: 2123.55, claim: claim) }
  let(:presenter) { described_class.new(rd, view) }

  context 'currency fields' do
    let(:currency_pattern) { /£\d,\d{3}\.\d{2}/ }

    it 'totals formatted as currency' 

  end

  context 'when VAT amount is nil' do
    before { allow(rd).to receive(:vat_amount).and_return(nil) }

    it 'should still calculate' 

  end
end

