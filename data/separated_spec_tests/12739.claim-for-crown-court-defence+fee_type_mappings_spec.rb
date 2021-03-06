RSpec.describe Claims::FeeCalculator::FeeTypeMappings do
  subject(:instance) { described_class.instance }

  before do
    seed_case_types
    described_class.reset
  end

  after do
    # important to not impact other tests
    described_class.reset
  end

  it { is_expected.to respond_to :all }
  it { is_expected.to respond_to :primary_fee_types }

  let(:fixed_fee_mappings) { CCR::Fee::FixedFeeAdapter.new.mappings.keys }
  let(:misc_fee_mappings) { CCR::Fee::MiscFeeAdapter.new.mappings.keys }
  let(:all_fee_mappings) { fixed_fee_mappings + misc_fee_mappings }
  let(:primary_fee_types) { %i[FXACV FXASE FXCBR FXCSE FXCON FXENP] }

  describe '.reset' do
    it 'causes memoized data to be cleared/reset' 

  end

  describe '#all' do
    subject { described_class.instance.all }

    let(:fee_mappings) { fixed_fee_mappings + misc_fee_mappings }
    it 'returns all fee type mappings' 

  end

  describe '#primary_fee_types' do
    subject { described_class.instance.primary_fee_types }

    it 'returns fee type mappings for fee types that are also case types' 

  end
end

