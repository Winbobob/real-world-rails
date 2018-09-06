require 'rails_helper'

RSpec.describe AssessmentPresenter do
  let(:claim) { create(:claim, apply_vat: true) }
  let(:presenter) { described_class.new(claim.assessment, view) }

  context 'currency fields' do
    let(:currency_pattern) { /£\d,\d{3}\.\d{2}/ }

    before { claim.assessment.update_values(1452.33, 2455.77, 1505.24) }

    it 'totals formatted as currency' 

  end

end

