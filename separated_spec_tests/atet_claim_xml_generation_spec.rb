require 'rails_helper'

feature 'Generating XML for a claim', type: :feature do
  let(:claim_xml)     { JaduXml::ClaimPresenter.new(claim).to_xml }
  let(:doc)           { Nokogiri::XML(claim_xml).remove_namespaces! }

  around { |example| travel_to(Date.new(2014, 9, 29)) { example.run } }

  def xpath(path)
    doc.xpath(path).text
  end

  def xpath_collection(path)
    doc.xpath(path).children.map(&:to_s)
  end

  RSpec.shared_examples "validates against the JADU XSD" do
    it do
      xsd = Nokogiri::XML::Schema(File.read(Rails.root + 'spec/support/ETFees_schema.xsd'))
      doc = Nokogiri::XML(claim_xml)

      expect(xsd.validate(doc)).to be_empty
    end
  end

  shared_context 'assign claim' do |claim_options = {}|
    let(:claim) { create :claim, claim_options }

    it_behaves_like "validates against the JADU XSD"
  end

  describe 'ETFeesEntry XML' do
    include_context 'assign claim'

    describe 'DocumentId node elements' do
      it 'has a DocumentName' 


      it 'has a UniqueId equal to the current time in seconds' 


      it 'has a DocumentType' 


      it 'has a TimeStamp equal to the current time' 


      it 'has a Version' 

    end

    describe 'FeeGroupReference' do
      context 'fgr request failed' do
        include_context 'assign claim', :no_fee_group_reference
        specify { expect(xpath('//FeeGroupReference')).to be_empty }
      end

      context 'fgr request was successful' do
        specify { expect(xpath('//FeeGroupReference')).to eq claim.fee_group_reference }
      end
    end

    it 'has a SubmissionUrn equal to the unique application reference' 


    it 'has a CurrentQuanityOfCliamants' 


    it 'has a SubmissionChannel equal to Web' 


    describe 'CaseType element' do
      subject { xpath('//CaseType') }

      context 'Claim with multiple claimants' do
        specify { is_expected.to eq 'Multiple' }
      end

      context 'Claim with a single claimant' do
        include_context 'assign claim', :single_claimant
        specify { is_expected.to eq 'Single' }
      end
    end

    describe 'Jurisdiction element' do
      subject { xpath('//Jurisdiction') }

      context 'Claim with unfair dismissal' do
        include_context 'assign claim', is_unfair_dismissal: true, discrimination_claims: nil
        specify { is_expected.to eq '2' }
      end

      context 'Claim with alleged discrimination' do
        include_context 'assign claim', is_unfair_dismissal: false, discrimination_claims: [:disability]
        specify { is_expected.to eq '2' }
      end

      context 'Claim with protective award' do
        include_context 'assign claim', is_protective_award: true, discrimination_claims: nil
        specify { is_expected.to eq '2' }
      end

      context 'Claim with neither alleged discrimination or unfair dismissal' do
        include_context 'assign claim', is_unfair_dismissal: false, discrimination_claims: nil
        specify { is_expected.to eq '1' }
      end
    end

    it 'has a OfficeCode' 


    it 'has a DateOfReceiptEt' 


    describe 'RemissionIndicated element' do
      subject { xpath('//RemissionIndicated') }

      context 'Claim opted for remission' do
        include_context 'assign claim', :remission_only
        specify { is_expected.to eq 'Indicated' }
      end

      context 'Claim did not opt for remission' do
        specify { is_expected.to eq 'NotRequested' }
      end
    end

    it 'has an Administrator' 


    describe 'Claimants' do
      context 'renders nil elements' do
        include_context 'assign claim', :null_primary_claimant
      end

      it 'conatins information regarding the primary claimant' 


      it 'contains information regarding secondary claimants' 

    end

    describe 'Respondents' do
      it 'contains a Respondents details' 


      context 'renders nil elements' do
        let(:claim) { create :claim, primary_respondent: respondent }
        let(:respondent) do
          FactoryGirl.create :respondent,
            :without_work_address,
            work_address_telephone_number: nil,
            address_telephone_number: nil
        end

        it_behaves_like "validates against the JADU XSD"

        it 'has an AltAddress with empty nodes' 


        it 'has an empty AltPhoneNumber' 

      end

      describe 'Acas element' do
        context 'with an acas number' do
          include_context 'assign claim', :respondent_with_acas_number

          it 'contains a Number' 

        end

        context 'with no acas number' do
          it 'contains an ExemptionCode' 

        end
      end
    end

    describe 'Representatives' do
      context 'Claim without a representative' do
        include_context 'assign claim', :without_representative

        it 'still renders a node' 

      end

      context 'renders nil elements' do
        include_context 'assign claim', :null_representative
      end

      context 'Claim with a representative' do
        it 'contains a Representatives details' 

      end
    end

    describe 'Payment' do
      describe 'Fee' do
        it 'has an Amount(in pounds)' 


        describe 'PRN(alias for fee group reference)' do
          context 'fgr request failed' do
            let(:claim) { create :claim, :no_fee_group_reference }

            specify { expect(xpath('//Payment/Fee/PRN')).to be_empty }
          end

          context 'fgr request was successful' do
            specify { expect(xpath('//Payment/Fee/PRN')).to eq claim.fee_group_reference }
          end
        end

        it 'has a Date' 

      end

      describe 'Receipt' do
        context 'a successful payment was made by the claimant' do
          it 'has a PSP(Payment Service Provider)' 

          it 'has a PayId' 

          it 'has an Amount' 

          it 'has a Date' 

        end

        context 'no payment was made' do
          include_context 'assign claim', :payment_failed

          it 'does not contain a Receipt' 

        end
      end
    end

    describe 'Files' do
      include_context 'assign claim', :with_pdf

      it 'has upto 3 filenames' 


      it 'has upto 3 file checksums' 

    end
  end
end

