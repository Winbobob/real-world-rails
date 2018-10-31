require 'rails_helper'

RSpec.describe 'Distance calculation for travel expenses', type: :request do
  let(:supplier_number) { '9A999I' }
  let(:supplier_postcode) { 'MK40 3TN' }
  let!(:supplier) { create(:supplier_number, supplier_number: supplier_number, postcode: supplier_postcode) }
  let(:claim) { create(:litigator_claim, supplier_number: supplier_number) }
  let(:destination) { 'MK40 1HG' }
  let(:params) { { destination: destination } }
  let(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }

  context 'when the user is not authenticated' do
    it 'returns an unauthorized response' 

  end

  context 'when the user is authenticated' do
    let(:user) { create(:external_user, :litigator).user }

    before do
      sign_in(user)
    end

    context 'but is not authorized to perform this request' do
      let(:user) { create(:case_worker).user }

      it 'returns an unauthorized response' 

    end

    context 'but the associated claim does not exist' do
      it 'returns an unprocessable response' 

    end

    context 'but the associated claim is not for LGFS' do
      let(:claim) { create(:advocate_claim) }

      it 'returns an unprocessable response' 

    end

    context 'but the supplier associated with the claim does not have a postcode set' do
      let!(:supplier) { create(:supplier_number, supplier_number: supplier_number, postcode: nil) }

      it 'returns an unprocessable response' 

    end

    context 'but the distance cannot be calculated' do
      it 'returns nil as the calculated distance' 

    end

    it 'returns the calculated return distance value' 

  end
end

