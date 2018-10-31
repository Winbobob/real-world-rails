require 'rails_helper'
require 'cgi'

RSpec.describe Claim::BaseClaimPresenter do
  let(:claim) { create(:advocate_claim) }
  subject(:presenter) { described_class.new(claim, view) }

  before do
    Timecop.freeze(Time.current)
    @first_defendant = claim.defendants.first
    @first_defendant.first_name = 'Mark'
    @first_defendant.last_name = "O'Reilly"
    @first_defendant.save!
    create(:defendant, first_name: 'Robert', last_name: 'Smith', claim: claim, order_for_judicial_apportionment: false)
    create(:defendant, first_name: 'Adam', last_name: 'Smith', claim: claim, order_for_judicial_apportionment: false)
  end

  after { Timecop.return }

  describe '#show_sidebar?' do
    context 'when current step does NOT require sidebar' do
      before do
        expect(claim).to receive(:current_step).and_return(:defendants)
      end

      specify { expect(presenter.show_sidebar?).to be_falsey }
    end

    context 'when current step does require sidebar' do
      before do
        expect(claim).to receive(:current_step).and_return(:requires_sidebar_step)
      end

      specify { expect(presenter.show_sidebar?).to be_truthy }
    end
  end

  describe '#case_type_name' do
    context 'non redetermination or awaiting written reason' do
      it 'should display the case type name' 

    end

    context 'redetermination' do
      it 'should display the case type name with a redetermination label' 

    end

    context 'awaiting written reasons' do
      it 'should display the case type name with an awaiting written reasons label' 

    end
  end

  it '#defendant_names' 


  it '#submitted_at' 


  it '#authorised_at' 


  it '#unique_id' 


  describe '#case_number' do
    it 'returns a placeholder text when not provided' 


    it 'returns it when provided' 

  end

  describe '#valid_transitions' do
    it 'should list valid transitions from allocated' 


    it 'should list valid transitions from allocated with include_submitted => false' 


    it 'should list valid transitions from part_authorised' 

  end


  describe '#assessment_date' do
    context 'blank assessment' do
      it 'returns not yet assessed if there is no assessment' 

    end

    let(:creation_date) { Time.new(2015, 8, 13, 14, 55, 23) }
    let(:assessment_date) { Time.new(2015, 9, 1, 12, 34, 55) }
    let(:first_redetermination_date)  { Time.new(2015, 9, 4, 7, 33, 22) }
    let(:second_redetermination_date) { Time.new(2015, 9, 9, 13, 33, 55) }
    let(:presenter)  { Claim::BaseClaimPresenter.new(@claim, view) }

    context 'one assessment, no redeterminations' do
      it 'returns the updated date of the assessment' 

    end

    context 'multiple redeterminations' do
      it 'returns creation date of last redetermination' 

    end
  end

  describe 'assessment_fees' do
    it 'should  return formatted assessment fees' 

  end

  describe 'assessment_expenses' do
    it 'should return formatted assessment expenses' 

  end

  describe 'assessment_disbursements' do
    it 'should return formatted assessment disbursements' 

  end

  describe '#retrial' do

    it 'returns yes for case types like retrial' 


    it 'returns no for case types NOT like retrial' 


  end

  describe '#any_judicial_apportionments' do

    it "returns yes if any defendants have an order for judicial apportionment" 


    it "returns no if no defendants have an order for judicial apportionment" 


  end

  # TODO: do currency converters need internationalisation??
  it '#amount_assessed' 


  context 'dynamically defined methods' do
    %w[expenses disbursements].each do |object_name|
      %w[total vat with_vat_net with_vat_gross without_vat_net without_vat_gross].each do |method|
        method_name = "#{object_name}_#{method}".to_sym
        it { is_expected.to respond_to(method_name) }

        describe "##{method_name}" do
          it 'returns currency format' 

        end
      end
    end
  end

  describe '#expenses_gross' do
    it 'returns total expenses and total of expense vat in currency format' 

  end

  describe '#disbursements_gross' do
    it 'returns total disbursements and total disbursment vat in currency format' 

  end

  describe '#fees_total' do
    it 'returns total of all fees in currency format' 

  end

  describe "#total_inc_vat" do
    it 'returns total of all fees and total of all fee vat in currency format' 

  end

  describe '#case_worker_email_addresses' do
    it 'returns comma separated string of case worker email address' 

  end

  describe '#caseworker_claim_id' do
    it 'returns claim id formatted for use in html label' 

  end

  describe '#representation_order_details' do

    claim = FactoryBot.build :unpersisted_claim
    subject { Claim::BaseClaimPresenter.new(claim, view) }

    it 'should return an html safe string of all the dates' 

  end

  it '#case_worker_names' 


  describe '#amount_assessed' do
    context 'when assessment present' do
      before do
        claim.submit!
        claim.allocate!
        claim.assessment.update_values(100, 20.43, 50.45)
        claim.authorise!
      end

      it 'display a currency formatted amount assessed' 

    end

    context 'when no assessment present' do
      it 'displays "-"' 

    end
  end

  context 'defendant_summary' do
    let(:my_claim)  { Claim::AdvocateClaim.new }
    let(:presenter) { Claim::BaseClaimPresenter.new(my_claim, view)}

    context '3 defendants' do
      it 'returns name and intial of first defendant and count of additional defendants' 

    end

    context '1 defendant' do
      it 'returns the name and initial of the only defendant' 

    end

    context '2 defendants' do
      it 'returns the name and initial of the first defendant + 1 other' 

    end

    context 'no defendants' do
      it 'returns nil' 

    end
  end

  it { is_expected.to respond_to :injection_error }
  it { is_expected.to respond_to :injection_error_summary }
  it { is_expected.to respond_to :injection_errors }
  it { is_expected.to respond_to :last_injection_attempt }

  describe '#injection_error' do
    subject { presenter.injection_error }
    before { create(:injection_attempt, :with_errors, claim: claim) }

    it 'returns nil for inactive injection errors' 


    it 'returns single header message for active injection errors' 


    it 'yields a block passing the header message as an argument' 

  end

  describe '#injection_errors' do
    subject { presenter.injection_errors }
    before do
      create(:injection_attempt, :with_errors, claim: claim)
    end

    it 'calls last error messages attribute of model' 


    it 'returns the last error messages array' 

  end

  describe '#supplier_name' do
    subject { presenter.supplier_name }

    context 'AGFS' do
      it 'returns nil' 

    end

    context 'LGFS' do
      let(:claim) { create(:litigator_claim) }
      let(:supplier) do
        SupplierNumber.find_by(supplier_number: claim.supplier_number)
      end

      it 'returns claim supplier\'s name' 

    end
  end

  describe '#supplier_postcode' do
    subject { presenter.supplier_postcode }

    context 'AGFS' do
      it 'returns nil' 

    end

    context 'LGFS' do
      let(:claim) { create(:litigator_claim) }
      let(:supplier) { SupplierNumber.find_by(supplier_number: claim.supplier_number) }

      it 'returns claim suppliers postcode' 

    end
  end

  describe '#supplier_name_with_postcode' do
    subject { presenter.supplier_name_with_postcode }

    context 'AGFS' do
      it 'returns nil' 

    end

    context 'LGFS' do
      let(:claim) { create(:litigator_claim) }
      let(:supplier) { SupplierNumber.find_by(supplier_number: claim.supplier_number) }

      context 'when claim supplier has name and postcode' do
        it 'returns name and postcode' 

      end

      context 'when claim supplier has name but NOT postcode' do
        before { supplier.update(postcode: nil) }

        it 'returns name' 

      end

      context 'when claim supplier has no name or postcode' do
        before { supplier.update(name: nil, postcode: nil) }
        it { is_expected.to be_nil }
      end
    end
  end
end

