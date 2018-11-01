require 'rails_helper'

RSpec.describe ExternalUsers::Litigators::ClaimsController, type: :controller, focus: true do

  before { sign_in litigator.user }

  let!(:litigator)    { create(:external_user, :litigator) }
  let(:court)         { create(:court) }
  let(:offence)       { create(:offence, :miscellaneous) }
  let(:case_type)     { create(:case_type, :hsts) }
  let(:expense_type)  { create(:expense_type, :car_travel, :lgfs) }
  let(:external_user) { create(:external_user, :litigator, provider: litigator.provider)}
  let(:supplier_number) { litigator.provider.lgfs_supplier_numbers.first.supplier_number }

  describe "GET #new" do
    context 'LGFS provider members only' do
      before { get :new }

      it "returns http success" 


      it 'assigns @claim' 


      it 'assigns @claim to be a litigator claim' 


      it 'routes to litigators new claim path' 


      it 'renders the template' 


    end
  end

  def expense_params
    {
      expense_type_id: expense_type.id,
      location: "London",
      quantity: 1,
      rate: 40,
      reason_id: 1,
      distance: nil,
      amount: 1125.00,
      date_dd: expense_date.day,
      date_mm: expense_date.month,
      date_yyyy: expense_date.year
    }
  end

  describe "POST #create" do
    context 'when litigator signed in' do
      context 'and the input is valid' do

        let(:expense_type) { create(:expense_type, :train) }
        let(:expense_date) { 10.days.ago }
        let(:claim_params) do
          {
            external_user_id: litigator.id,
            additional_information: 'foo',
            court_id: court,
            case_type_id: case_type.id,
            offence_id: offence,
            case_number: 'A20161234',
            supplier_number: supplier_number,
            case_concluded_at_dd: 5.days.ago.day.to_s,
            case_concluded_at_mm: 5.days.ago.month.to_s,
            case_concluded_at_yyyy: 5.days.ago.year.to_s,
            expenses_attributes:
              [
                  expense_params
              ],
              #   {
              #     expense_type_id: expense_type.id,
              #     location: "London",
              #     quantity: 1,
              #     rate: 40
              #   }
              # ],
            defendants_attributes: [
              { first_name: 'John',
                last_name: 'Smith',
                date_of_birth_dd: '4',
                date_of_birth_mm: '10',
                date_of_birth_yyyy: '1980',
                representation_orders_attributes: [
                  {
                    representation_order_date_dd: Time.now.day.to_s,
                    representation_order_date_mm: Time.now.month.to_s,
                    representation_order_date_yyyy: Time.now.year.to_s,
                    maat_reference: '4561237895'
                  }
                ]
              }
            ]
          }
        end

        context 'create draft' do
          it 'creates a claim' 


          it 'redirects to claims list' 


          it 'sets the created claim\'s creator/"owner" to the signed in litigator' 


          it 'sets the claim\'s state to "draft"' 

        end

        context 'submit to LAA' do
          it 'creates a claim' 


          it 'redirects to claim summary if no validation errors present' 


          it 'leaves the claim\'s state in "draft"' 

        end

        context 'multi-step form submit to LAA' do
          let(:case_number) { 'A20168888' }
          let(:case_concluded_at) { 5.days.ago }
          let(:representation_order_date) { case_concluded_at }

          let(:claim_params_step1) do
            {
              external_user_id: litigator.id,
              supplier_number: supplier_number,
              court_id: court,
              case_type_id: case_type.id,
              case_number: case_number,
              case_concluded_at_dd: case_concluded_at.day.to_s,
              case_concluded_at_mm: case_concluded_at.month.to_s,
              case_concluded_at_yyyy: case_concluded_at.year.to_s,
            }
          end

          let(:claim_params_step2) do
            {
              form_step: :defendants,
              defendants_attributes: [
                  {
                    first_name: 'John',
                    last_name: 'Smith',
                    date_of_birth_dd: '4',
                    date_of_birth_mm: '10',
                    date_of_birth_yyyy: '1980',
                    representation_orders_attributes: [
                        {
                          representation_order_date_dd: representation_order_date.day.to_s,
                          representation_order_date_mm: representation_order_date.month.to_s,
                          representation_order_date_yyyy: representation_order_date.year.to_s,
                          maat_reference: '4561237895'
                        }
                    ]
                  }
              ]
            }
          end

          let(:subject_claim) { Claim::LitigatorClaim.where(case_number: case_number).first }

          it 'validates step fields and move to next steps' 

        end
      end

      context 'submit to LAA with incomplete/invalid params' do
        let(:invalid_claim_params)      { { advocate_category: 'QC' } }
        it 'does not create a claim' 


        it 'renders the new template' 

      end

      context 'conditional fee logic' do
        let!(:misc_fee_type_1)          { FactoryBot.create :misc_fee_type, description: 'Miscellaneous Fee Type 1' }
        let!(:misc_fee_type_2)          { FactoryBot.create :misc_fee_type, description: 'Miscellaneous Fee Type 2' }
        let!(:fixed_fee_type_1)         { FactoryBot.create :fixed_fee_type, description: 'Fixed Fee Type 1' }
        let!(:graduated_fee_type_1)     { FactoryBot.create :graduated_fee_type, description: 'Graduated Fee Type 1' }

        let(:claim_params)              { valid_claim_fee_params }
        let(:invalid_claim_params)      { valid_claim_fee_params.reject{ |k,v| k == 'case_number'} }

        context 'graduated fee case types' do
          context 'valid params' do
            before do
              post :create, params: { claim: claim_params, commit_submit_claim: 'Submit to LAA' }
            end

            it 'should be a redirect' 


            it 'should be a valid claim' 


            it 'should create the graduated fee' 


            it 'should create the miscellaneous fees' 


             it 'should update claim total to sum of graduated and miscellaneous fees' 
            it 'should redisplay the page' 


            it 'should display error messages ' 


            it 'should not persist any of the data' 

          end
        end

        context 'fixed fee case types' do
          context 'valid params' do
            let(:fixed_fee_claim_params) do
              params = claim_params.dup
              params['case_type_id'] = FactoryBot.create(:case_type, :fixed_fee).id.to_s
              params.delete(:graduated_fee_attributes)
              params.merge!(fixed_fee_attributes)
            end

            before do
              post :create, params: { claim: fixed_fee_claim_params, commit_submit_claim: 'Submit to LAA' }
            end

            it 'should be a redirect' 


            it 'should create the fixed fee' 


            it 'should create the miscellaneous fees' 


            it 'should NOT create the graduated fee' 


            it 'should update claim total to sum of fixed and miscellaneous fees' 

          end
        end
      end

      context 'document checklist' do
        let(:claim_params) do
          {
             additional_information: 'foo',
             court_id: court,
             case_type_id: case_type.id,
             offence_id: offence,
             case_number: 'A20161234',
             evidence_checklist_ids:  ['2', '3', '']
          }
        end

        it 'should create a claim with document checklist items' 

      end

    end
  end

  describe "GET #edit" do
    let(:edit_request) { -> { get :edit, params: { id: claim } } }

    before { edit_request.call }

    context 'editable claim' do
      let(:claim) { create(:litigator_claim, creator: litigator) }

      it "returns http success" 


      it 'assigns @claim' 


      it 'claim is in the first submission step by default' 


      context 'when a step is provided' do
        let(:step) { :defendants }
        let(:edit_request) { -> { get :edit, params: { id: claim, step: step } } }

        it 'claim is submitted submission step' 

      end

      it 'routes to litigators edit path' 


      it 'renders the template' 

    end

    context 'uneditable claim' do
      let(:claim) { create(:litigator_claim, :allocated, creator: litigator) }

      it 'redirects to the claims index' 

    end
  end

  describe "PUT #update" do
    subject { create(:litigator_claim, creator: litigator) }

    context 'when valid' do

      context 'and deleting a rep order' do
        before {
          put :update, params: { id: subject, claim: { defendants_attributes: { '1' => { id: subject.defendants.first, representation_orders_attributes: {'0' => {id: subject.defendants.first.representation_orders.first, _destroy: 1}}}}}, commit_save_draft: 'Save to drafts' }
        }
        it 'reduces the number of associated rep orders by 1' 

      end

      context 'and saving to draft' do
        it 'updates a claim' 


        it 'redirects to claims list path' 

      end

      context 'and submitted to LAA' do
        before do
          get :edit, params: { id: subject }
          put :update, params: { id: subject, claim: { additional_information: 'foo' }, summary: true, commit_submit_claim: 'Submit to LAA' }
        end

        it 'redirects to the claim summary page' 

      end
    end

    context 'when submitted to LAA and invalid ' do
      it 'does not set claim to submitted' 


      it 'renders edit template' 

    end

    context 'Date Parameter handling' do
      it 'should transform dates with named months into dates' 


      it 'should transform dates with numbered months into dates' 

    end
  end

  # local helpers
  # -------------------------

  def valid_claim_fee_params
    case_type = FactoryBot.create :case_type

    HashWithIndifferentAccess.new(
      {
       "source" => 'web',
       "supplier_number" => supplier_number,
       "case_type_id" => case_type.id.to_s,
       "court_id" => court.id.to_s,
       "case_number" => "A20161234",
       "offence_class_id" => offence.offence_class.id.to_s,
       "offence_id" => offence.id.to_s,
       "first_day_of_trial_dd" => '13',
       "first_day_of_trial_mm" => '5',
       "first_day_of_trial_yyyy" => '2015',
       "estimated_trial_length" => "2",
       "actual_trial_length" => "2",
       "trial_concluded_at_dd" => "15",
       "trial_concluded_at_mm" => "05",
       "trial_concluded_at_yyyy" => "2015",
       "case_concluded_at_dd" => "15",
       "case_concluded_at_mm" => "05",
       "case_concluded_at_yyyy" => "2015",
       "evidence_checklist_ids" => ["1", "5", ""],
       "defendants_attributes"=>
        {"0"=>
          {"first_name" => "Stephen",
           "last_name" => "Richards",
           "date_of_birth_dd" => "13",
           "date_of_birth_mm" => "08",
           "date_of_birth_yyyy" => "1966",
           "_destroy" => "false",
           "representation_orders_attributes"=>{
             "0"=>{
               "representation_order_date_dd" => "13",
               "representation_order_date_mm" => "05",
               "representation_order_date_yyyy" => "2015",
               "maat_reference" => "1594851269",
             }
            }
          }
        },
       "additional_information" => "",
       "graduated_fee_attributes"=>
        {
          "fee_type_id" => graduated_fee_type_1.id.to_s, "quantity" => "12", "amount" => "2000", "date_dd" => "15", "date_mm" => "05", "date_yyyy" => "2015", "_destroy" => "false"
        },
        "misc_fees_attributes"=>
        {
          "0"=>{"fee_type_id" => misc_fee_type_1.id.to_s, "amount" => "125", "_destroy" => "false"},
          "1"=>{"fee_type_id" => misc_fee_type_2.id.to_s, "amount" => "250", "_destroy" => "false"},
        },
       "expenses_attributes"=>
       {
        "0"=>{"expense_type_id" => "", "location" => "", "quantity" => "", "rate" => "", "amount" => "", "_destroy" => "false"}
       },
       "apply_vat" => "0"
     }
    )
  end

  def fixed_fee_attributes
    HashWithIndifferentAccess.new({
        fixed_fee_attributes: {
            fee_type_id: fixed_fee_type_1.id.to_s, amount: '2500', date_dd: '15', date_mm: '05', date_yyyy: '2015', _destroy: 'false'
        }
    })
  end
end

