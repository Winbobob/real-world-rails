require 'rails_helper'

RSpec.describe ClaimTypeForm, type: :form do

  it_behaves_like 'a Form',
    is_other_type_of_claim: true,
    is_unfair_dismissal: true,
    is_protective_award: false,
    discrimination_claims: ['disability'],
    pay_claims: ['holiday'],
    is_whistleblowing: 'true',
    send_claim_to_whistleblowing_entity: 'false',
    other_claim_details: 'always'

  let(:claim_type_form) { described_class.new(claim) { |f| f.is_other_type_of_claim = 'true' } }

  let(:claim) do
    Claim.new \
      discrimination_claims: [:sex_including_equal_pay, :disability, :race],
      pay_claims: [:redundancy, :notice, :holiday, :arrears, :other]
  end

  [:pay, :discrimination].each do |type|
    describe "##{type}_claims" do
      it "returns an array of strings because that's what the form builder requires" 

    end
  end

  describe 'callbacks' do
    it 'clears other_claim_details when selecting no' 

  end

  describe '#is_other_type_of_claim' do
    context 'when there are no other claim details' do
      it 'is false' 

    end

    context 'when there is other claim details' do
      before { claim_type_form.other_claim_details = 'details' }

      it 'is true' 

    end
  end

  describe "claim validation" do
    before do
      claim_type_form.is_unfair_dismissal = false
      claim_type_form.is_protective_award = false
      claim_type_form.discrimination_claims = [""]
      claim_type_form.pay_claims = [""]
      claim_type_form.is_whistleblowing = false
      claim_type_form.send_claim_to_whistleblowing_entity = false
      claim_type_form.other_claim_details = ""
    end

    context 'empty attributes' do
      it "will fail" 


      it "will return proper error message" 

    end

    it "is valid with 1 claim type" 


    it "is valid with 2 or more claim types" 

  end
end

