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

  def is_valid_ccr_json(response)
    expect(response).to be_valid_ccr_claim_json
  end

  after(:all) { clean_database }

  before(:all) do
    @case_worker = create(:case_worker, :admin)
    @claim = create(:authorised_claim, :without_fees).tap do |claim|
      # NOTE: this will also create the BABAF basic fee TYPE and MISPF misc fee TYPE
      create(:basic_fee, :baf_fee, claim: claim, quantity: 1)
      create(:misc_fee, :mispf_fee, :with_date_attended, claim: claim)
    end
  end

  # mock a Trial case type's fee_type_code as factories
  # do NOT create real/mappable fee type codes
  before do
    allow_any_instance_of(CaseType).to receive(:fee_type_code).and_return 'GRTRL'
  end

  def do_request(claim_uuid: @claim.uuid, api_key: @case_worker.user.api_key)
    get "/api/ccr/claims/#{claim_uuid}", {api_key: api_key}, {format: :json}
  end

  describe 'GET /ccr/claim/:uuid?api_key=:api_key' do
    it 'returns 406, Not Acceptable, if requested API version (via header) is not supported' 


    it 'requires an API key' 


    context 'when accessed by an ExternalUser' do
      before { do_request(api_key: @claim.external_user.user.api_key )}

      it 'returns unauthorised' 

    end

    context 'claim not found' do
      it 'respond not found when claim is not found' 

    end

    context 'JSON response' do
      subject(:response) { do_request }

      it { is_valid_ccr_json(response) }
    end

    context 'defendants' do
      subject(:response) do
        do_request(claim_uuid: @claim.uuid, api_key: @case_worker.user.api_key).body
      end

      before do
        travel_to 2.day.from_now do
          create(:defendant, claim: @claim)
        end
      end

      it 'returns multiple defendants' 


      it 'returns defendants in order created marking earliest created as the "main" defendant' 


      context 'representation orders' do
        it 'returns multiple representation orders' 


        # NOTE: use of factory defaults results in two rep orders for the first
        # defendant with dates 400 and 380 days before claim created
        it 'returns earliest rep order first (per defendant)' 

      end
    end

    context 'bills' do
      subject(:response) { do_request(claim_uuid: claim.uuid, api_key: @case_worker.user.api_key).body }
      subject(:bills) { JSON.parse(response)['bills'] }

      let(:claim) do
        create(:authorised_claim, :without_fees)
      end

      it 'returns empty array if no bills found' 


      context 'advocate fee' do
        it { is_valid_ccr_json(response) }

        it 'not added to bills array when no basic fees are being claimed' 


        it 'not added to bills array when only inapplicable basic fees claimed' 


        it 'not added to bills array when case type does not permit advocate fees' 


        context 'bill type' do
          before do
            claim.basic_fees.find_by(fee_type_id: Fee::BasicFeeType.find_by(unique_code: 'BABAF')).update(quantity: 1)
          end

          it 'property included' 


          it 'property type valid' 


          it 'valid value included' 

        end

        context 'bill sub type' do
          before do
            claim.basic_fees.find_by(fee_type_id: Fee::BasicFeeType.find_by(unique_code: 'BABAF')).update(quantity: 1)
          end

          it 'property included' 


          it 'property type valid' 


          it 'valid value included' 

        end

        context 'pages of prosecution evidence' do
          subject(:response) do
            do_request(claim_uuid: claim.uuid, api_key: @case_worker.user.api_key).body
          end

          before do
            create(:basic_fee, :ppe_fee, claim: claim, quantity: 1024)
          end

          it 'property included' 


          it 'property type valid' 


          it 'value taken from the Pages of prosecution evidence Fee quantity' 

        end

        context 'number of cases uplifts' do
          subject(:response) do
            do_request(claim_uuid: claim.uuid, api_key: @case_worker.user.api_key).body
          end

          before do
            create(:basic_fee, :noc_fee, claim: claim, quantity: 2, case_numbers: 'T20170001,T20170002')
          end

          it 'property included' 


          it 'property type valid' 


          it 'calculated from Number of Cases uplift Fee quantity plus 1, for the "main" case' 

        end

       context 'case numbers' do
          subject(:response) do
            do_request(claim_uuid: claim.uuid, api_key: @case_worker.user.api_key).body
          end

          before do
            create(:basic_fee, :noc_fee, claim: claim, quantity: 2, case_numbers: 'T20172765, T20172766')
          end

          it 'property included' 


          it 'property type valid' 


          it 'value taken from the basic fee - number of case uplifts\' case_numbers attribute' 

        end

        context 'number_of_defendants' do
          subject(:response) do
            do_request(claim_uuid: claim.uuid, api_key: @case_worker.user.api_key).body
          end

          let(:bandr) { create(:basic_fee_type, :ndr) }

          before do
            claim.basic_fees.find_by(fee_type_id: Fee::BasicFeeType.find_by(unique_code: 'BABAF')).update(quantity: 1)
          end

          it 'property included' 


          it 'property type valid' 


          it 'defaults to 1 if no defendant uplifts claimed' 


          it 'calculated from sum of Number of defendant uplift fee quantities plus one for main defendant' 

        end

        context 'number of prosecution witnesses' do
          subject(:response) do
            do_request(claim_uuid: claim.uuid, api_key: @case_worker.user.api_key).body
          end

          before do
            create(:basic_fee, :npw_fee, claim: claim, quantity: 3)
          end

          it 'property included' 


          it 'property type valid' 


          it 'property value determined from Number of Prosecution Witnesses Fee quantity' 

        end

        context 'daily attendances' do
          subject(:response) do
            do_request(claim_uuid: claim.uuid, api_key: @case_worker.user.api_key).body
          end

          before do
            # NOTE: you must be claiming at least on basic fee for an advocate fee to be submitted
            claim.basic_fees.find_by(fee_type_id: Fee::BasicFeeType.find_by(unique_code: 'BABAF')).update(quantity: 1)
          end

          it 'includes property' 


          context 'upper bound value' do
            before do
              claim.actual_trial_length = 53
              create(:basic_fee, :daf_fee, claim: claim, quantity: 38, rate: 1.0)
              create(:basic_fee, :dah_fee, claim: claim, quantity: 10, rate: 1.0)
              create(:basic_fee, :daj_fee, claim: claim, quantity: 1, rate: 1.0)
            end

            it 'calculated from Daily Attendanance Fee quantities if they exist' 

          end

          context 'lower bound value' do
            context 'for trials' do
              let(:trial) { create(:case_type, :trial) }

              before do
                claim.update_attributes!(
                  case_type: trial,
                  first_day_of_trial: 10.days.ago,
                  trial_concluded_at: 8.days.ago,
                  estimated_trial_length: 1,
                  actual_trial_length: 1
                )
              end

              it 'calculated as actual trial length if no daily attendance fees and trial length is less than 2' 


              it 'calculated as 2 for trial lengths over 2' 

            end

            context 'for retrials' do
              let(:retrial) { create(:case_type, :retrial) }

              before do
                claim.update_attributes!(
                  case_type: retrial,
                  first_day_of_trial: 10.days.ago,
                  trial_concluded_at: 8.days.ago,
                  estimated_trial_length: 2,
                  actual_trial_length: 2,
                  retrial_started_at: 5.days.ago,
                  retrial_estimated_length: 1,
                  retrial_actual_length: 1,
                  retrial_concluded_at: 0.days.ago
                )
              end

              it 'calculated from actual retrial length if no daily attendance fees and retrial length is less than 2' 

            end
          end
        end
      end

      context 'fixed fees' do
        subject(:response) do
          do_request(claim_uuid: claim.uuid, api_key: @case_worker.user.api_key).body
        end

        let(:fxcbr) { create(:fixed_fee_type, :fxcbr) }
        let(:fxcbu) { create(:fixed_fee_type, :fxcbu) }
        let(:fxndr) { create(:fixed_fee_type, :fxndr) }
        let(:fxacv) { create(:fixed_fee_type, :fxacv) }

        before do
          allow_any_instance_of(CaseType).to receive(:fee_type_code).and_return 'FXCBR'
        end

        context 'when applicable fixed fee claimed' do
          before do
            create(:fixed_fee, fee_type: fxcbr, claim: claim)
          end

          it { is_valid_ccr_json(response) }

          it 'added to bills' 

        end

        context 'when no applicable fixed fee claimed' do
          before do
            create(:fixed_fee, fee_type: fxacv, claim: claim, quantity: 13)
          end

          it 'fee does not impact the bill' 

        end

        context 'when no fixed fee exists' do
          it 'fixed fee matching the case type, with defaults, is added to bills' 

        end

        context 'daily attendances' do
          before do
            create(:fixed_fee, fee_type: fxcbr, claim: claim, quantity: 3)
            create(:fixed_fee, fee_type: fxcbr, claim: claim, quantity: 2)
          end

          it 'includes property' 


          it 'calculated from sum of all applicable fixed fee quantities' 

        end

        context 'case uplift details' do
          before do
            create(:fixed_fee, fee_type: fxcbr, claim: claim, quantity: 1)
            create(:fixed_fee, fee_type: fxcbu, claim: claim, quantity: 2, case_numbers: ' S20170001 , S20170002 ')
            create(:fixed_fee, fee_type: fxcbu, claim: claim, quantity: 2, case_numbers: ' S20170003 , S20170001 ')
          end

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
          before do |example|
            create(:fixed_fee, fee_type: fxcbr, claim: claim, quantity: 1)
            create(:fixed_fee, fee_type: fxndr, claim: claim, quantity: 1) unless example.metadata[:skip_uplifts]
          end

          it 'includes property', :skip_uplifts do
            expect(response).to have_json_path("bills/0/number_of_defendants")
            expect(response).to have_json_type(String).at_path "bills/0/number_of_defendants"
          end

          it 'calculated from sum of "number of defendants uplift" fee quanitities on claim plus one' 

        end
      end

      context 'miscellaneous fees' do
        subject(:response) do
          do_request(claim_uuid: claim.uuid, api_key: @case_worker.user.api_key).body
        end

        before do
          create(:misc_fee, claim: claim)
          allow_any_instance_of(Fee::MiscFeeType).to receive(:unique_code).and_return 'MIAPH'
        end

        context 'when relevant CCCD fees exist' do
          it { is_valid_ccr_json(response) }

          it 'added to bills' 

        end

        context 'when no relevant cccd fee exists' do
          before do
            claim.misc_fees.delete_all
          end

          it 'not added to bills if it is not a miscellaneous fee' 

        end

        context 'when CCCD fee maps to a CCR misc fee' do
          before do
            claim.misc_fees.delete_all
            allow_any_instance_of(Fee::BasicFeeType).to receive(:unique_code).and_return 'BAPCM'
          end

          it 'added to bills if it has a value' 


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

      context 'expenses' do
        subject(:response) do
          do_request(claim_uuid: claim.uuid, api_key: @case_worker.user.api_key).body
        end

        context 'when an expense is claimed' do
          before { create(:expense, :car_travel, claim: claim) }

          it { is_valid_ccr_json(response) }

          it 'added to bills' 

        end
      end
    end
  end
end

