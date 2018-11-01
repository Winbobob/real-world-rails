require 'rails_helper'

RSpec.describe PaperEvidenceHelper, type: :helper do

  subject(:template) { helper.error_message_partial(application) }

  let(:application) { build_stubbed :application, detail: detail }
  let(:detail) { build_stubbed :detail, discretion_applied: nil }
  let(:benefit_check_runner) { instance_double('BenefitCheckRunner') }

  before do
    allow(BenefitCheckRunner).to receive(:new).and_return benefit_check_runner
    allow(benefit_check_runner).to receive(:benefit_check_date_valid?).and_return benefit_check
  end

  describe '#error_message_partial' do
    context 'when benefit_check_date is not valid' do
      let(:benefit_check) { false }

      it "return out of time template name" 


      context 'discretion granted' do
        let(:detail) { build_stubbed :detail, discretion_applied: true }

        it "when result was no return nil" 


        it "when last_benefit_check_result was invalid return nil" 

      end

      context 'discretion denied' do
        let(:detail) { build_stubbed :detail, discretion_applied: false }

        it "return nil" 

      end
    end

    context 'when benefit_check_date is valid' do
      let(:benefit_check) { true }

      context 'missing_details template' do
        it "when nil" 


        it "when undetermined" 

      end

      context 'technical_error template' do
        it "when server unavailable" 


        it "when unspecified error" 

      end
    end
  end
end

