require 'rails_helper'

RSpec.describe ExternalUsers::Advocates::ClaimsController, type: :controller, focus: true do
  let!(:advocate) { create(:external_user, :advocate) }
  before { sign_in advocate.user }

  describe "GET #new" do
    context 'AGFS or LGFS provider members only' do
      before { get :new }
      it "returns http success" 


      it 'assigns @claim' 


      it 'assigns @claim to be an advocate claim' 


      it 'routes to advocates new claim path' 


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
      amount: 1125.00,
      date_dd: expense_date.day,
      date_mm: expense_date.month,
      date_yyyy: expense_date.year
    }
  end

  describe "POST #create" do
    context 'when advocate signed in' do
      context 'and the input is valid' do
        let(:court)         { create(:court) }
        let(:offence)       { create(:offence) }
        let(:case_type)     { create(:case_type) }
        let(:expense_type)  { create(:expense_type, :train) }
        let(:expense_date)  { 10.days.ago }
        let(:claim_params) do
          {
            additional_information: 'foo',
            court_id: court,
            case_type_id: case_type.id,
            offence_id: offence,
            case_number: 'A20161234',
            advocate_category: 'QC',
            expenses_attributes:
              [
                  expense_params
              ],
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
          before(:each) do
            expect(Claim::AdvocateClaim.active.count).to eq(0)
            post :create, params: { commit_save_draft: 'Save to drafts', claim: claim_params }
          end

          it 'creates the claim and sets the state to "draft"' 


          it 'redirects to claims list' 


          it 'sets the created claim\'s external_user/"owner" to the signed in advocate' 

        end

        context 'submit to LAA' do
          it 'creates a claim' 


          it 'redirects to claim summary if no validation errors present' 


          it 'sets the created claim\'s external_user/owner to the signed in advocate' 


          it 'leaves the claim\'s state in "draft"' 


          context 'blank expenses' do
            let(:expense_params) do
              {
                  expense_type_id: '',
                  location: '',
                  distance: '',
                  date_dd: '',
                  date_mm: '',
                  date_yyyy: '',
                  reason_id: '',
                  reason_text: '',
                  amount: '0.00',
                  vat_amount: '0.00',
                  _destroy: false
              }
            end

            it 'rejects the blank expense when all blank or zero, not failing validations, and creates the claim' 

          end
        end

        context 'multi-step form submit to LAA' do
          let(:case_number) { 'A20168888' }

          let(:claim_params_step1) do
            {
                claim_class: 'Claim::AdvocateClaim',
                court_id: court,
                case_type_id: case_type.id,
                offence_id: offence,
                case_number: case_number,
                advocate_category: 'QC',
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

          let(:claim_params_step2) do
            {
              form_step: 'defendants',
              additional_information: 'foo',
              expenses_attributes:
              [
                expense_params
              ]
            }
          end

          let(:subject_claim) { Claim::AdvocateClaim.active.where(case_number: case_number).first }

          it 'validates step fields and move to next steps' 

        end
      end

      context 'submit to LAA with incomplete/invalid params' do
        let(:invalid_claim_params)      { { claim_class: 'Claim::AdvocateClaim' } }
        it 'does not create a claim' 


        it 'renders the new template' 

      end

      context 'basic and non-basic fees' do

        let!(:basic_fee_type_1)         { FactoryBot.create :basic_fee_type, description: 'Basic Fee Type 1' }
        let!(:basic_fee_type_2)         { FactoryBot.create :basic_fee_type, description: 'Basic Fee Type 2' }
        let!(:basic_fee_type_3)         { FactoryBot.create :basic_fee_type, description: 'Basic Fee Type 3' }
        let!(:basic_fee_type_4)         { FactoryBot.create :basic_fee_type, description: 'Basic Fee Type 4' }
        let!(:misc_fee_type_1)          { FactoryBot.create :misc_fee_type, description: 'Miscellaneous Fee Type 1' }
        let!(:misc_fee_type_2)          { FactoryBot.create :misc_fee_type, description: 'Miscellaneous Fee Type 2' }
        let!(:fixed_fee_type_1)         { FactoryBot.create :fixed_fee_type, description: 'Fixed Fee Type 1' }

        let(:court)                     { create(:court) }
        let(:offence)                   { create(:offence) }
        let(:claim_params)              { valid_claim_fee_params }
        let(:invalid_claim_params)      { valid_claim_fee_params.reject{ |k,v| k == 'advocate_category'} }

        context 'non fixed fee case types' do
          before(:each) do
            @file = fixture_file_upload('files/repo_order_1.pdf', 'application/pdf')
          end

          context 'valid params' do
            it 'should create a claim with all basic fees and specified miscellaneous but NOT the fixed fees' 

          end

          context 'invalid params' do
            render_views
            it 'should redisplay the page with error messages and all the entered data in basic, miscellaneous and fixed fees' 

          end
        end

        context 'fixed fee case types' do
          context 'valid params' do
            it 'should create a claim with fixed fees ONLY' 

          end
        end
      end

      context 'document checklist' do
        let(:court)             { create(:court) }
        let(:offence)           { create(:offence) }
        let(:case_type)         { create(:case_type) }
        let(:claim_params) do
          {
             additional_information: 'foo',
             court_id: court,
             case_type_id: case_type.id,
             offence_id: offence,
             case_number: '12345',
             advocate_category: 'QC',
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
      let(:claim) { create(:advocate_claim, external_user: advocate) }

      it "returns http success" 


      it 'updates the last_edited_at field' 


      it 'assigns @claim' 


      it 'claim is in the first submission step by default' 


      context 'when a step is provided' do
        let(:step) { :defendants }
        let(:edit_request) { -> { get :edit, params: { id: claim, step: step } } }

        it 'claim is submitted submission step' 

      end

      it 'renders the template' 

    end

    context 'uneditable claim' do
      let(:claim) { create(:allocated_claim, external_user: advocate) }

      it 'does not update the last_edited_at field' 


      it 'redirects to advocates claims index' 

    end
  end

  describe "PUT #update" do
    subject { create(:claim, external_user: advocate) }

    context 'when valid' do

      context 'and deleting a rep order' do
        before {
          put :update, params: { id: subject, claim: { defendants_attributes: { '1' => { id: subject.defendants.first, representation_orders_attributes: {'0' => {id: subject.defendants.first.representation_orders.first, _destroy: 1}}}}}, commit_save_draft: 'Save to drafts' }
        }
        it 'reduces the number of associated rep order by 1' 

      end

      context 'and editing an API created claim' do
        before(:each) do
          subject.update(source: 'api')
        end

        context 'and saving to draft' do
          before { put :update, params: { id: subject, claim: { additional_information: 'foo' }, commit_save_draft: 'Save to drafts' } }
          it 'sets API created claims source to indicate it is from API but has been edited in web' 

        end

        context 'and submitted to LAA' do
          before { put :update, params: { id: subject, claim: { additional_information: 'foo' }, summary: true, commit_submit_claim: 'Submit to LAA' } }
          it 'sets API created claims source to indicate it is from API but has been edited in web' 

        end
      end

      context 'and editing a JSON imported claim' do
        before(:each) do
          subject.update(source: 'json_import')
        end

        context 'and saving to draft' do
          before { put :update, params: { id: subject, claim: { additional_information: 'foo' }, commit_save_draft: 'Save to drafts' } }

          it 'updates the source to indicate it was originally from JSON import but has been edited via web' 

        end

        context 'and submitted to LAA' do
          before { put :update, params: { id: subject, claim: { additional_information: 'foo' }, summary: true, commit_submit_claim: 'Submit to LAA' } }

          it 'updates the source to indicate it was originally from JSON import but has been edited via web' 

        end
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

  def valid_claim_fee_params
  case_type = FactoryBot.create :case_type
  HashWithIndifferentAccess.new(
    {
     "source" => 'web',
     "case_type_id" => case_type.id.to_s,
     "court_id" => court.id.to_s,
     "case_number" => "CASE98989",
     "advocate_category" => "QC",
     "offence_class_id" => "2",
     "offence_id" => offence.id.to_s,
     "first_day_of_trial_dd" => '13',
     "first_day_of_trial_mm" => '5',
     "first_day_of_trial_yyyy" => '2015',
     "estimated_trial_length" => "2",
     "actual_trial_length" => "2",
     "trial_concluded_at_dd" => "15",
     "trial_concluded_at_mm" => "05",
     "trial_concluded_at_yyyy" => "2015",
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
     "basic_fees_attributes"=>
      {
        "0"=>{"quantity" => "10", "rate" => "100", "fee_type_id" => basic_fee_type_1.id.to_s},
        "1"=>{"quantity" => "0", "rate" => "0.00", "fee_type_id" => basic_fee_type_2.id.to_s},
        "2"=>{"quantity" => "1", "rate" => "9000.45", "fee_type_id" => basic_fee_type_3.id.to_s},
        "3"=>{"quantity" => "5", "rate" => "25", "fee_type_id" => basic_fee_type_4.id.to_s}
        },
      "fixed_fees_attributes"=>
      {
        "0"=>{"fee_type_id" => fixed_fee_type_1.id.to_s, "quantity" => "25", "rate" => "10", "_destroy" => "false"}
      },
      "misc_fees_attributes"=>
      {
        "1"=>{"fee_type_id" => misc_fee_type_2.id.to_s, "quantity" => "2", "rate" => "125", "_destroy" => "false"},
      },
     "expenses_attributes"=>
     {
      "0"=>{"expense_type_id" => "", "location" => "", "quantity" => "", "rate" => "", "amount" => "", "_destroy" => "false"}
     },
     "apply_vat" => "0"
   }
   )
  end

end

