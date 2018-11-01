require 'rails_helper'

RSpec.describe PdfForm::ClaimPresenter, type: :presenter do
  let(:pdf_form_claim_presenter) { described_class.new(claim) }

  [:other_outcome, :claim_details, :other_claim_details, :miscellaneous_information].each do |meth|
    describe "##{meth}" do
      let(:claim) { create :claim }

      let(:left_double_quotation)  { "\u{201c}" }
      let(:right_double_quotation) { "\u{201d}" }
      let(:right_single_quotation) { "\u{2019}" }

      before do
        allow(claim).to receive(meth).and_return <<-EOS.strip_heredoc
          I don't know how to do paragraphs





          look


          i am thick

          bai
          #{left_double_quotation}
          #{right_double_quotation}
          #{right_single_quotation}
        EOS
      end

      it 'removes superfluous carriage returns & unknown chars' 

    end
  end

  describe '#name' do
    let(:claimant) { instance_double 'Claimant', first_name: 'first', last_name: 'last' }
    let(:claim) { instance_double 'Claim', primary_claimant: claimant }

    it 'returns a name' 

  end

  describe '#to_h' do
    let(:hash) { pdf_form_claim_presenter.to_h }

    context 'when owed' do
      [:notice, :holiday, :arrears, :other].each do |type|
        let(:claim) { Claim.new pay_claims: [type] }

        it "returns yes when '#{type}' pay complaint" 

      end
    end

    context 'when redundancy' do
      let(:claim) { Claim.new pay_claims: ['redundancy'] }

      it "returns Off when 'redundancy' pay complaint" 

    end

    context 'when whistleblowing' do
      let(:claim) { Claim.new send_claim_to_whistleblowing_entity: true }

      it 'returns yes when whistleblowing' 

    end

    context 'when claim has a single claimant' do
      let(:claim) { create :claim, :single_claimant }

      it 'checks the single claimant box' 

      it 'doesnt populate the number of claimants box' 

    end

    context 'when claim has multiple claimants' do
      let(:claim) { create :claim }

      it 'checks the multiple claimants box' 

      it 'populates the number of claimants box' 


    end
  end
end

