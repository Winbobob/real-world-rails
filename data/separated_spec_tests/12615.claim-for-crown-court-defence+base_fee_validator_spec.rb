require 'rails_helper'

RSpec.describe Fee::BaseFeeValidator, type: :validator do
  let(:claim)   { build :advocate_claim, :with_fixed_fee_case }
  let(:fee)     { build :fixed_fee, claim: claim }
  let(:baf_fee) { build :basic_fee, :baf_fee, claim: claim }
  let(:daf_fee) { build :basic_fee, :daf_fee, claim: claim }
  let(:dah_fee) { build :basic_fee, :dah_fee, claim: claim }
  let(:daj_fee) { build :basic_fee, :daj_fee, claim: claim }
  let(:dat_fee) { build :basic_fee, :dat_fee, claim: claim }
  let(:pcm_fee) { build :basic_fee, :pcm_fee, claim: claim }
  let(:ppe_fee) { build :basic_fee, :ppe_fee, claim: claim }
  let(:npw_fee) { build :basic_fee, :npw_fee, claim: claim }
  let(:spf_fee) { build :misc_fee, :spf_fee, claim: claim }

  before do
    claim.force_validation = true
  end

  context 'for a JSON imported claim (and no forced validation)' do
    before do
      claim.force_validation = false
    end

    let(:claim) { build :advocate_claim, source: 'json_import' }

    it 'should not perform claim validation' 


    it 'should perform fee validation' 

  end

  describe '#validate_claim' do
    it { should_error_if_not_present(fee, :claim, 'blank') }
  end

  describe '#validate_fee_type' do
    it { should_error_if_not_present(fee, :fee_type, 'blank') }
  end

  describe '#validate_date' do
    it { should_error_if_present(fee, :date, 3.days.ago, 'present') }
  end

  describe '#validate_warrant_issued_date' do
    it 'should raise error if date present' 

  end

  describe '#validate_warrant_executed_date' do
    it 'should raise error if date present' 

  end

  describe '#validate_rate' do
    let(:first_day_of_trial) { 1.month.ago }
    let(:actual_trial_length) { 10 }
    let(:trial_concluded_at) { first_day_of_trial + actual_trial_length.days }
    let(:case_type) { build(:case_type, :trial) }
    let(:claim) { build(:advocate_claim, case_type: case_type, actual_trial_length: actual_trial_length, first_day_of_trial: first_day_of_trial, trial_concluded_at: trial_concluded_at) }

    context 'with quantity greater than zero' do
      it { should_be_valid_if_equal_to_value(daf_fee, :rate, 450.00) }
      it { should_error_if_equal_to_value(baf_fee, :rate, 0.00, 'invalid') }
      it { should_error_if_equal_to_value(daf_fee, :rate, nil,  'invalid') }
      it { should_error_if_equal_to_value(daf_fee, :rate, 0.00, 'invalid') }
      it { should_error_if_equal_to_value(daf_fee, :rate, -320, 'invalid') }
    end

    context 'with quantity of zero and a rate greater than zero' do
      it 'BAF fee should raise BAF specific QUANTITY error' 


      it 'DAF fee should raise DAF specific QUANTITY error' 

    end

    context 'for fees on agfs draft claims' do
      it 'should validate presence of rate' 

    end

    # NOTE: this enables fees that were created and submitted prior to rate being re-introduced to be valid
    context 'for fees on agfs submitted claims' do
      let(:claim) { build(:advocate_claim, :with_fixed_fee_case) }

      it 'should NOT validate presence of rate' 

    end

    # TODO: this will become default after gamma/private beta claims archived/deleted
    context 'for fees entered after rate was reintroduced' do
      it 'should require a rate of more than zero' 

    end

    context 'for uncalculated fees (PPE and NPW)' do
      it 'should raise an error when rate present' 


      it 'should NOT raise an error when rate NOT present' 


      it 'should NOT raise an error when amount is zero and quantity is not' 

    end

    # TODO: max_amount not used in later PR - remove?
    # context 'fee with max amount' do
    #   before(:each)       { fee.fee_type.max_amount = 9999 }
    #   it { should_be_valid_if_equal_to_value(fee, :amount, 9999) }
    # end

    # context 'fee with no max amount' do
    #   before(:each)       { fee.fee_type.max_amount = nil }
    #   it { should_be_valid_if_equal_to_value(fee, :amount, 100_000) }
    # end

  end

  describe '#validate_quantity' do

    context 'integer / decimal validation' do
      context 'integer' do
        it 'should allow integers' 

        it 'should not allow decimals' 

      end

      context 'decimal' do
        it 'should allow integers' 

        it 'should allow decimals' 

      end
    end

    context 'Basic fee types' do
      let(:case_type) { build(:case_type, :trial) }
      let(:claim) { build(:advocate_claim, case_type: case_type) }

      context 'basic fee (BAF)' do
        context 'when rate present' do
          it 'should be valid with quantity of one' 


          it 'should raise numericality error when quantity not in range 0 to 1' 


          it 'should raise invalid error when quantity is nil or 0' 

        end

        context 'when rate NOT present' do
          before(:each) { baf_fee.rate = 0 }

          it 'should be valid when quantity is zero' 


          it 'should raise invalid RATE error when quantity is one' 

        end
      end

      context 'daily_attendance_3_40 (DAF)' do
        context 'trial length less than three days' do
          it 'should error if trial length is less than three days' 

        end

        context 'trial length greater than three days' do
          it 'should error if quantity greater than 38 regardless of actual trial length' 


          it 'should error if quantity greater than actual trial length less 2 days' 


          it 'should not error if quantity is valid' 

        end

        context 'for retrials' do
          let(:case_type) { build(:case_type, :retrial) }

          it 'should validate based on retrial length' 

        end
      end

      context 'daily_attendance_41_50 (DAH)' do
        it 'should error if trial length is less than 40 days' 


        context 'trial length greater than 40 days' do
          it 'should error if greater than trial length less 40 days' 


          it 'should error if greater than 10 days regardless of actual trial length' 


          it 'should not error if valid' 

        end

        it 'should validate based on retrial length for retrials' 

      end

      context 'daily attendance 51 plus (DAJ)' do
        context 'trial length less than 51 days' do
          it 'should error if trial length is less than 51 days' 

        end

        context 'trial length greater than 50 days' do
          it 'should error if greater than trial length less 50 days' 


          it 'should not error if valid' 

        end

        it 'should validate based on retrial length for retrials' 

      end

      context 'daily attendance 2 plus (DAT)' do
        context 'trial length less than 2 days' do
          let(:actual_trial_length) { 1 }

          it 'is not valid and cannot be claimed' 

        end

        context 'trial length was exactly 2 days' do
          let(:actual_trial_length) { 2 }

          context 'when the extra days claims are within the actual trial length' do
            it 'is valid and can be claimed' 

          end

          context 'when the extra days claims are NOT within the actual trial length' do
            it 'is not valid and cannot be claimed' 

          end
        end

        context 'trial length greater than 2 days' do
          let(:actual_trial_length) { 6 }

          context 'when the extra days claims are within the actual trial length' do
            it 'is valid and can be claimed' 

          end

          context 'when the extra days claims are NOT within the actual trial length' do
            it 'is not valid and cannot be claimed' 

          end
        end

        it 'should validate based on retrial length for retrials' 

      end

      context 'plea and case management hearing (PCM)' do
        context 'permitted case type' do
          before(:each) do
            claim.case_type = FactoryBot.build :case_type, :allow_pcmh_fee_type
          end
          it { should_error_if_equal_to_value(pcm_fee, :quantity, 0, 'pcm_invalid') }
          it { should_error_if_equal_to_value(pcm_fee, :quantity, 4, 'pcm_numericality') }
          it { should_be_valid_if_equal_to_value(pcm_fee, :quantity, 3) }
          it { should_be_valid_if_equal_to_value(pcm_fee, :quantity, 1) }
        end

        context 'unpermitted case type' do
          before(:each) do
            claim.case_type = FactoryBot.build :case_type
          end
          it { should_error_if_equal_to_value(pcm_fee, :quantity, 1, 'pcm_not_applicable') }
          it { should_error_if_equal_to_value(pcm_fee, :quantity, -1, 'pcm_not_applicable') }
        end
      end

      context 'number of cases uplift (BANOC)' do
        let(:noc_fee) { build :basic_fee, :noc_fee, claim: claim }
        include_examples 'common AGFS number of cases uplift validations'
      end
    end

    context 'Fixed fee types' do
      context 'number of cases uplift (FXNOC)' do
        let(:noc_fee) { build :fixed_fee, :fxnoc_fee, claim: claim }
        include_examples 'common AGFS number of cases uplift validations'
      end
    end

    context 'any other fee' do
      before { fee.rate = 1 }

      it { should_error_if_equal_to_value(fee, :quantity, -1, 'invalid') }
      it { should_be_valid_if_equal_to_value(fee, :quantity, 99999) }
      it { should_error_if_equal_to_value(fee, :quantity, 100000, 'invalid') }

      it 'should not allow zero if amount is not zero' 


      it 'should error if resulting amount (rate * quantity) is greater than the max limit' 

    end
  end

  describe '#validate_amount' do
    context 'uncalculated fee validate amount against quantity' do
      it 'should be valid if quantity greater than zero and amount is nil, zero or greater than zero' 


      it 'should error if amount less than zero' 


      it 'should error if amount is greater than the max limit' 


      it 'should error if amount greater than zero and quantity is nil, zero or less than zero' 

    end

    context 'calculated fees do NOT validate amount against quantity' do
      it 'should always be valid since amount is derived from rate * quantity' 

    end
  end
end

