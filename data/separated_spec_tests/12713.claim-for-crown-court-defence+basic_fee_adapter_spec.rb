require 'rails_helper'

RSpec.describe CCR::Fee::BasicFeeAdapter, type: :adapter do
  subject { described_class.new(claim) }
  let(:claim) { instance_double('claim') }
  let(:case_type) { instance_double('case_type', fee_type_code: 'GRTRL') }

  before do
    allow(claim).to receive(:case_type).and_return case_type
  end

  it_behaves_like 'a simple bill adapter', bill_type: 'AGFS_FEE', bill_subtype: 'AGFS_FEE' do
    let(:fee) { instance_double(Fee::BasicFee) }
  end

  describe '#bill_type' do
    subject { described_class.new(claim).bill_type }

    it 'returns CCR Advocate Fee bill type' 

  end

  describe '#bill_subtype' do
    subject { described_class.new(claim).bill_subtype }

    it 'returns CCR Advocate Fee bill subtype' 

  end

  describe '#claimed?' do
    subject { described_class.new(claim).claimed? }

    let(:basic_fee_type) { instance_double(::Fee::BasicFeeType, unique_code: 'BABAF') }
    let(:basic_fees) { [basic_fee] }
    let(:basic_fee) do
      instance_double(
        ::Fee::BasicFee,
        fee_type: basic_fee_type,
        quantity: 0,
        rate: 0,
        amount: 0,
        )
    end

    before do
      expect(claim).to receive(:fees).at_least(:once).and_return basic_fees
    end

    it 'returns true when the basic fee has a positive qauntity' 


    it 'returns true when the basic fee has a positive amount' 


    it 'returns true when the basic fee has a positive rate' 


    it 'returns false when the basic fee has 0 values for quantity, rate and amount'do
      allow(basic_fee).to receive_messages(quantity: 0, rate: 0, amount: 0)
      is_expected.to be false
    end

    it 'returns false when the basic fee has nil values for quantity, rate and amount'do
      allow(basic_fee).to receive_messages(quantity: nil, rate: nil, amount: nil)
      is_expected.to be false
    end

    it 'returns false when the basic fee is not part of the CCR advocate fee' 

  end
end

