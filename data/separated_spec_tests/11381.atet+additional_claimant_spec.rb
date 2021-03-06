require 'rails_helper'

RSpec.describe AdditionalClaimantsForm::AdditionalClaimant, type: :form do
  let(:additional_claimant) { described_class.new Claimant.new }

  describe 'validations' do
    [:first_name, :last_name, :address_building, :address_street, :address_locality, :address_post_code].each do |attr|
      it { expect(additional_claimant).to validate_presence_of(attr) }
    end

    it { expect(additional_claimant).to validate_inclusion_of(:title).in_array ['mr', 'mrs', 'miss', 'ms'] }

    it { expect(additional_claimant).to validate_length_of(:first_name).is_at_most(100) }
    it { expect(additional_claimant).to validate_length_of(:last_name).is_at_most(100) }

    it { expect(additional_claimant).to validate_length_of(:address_building).is_at_most(75) }
    it { expect(additional_claimant).to validate_length_of(:address_street).is_at_most(75) }
    it { expect(additional_claimant).to validate_length_of(:address_locality).is_at_most(25) }
    it { expect(additional_claimant).to validate_length_of(:address_county).is_at_most(25) }
    it { expect(additional_claimant).to validate_length_of(:address_post_code).is_at_most(8) }
  end

  context "claimant with target" do
    let(:additional_claimant) { AdditionalClaimantsForm::AdditionalClaimant.new(target) }

    let(:attributes) do
      {
        title: 'mr', first_name: 'Barrington', last_name: 'Wrigglesworth',
        address_building: '1', address_street: 'High Street',
        address_locality: 'Anytown', address_county: 'Anyfordshire',
        address_post_code: 'AT1 0AA', date_of_birth: '01/01/1990'
      }
    end

    let(:target) { Claimant.new }

    describe '.model_name_i18n_key' do
      specify do
        expect(described_class.model_name_i18n_key).
          to eq(described_class.model_name.i18n_key)
      end
    end

    describe '#column_for_attribute' do
      it "returns the attribute's type"
    end

    describe '#save' do
      describe 'for valid attributes' do
        before { additional_claimant.assign_attributes attributes }

        it "saves the data" 


        it 'is true' 


        context 'PG::NotNullViolation' do
          before { allow(target).to receive(:update_attributes).and_raise(PG::NotNullViolation.new('test')) }

          it "send a data to sentry" 


          it "expect sentry to receive exception" 


          it "expect to raise an arror" 

        end
      end

      describe 'for invalid attributes' do
        before { allow(additional_claimant).to receive(:valid?).and_return false }

        it 'is not saved' 


        it 'is false' 

      end

      describe 'when marked for destruction' do
        before { additional_claimant._destroy = 'true' }

        it 'destroys the target' 


        it 'is true' 

      end
    end
  end

  context 'shared validation' do
    subject { described_class.new Claimant.new }

    include_examples "Postcode validation",
      attribute_prefix: 'address',
      error_message: 'Enter a valid UK postcode. If you live abroad, enter SW55 9QT'
  end
end

