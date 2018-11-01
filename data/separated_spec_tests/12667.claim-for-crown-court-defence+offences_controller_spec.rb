# == Schema Information
#
# Table name: offences
#
#  id               :integer          not null, primary key
#  description      :string
#  offence_class_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'rails_helper'

RSpec.describe OffencesController, type: :controller do
  let!(:scheme_9_offences) {
    [
      create(:offence, :with_fee_scheme, description: 'Offence 1'),
      create(:offence, :with_fee_scheme, description: 'Offence 3'),
      create(:offence, :with_fee_scheme, description: 'Offence 2')
    ]
  }
  let!(:scheme_10_offences) {
    [
      create(:offence, :with_fee_scheme_ten, description: 'Offence 10-1'),
      create(:offence, :with_fee_scheme_ten, description: 'Offence 10-3'),
      create(:offence, :with_fee_scheme_ten, description: 'Offence 10-2')
    ]
  }

  describe 'GET index' do
    it 'should return all offences if no description present' 


    it 'should just get the matching offence' 


    context 'when fee reform filter is provided' do
      let(:params) { { fee_scheme: 'fee_reform' } }

      it 'returns offences only for fee scheme 10' 


      it 'calls the fee reform search offences service with the provided filters' 

    end
  end
end

