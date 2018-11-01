require 'rails_helper'
require 'api_spec_helper'

RSpec::Matchers.define :be_valid_ccr_claim_json do
  match do |response|
    schema_path = ClaimJsonSchemaValidator::CCR_SCHEMA_FILE
    @errors = JSON::Validator.fully_validate(schema_path, response.respond_to?(:body) ? response.body : response)
    @errors.empty?
  end

  description do
    "be valid against the CCR claim JSON schema"
  end

  failure_message do |response|
    spacer = "\s" * 2
    "expected JSON to be valid against CCR formatted claim schema but the following errors were raised:\n" +
    @errors.each_with_index.map { |error, idx| "#{spacer}#{idx+1}. #{error}"}.join("\n")
  end
end

RSpec.describe API::V2::CCRClaim, feature: :injection do
  include Rack::Test::Methods
  include ApiSpecHelper

  after(:all) { clean_database }

  def create_claim(*args)
    # TODO: this should not require build + save + reload
    # understand what the factory is doing to solve this
    claim = build(*args)
    claim.save
    claim.reload
  end

  let(:case_worker) { create(:case_worker, :admin) }
  let(:case_type) { create(:case_type, :trial) }
  let(:basic_fee) { build(:basic_fee, :baf_fee, quantity: 1) }
  let(:misc_fee) { build(:misc_fee, :mispf_fee, :with_date_attended) }
  let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, basic_fees: [basic_fee], misc_fees: [misc_fee]) }

  def do_request(claim_uuid: claim.uuid, api_key: case_worker.user.api_key)
    get "/api/ccr/claims/#{claim_uuid}", { api_key: api_key }, { format: :json }
  end

  describe 'GET /ccr/claim/:uuid?api_key=:api_key' do
    let(:dsl) { Grape::DSL::InsideRoute }

    it 'presents advocate claim with CCR advocate claim entity' 


    context 'for advocate interim claims' do
      let(:warrant_fee) { build(:warrant_fee, :warr_fee) }
      let(:offence) { create(:offence, :with_fee_scheme_ten) }
      let(:claim) { create_claim(:advocate_interim_claim, :without_fees, :submitted, offence: offence, warrant_fee: warrant_fee) }

      it 'presents advocate interim claim with CCR advocate interim claim entity' 

    end

    it 'returns 200, success, and JSON response when existing claim exists and api key authorised' 


    it 'returns 406, Not Acceptable, if requested API version (via header) is not supported' 


    it 'requires an API key' 


    context 'when accessed by an ExternalUser' do
      before { do_request(api_key: claim.external_user.user.api_key )}

      it 'returns unauthorised' 

    end

    context 'claim not found' do
      it 'respond not found when claim is not found' 

    end

    context 'advocate claim' do
      subject(:response) { do_request.body }

      it { is_expected.to expose :uuid }
      it { is_expected.to expose :supplier_number }
      it { is_expected.to expose :case_number }
      it { is_expected.to expose :first_day_of_trial }
      it { is_expected.to expose :trial_fixed_notice_at }
      it { is_expected.to expose :trial_fixed_at }
      it { is_expected.to expose :trial_cracked_at }
      it { is_expected.to expose :retrial_started_at }
      it { is_expected.to expose :trial_cracked_at_third }
      it { is_expected.to expose :last_submitted_at }

      it { is_expected.to expose :advocate_category }
      it { is_expected.to expose :case_type }
      it { is_expected.to expose :court }
      it { is_expected.to expose :offence }
      it { is_expected.to expose :defendants }
      it { is_expected.to expose :retrial_reduction }

      it { is_expected.to expose :actual_trial_Length }
      it { is_expected.to expose :estimated_trial_length }
      it { is_expected.to expose :retrial_actual_length }
      it { is_expected.to expose :retrial_estimated_length }

      it { is_expected.to expose :additional_information }
      it { is_expected.to expose :bills }
    end

    context 'advocate interim claim' do
      subject(:response) { do_request.body }

      let(:warrant_fee) { build(:warrant_fee, :warr_fee) }
      let(:offence) { create(:offence, :with_fee_scheme_ten) }
      let(:claim) { create_claim(:advocate_interim_claim, :without_fees, :submitted, offence: offence, warrant_fee: warrant_fee) }

      it { is_expected.to expose :uuid }
      it { is_expected.to expose :supplier_number }
      it { is_expected.to expose :case_number }
      it { is_expected.not_to expose :first_day_of_trial }
      it { is_expected.not_to expose :trial_fixed_notice_at }
      it { is_expected.not_to expose :trial_fixed_at }
      it { is_expected.not_to expose :trial_cracked_at }
      it { is_expected.not_to expose :retrial_started_at }
      it { is_expected.not_to expose :trial_cracked_at_third }
      it { is_expected.to expose :last_submitted_at }

      it { is_expected.to expose :advocate_category }
      it { is_expected.to expose :case_type }
      it { is_expected.to expose :court }
      it { is_expected.to expose :offence }
      it { is_expected.to expose :defendants }
      it { is_expected.not_to expose :retrial_reduction }

      it { is_expected.to expose :actual_trial_Length }
      it { is_expected.to expose :estimated_trial_length }
      it { is_expected.to expose :retrial_actual_length }
      it { is_expected.to expose :retrial_estimated_length }

      it { is_expected.to expose :additional_information }
      it { is_expected.to expose :bills }
    end

    context 'defendants' do
      subject(:response) { do_request.body }

      let(:defendants) { create_list(:defendant, 2) }
      let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, basic_fees: [basic_fee], misc_fees: [misc_fee], defendants: defendants) }

      it 'returns multiple defendants' 


      it 'returns defendants in order created marking earliest created as the "main" defendant' 


      context 'representation orders' do
        let(:defendants) {
          [
            create(:defendant, representation_orders: create_list(:representation_order, 2, representation_order_date: 5.days.ago)),
            create(:defendant, representation_orders: [create(:representation_order, representation_order_date: 2.days.ago)])
          ]
        }

        it 'returns multiple representation orders' 


        it 'returns earliest rep order first (per defendant)' 

      end
    end

    context 'bills' do
      subject(:response) { do_request.body }
      let(:bills) { JSON.parse(response)['bills'] }

      let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type) }

      it 'returns empty array if no bills found' 


      context 'advocate fee' do
        before do
          # TODO: Consider using seeds here maybe?
          create(:basic_fee_type, :baf)
          create(:basic_fee_type, :pcm)
          create(:basic_fee_type, :ppe)
          create(:basic_fee_type, :noc)
          create(:basic_fee_type, :ndr)
          create(:basic_fee_type, :npw)
          create(:basic_fee_type, :daf)
          create(:basic_fee_type, :dah)
          create(:basic_fee_type, :daj)
        end

        let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, basic_fees: [basic_fee]) }

        it { is_expected.to be_valid_ccr_claim_json }

        it 'not added to bills array when no basic fees are being claimed' 


        context 'when only inapplicable basic fees claimed' do
          let(:basic_fee) { build(:basic_fee, :pcm_fee, quantity: 2, amount: 2, rate: 1) }

          it 'not added to bills array' 

        end

        # TODO: the case type is for fixed fees, which does not support
        # basic fees by default
        # context 'when case type does not permit advocate fees' do
        #   let(:case_type) { create(:case_type, fee_type_code: 'FXCON') }
        #
        #   it 'not added to bills array' do
        #     allow_any_instance_of(CaseType).to receive(:fee_type_code).and_return 'FXCON' # mock a contempt case type
        #     expect(response).to have_json_size(0).at_path("bills")
        #   end
        # end

        context 'bill type' do
          let(:basic_fee) { build(:basic_fee, :baf_fee, quantity: 1, rate: 25) }

          it 'property included' 


          it 'property type valid' 


          it 'valid value included' 

        end

        context 'bill sub type' do
          let(:basic_fee) { build(:basic_fee, :baf_fee, quantity: 1, rate: 25) }

          it 'property included' 


          it 'property type valid' 


          it 'valid value included' 

        end

        context 'pages of prosecution evidence' do
          let(:basic_fee) { build(:basic_fee, :ppe_fee, quantity: 1024, rate: 25) }

          it 'property included' 


          it 'property type valid' 


          it 'value taken from the Pages of prosecution evidence Fee quantity' 

        end

        context 'number of cases uplifts' do
          let(:basic_fee) { build(:basic_fee, :noc_fee, quantity: 2, case_numbers: 'T20170001,T20170002') }

          it 'property included' 


          it 'property type valid' 


          it 'calculated from Number of Cases uplift Fee quantity plus 1, for the "main" case' 

        end

       context 'case numbers' do
          let(:basic_fee) { build(:basic_fee, :noc_fee, quantity: 2, case_numbers: 'T20172765, T20172766') }

          it 'property included' 


          it 'property type valid' 


          it 'value taken from the basic fee - number of case uplifts\' case_numbers attribute' 

        end

        context 'number_of_defendants' do
          let(:basic_fees) { [ build(:basic_fee, :baf_fee, quantity: 1) ] }
          let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, basic_fees: basic_fees, misc_fees: [misc_fee]) }

          it 'property included' 


          it 'property type valid' 


          it 'defaults to 1 if no defendant uplifts claimed' 


          context 'when there is some defendant uplifts' do
            let(:basic_fees) {
              [
                build(:basic_fee, :baf_fee, quantity: 1),
                build(:basic_fee, :ndr_fee, quantity: 2)
              ]
            }

            it 'calculated from sum of Number of defendant uplift fee quantities plus one for main defendant' 

          end
        end

        context 'number of prosecution witnesses' do
          let(:basic_fee) { build(:basic_fee, :npw_fee, quantity: 3) }

          it 'property included' 


          it 'property type valid' 


          it 'property value determined from Number of Prosecution Witnesses Fee quantity' 

        end

        context 'daily attendances' do
          let(:basic_fees) { [ build(:basic_fee, :baf_fee, quantity: 1) ] }
          let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, basic_fees: basic_fees, misc_fees: [misc_fee]) }

          it 'includes property' 


          context 'upper bound value' do
            let(:basic_fees) {
              [
                build(:basic_fee, :baf_fee, quantity: 1),
                build(:basic_fee, :daf_fee, quantity: 38, rate: 1.0),
                build(:basic_fee, :dah_fee, quantity: 10, rate: 1.0),
                build(:basic_fee, :daj_fee, quantity: 1, rate: 1.0)
              ]
            }
            let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, basic_fees: basic_fees, misc_fees: [misc_fee], actual_trial_length: 53) }

            it 'calculated from Daily Attendanance Fee quantities if they exist' 

          end

          context 'lower bound value' do
            context 'for trials' do
              let(:case_type) { create(:case_type, :trial) }
              let(:actual_trial_length) { 1 }
              let(:trial_concluded_at) { 8.days.ago }
              let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, basic_fees: basic_fees, misc_fees: [misc_fee], first_day_of_trial: 10.days.ago, trial_concluded_at: trial_concluded_at, estimated_trial_length: 1, actual_trial_length: actual_trial_length) }

              context 'when no daily attendance fees and trial length is less than 2' do
                let(:actual_trial_length) { 1 }

                it 'calculated as actual trial length' 

              end

              context 'when trial lengths over 2' do
                let(:actual_trial_length) { 4 }
                let(:trial_concluded_at) { 6.days.ago }

                it 'calculated as 2 for trial lengths over 2' 

              end
            end

            context 'for retrials' do
              let(:case_type) { create(:case_type, :retrial) }
              let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, basic_fees: basic_fees, misc_fees: [misc_fee], first_day_of_trial: 10.days.ago, trial_concluded_at: 8.days.ago, estimated_trial_length: 2, actual_trial_length: 2, retrial_started_at: 5.days.ago, retrial_estimated_length: 1, retrial_actual_length: 1, retrial_concluded_at: 0.days.ago) }

              it 'calculated from actual retrial length if no daily attendance fees and retrial length is less than 2' 

            end
          end
        end
      end

      context 'fixed fees' do
        let(:case_type) { create(:case_type, :cbr) }
        let(:misc_fee) { build(:misc_fee, :mispf_fee, :with_date_attended) }
        let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, misc_fees: [misc_fee]) }

        subject(:response) { do_request.body }

        before do
          # TODO: this should probably be using the seeds instead?!
          create(:fixed_fee_type, :fxcbr)
          create(:fixed_fee_type, :fxcbu)
          create(:fixed_fee_type, :fxacv)
          create(:fixed_fee_type, :fxndr)
        end

        context 'when applicable fixed fee claimed' do
          let(:fixed_fee) { build(:fixed_fee, :fxcbr_fee) }
          let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, fixed_fees: [fixed_fee]) }

          it { is_expected.to be_valid_ccr_claim_json }

          it 'added to bills' 

        end

        context 'when no applicable fixed fee claimed' do
          let(:fixed_fee) { build(:fixed_fee, :fxacv_fee, quantity: 13) }
          let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, fixed_fees: [fixed_fee]) }

          it 'fee does not impact the bill' 

        end

        context 'when no fixed fee exists' do
          let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type) }

          it 'fixed fee matching the case type, with defaults, is added to bills' 

        end

        context 'daily attendances' do
          let(:fixed_fees) {
           [
             build(:fixed_fee, :fxcbr_fee, quantity: 3),
             build(:fixed_fee, :fxcbr_fee, quantity: 2)
           ]
          }
          let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, fixed_fees: fixed_fees) }

          it 'includes property' 


          it 'calculated from sum of all applicable fixed fee quantities' 

        end

        context 'case uplift details' do
          let(:fixed_fees) {
           [
             build(:fixed_fee, :fxcbr_fee, quantity: 1),
             build(:fixed_fee, :fxcbu_fee, quantity: 2, case_numbers: 'S20170001, S20170002'),
             build(:fixed_fee, :fxcbu_fee, quantity: 2, case_numbers: 'S20170003, S20170001')
           ]
          }
          let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, fixed_fees: fixed_fees) }

          context 'number_of_cases' do
            it 'includes property' 


            it 'calculated from the count of UNIQUE additional case numbers for all uplift fees of the applicable variety' 

          end

          context 'case_numbers' do
            it 'includes property' 


            it 'consolidated list of UNIQUE additional case numbers for all uplift fees of the applicable variety' 

          end
        end

        context 'number_of_defendants' do
          let(:fixed_fees) {
           [
             build(:fixed_fee, :fxcbr_fee, quantity: 1),
             build(:fixed_fee, :fxndr_fee, quantity: 1)
           ]
          }
          let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, fixed_fees: fixed_fees) }

          context 'without uplifts' do
            let(:fixed_fees) { [ build(:fixed_fee, :fxcbr_fee, quantity: 1) ] }

            it 'includes property' 

          end

          it 'calculated from sum of "number of defendants uplift" fee quanitities on claim plus one' 

        end
      end

      context 'miscellaneous fees' do
        subject(:response) { do_request.body }

        let(:misc_fees) { [build(:misc_fee, :miaph_fee)] }
        let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, misc_fees: misc_fees) }

        context 'when relevant CCCD fees exist' do
          it { is_expected.to be_valid_ccr_claim_json }

          it 'added to bills' 

        end

        context 'when no relevant cccd fee exists' do
          let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type) }

          it 'not added to bills if it is not a miscellaneous fee' 

        end

        context 'when CCCD fee exists but is excluded from injection' do
          context 'Conferences and views cannot be adapted' do
            let(:basic_fees) { [build(:basic_fee, :cav_fee, rate: 1, quantity: 8)] }
            let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, basic_fees: basic_fees) }

            before do
              # TODO: this should probably be using seeds instead
              create(:basic_fee_type, :cav)
            end

            it 'not added to bills if it is of an excluded fee type' 

          end
        end

        context 'when CCCD fee maps to a CCR misc fee' do
          let(:rate) { 0 }
          let(:quantity) { 0 }
          let(:basic_fees) { [build(:basic_fee, :pcm_fee, rate: rate, quantity: quantity)] }
          let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, basic_fees: basic_fees) }

          before do
            # TODO: this should probably be using seeds instead
            create(:basic_fee_type, :pcm)
          end

          context 'that has a value' do
            let(:quantity) { 2 }
            let(:rate) { 1 }

            it 'added to bills' 

          end

          it 'not added to bills if it has no value' 

        end

        context 'bill type' do
          it 'property included' 


          it 'property type valid' 


          it 'property value valid' 

        end

        context 'bill sub type' do
          it 'property included' 


          it 'valid value included' 

        end
      end

      context 'warrant fees' do
        let(:warrant_fee) { build(:warrant_fee, :warr_fee) }
        let(:offence) { create(:offence, :with_fee_scheme_ten) }
        let(:case_type) { create(:case_type, :guilty_plea) }
        let(:claim) { create_claim(:advocate_interim_claim, :without_fees, case_type: case_type, warrant_fee: warrant_fee) }

        before do
          # TODO: we should probably be using the seeds instead
          create(:warrant_fee_type, :warr)
        end

        it { is_expected.to be_valid_ccr_claim_json }

        it 'returns array containing the bill' 


        it 'returns a warrant fee bill' 

      end

      context 'expenses' do
        context 'when an expense is claimed' do
          let(:expenses) { [build(:expense, :car_travel)] }
          let(:claim) { create_claim(:authorised_claim, :without_fees, case_type: case_type, expenses: expenses) }

          it { is_expected.to be_valid_ccr_claim_json }

          it 'added to bills' 

        end
      end
    end
  end
end

