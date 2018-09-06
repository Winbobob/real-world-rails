require 'rails_helper'

describe Claims::UpdateClaim do

  after(:all) do
    clean_database
  end

  context 'claim updating' do
    let(:claim) { FactoryBot.create :advocate_claim, case_number: 'A20161234' }
    let(:claim_params) { { case_number: 'A20165555' } }

    subject { described_class.new(claim, params: claim_params) }

    it 'defines the action' 


    it 'is not a draft' 


    context 'successful updates' do
      it 'forces validation' 


      it 'updates the source when editing an API submitted claim' 


      it 'updates the source when editing a JSON imported claim' 


      it 'is successful' 

    end

    context 'unsuccessful updates' do
      let(:claim_params) { { case_number: '123' } }

      it 'is unsuccessful' 


      it 'is unsuccessful for an already submitted claim' 

    end
  end
end

