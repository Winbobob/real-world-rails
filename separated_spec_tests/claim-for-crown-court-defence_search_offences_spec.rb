require 'rails_helper'

RSpec.describe FeeReform::SearchOffences, type: :service do
  let!(:scheme_9_offences) {
    [
      create(:offence, :with_fee_scheme, description: 'Offence 1'),
      create(:offence, :with_fee_scheme, description: 'Offence 3'),
      create(:offence, :with_fee_scheme, description: 'Offence 2')
    ]
  }
  let!(:scheme_10_offences) {
    [
      create(:offence, :with_fee_scheme_ten, description: 'Offence 10-1', offence_band: create(:offence_band, description: 'OB-A', number: 1, offence_category: create(:offence_category, description: 'OC-A', number: 1))),
      create(:offence, :with_fee_scheme_ten, description: 'Offence 10-4 paTTern', offence_band: create(:offence_band, description: 'OB-B', number: 2, offence_category: create(:offence_category, description: 'OC-A', number: 1))),
      create(:offence, :with_fee_scheme_ten, description: 'Offence 10-5', contrary: 'Matches pattERN', offence_band: create(:offence_band, description: 'OB-A', number: 1, offence_category: create(:offence_category, description: 'OC-Z', number: 12))),
      create(:offence, :with_fee_scheme_ten, description: 'Offence 10-3', offence_band: create(:offence_band, description: 'Bla bla Patterns bla bla', number: 2, offence_category: create(:offence_category, description: 'OC-C', number: 3))),
      create(:offence, :with_fee_scheme_ten, description: 'Offence 10-2', offence_band: create(:offence_band, description: 'AAA', number: 1, offence_category: create(:offence_category, description: 'PaTterN bla bla', number: 17)))
    ]
  }

  context 'when no filter is provided' do
    let(:filters) { {} }

    it 'returns all existent offences under fee scheme 10' 

  end

  context 'when search_offence filter is provided' do
    let(:filters) { { search_offence: 'pattern' } }

    it 'returns all offences under fee scheme 10 that match the provided pattern (including band description and category description)' 

  end
end

