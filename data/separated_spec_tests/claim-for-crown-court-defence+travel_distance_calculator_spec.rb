require 'rails_helper'

RSpec.describe Expenses::TravelDistanceCalculator, type: :service do
  let(:supplier_number) { '9A999I' }
  let(:supplier_postcode) { 'MK40 3TN' }
  let!(:supplier) { create(:supplier_number, supplier_number: supplier_number, postcode: supplier_postcode) }
  let(:claim) { create(:litigator_claim, supplier_number: supplier_number) }
  let(:destination) { 'MK40 1HG' }
  let(:params) { { destination: destination } }

  subject(:service) { described_class.new(claim, params) }

  context 'but the associated claim does not exist' do
    let(:claim) { nil }

    it 'returns a failure result with the appropriate error code' 

  end

  context 'but the associated claim is not for LGFS' do
    let(:claim) { create(:advocate_claim) }

    it 'returns a failure result with the appropriate error code' 

  end

  context 'but the supplier associated with the claim does not have a postcode set' do
    let!(:supplier) { create(:supplier_number, supplier_number: supplier_number, postcode: nil) }

    it 'returns a failure result with the appropriate error code' 

  end

  context 'but the destination was not provided' do
    let(:params) { { foo: 'bar' } }

    it 'returns a failure result with the appropriate error code' 

  end

  context 'but the destination is not a postcode' do
    let(:params) { { destination: 'London' } }

    it 'returns a failure result with the appropriate error code' 

  end

  context 'but the distance cannot be calculated' do
    it 'returns nil as the calculated distance' 

  end

  it 'returns the calculated return distance value' 

end

