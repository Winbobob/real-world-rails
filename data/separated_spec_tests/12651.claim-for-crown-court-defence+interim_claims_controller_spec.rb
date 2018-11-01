require 'rails_helper'

RSpec.describe ExternalUsers::Litigators::InterimClaimsController, type: :controller, focus: true do
  before { sign_in litigator.user }

  let!(:litigator)    { create(:external_user, :litigator) }
  let(:court)         { create(:court) }
  let(:offence)       { create(:offence, :miscellaneous) }
  let(:case_type)     { create(:case_type, :hsts) }
  let(:expense_type)  { create(:expense_type, :car_travel, :lgfs) }
  let(:external_user) { create(:external_user, :litigator, provider: litigator.provider)}
  let(:supplier_number) { litigator.provider.lgfs_supplier_numbers.first.supplier_number }

  describe 'GET #new' do
    before { get :new }

    it 'returns http success' 


    it 'assigns @claim' 


    it 'assigns @claim to be a interim claim' 


    it 'routes to litigators interim new claim path' 


    it 'renders the template' 

  end

  describe 'POST #create' do
    context 'when litigator signed in' do
      context 'and the input is valid' do

        let(:claim_params) do
          {
            external_user_id: litigator.id,
            additional_information: 'foo',
            court_id: court,
            case_type_id: case_type.id,
            offence_id: offence,
            case_number: 'A20161234',
            supplier_number: supplier_number,
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


          it 'sets the claim\'s state to "draft"' 

        end

        context 'submit to LAA' do
          it 'creates a claim' 


          it 'redirects to claim summary if no validation errors present' 


          it 'leaves the claim\'s state in "draft"' 

        end

        context 'multi-step form submit to LAA' do
          let(:case_number) { 'A20168888' }
          let(:interim_fee_type)  { create(:interim_fee_type, :effective_pcmh) }

          let(:interim_fee_params) {
            {
                interim_fee_attributes: {
                    fee_type_id: interim_fee_type.id,
                    quantity: 2,
                    amount: 10.0
                },
                effective_pcmh_date_dd: 5.days.ago.day.to_s,
                effective_pcmh_date_mm: 5.days.ago.month.to_s,
                effective_pcmh_date_yyyy: 5.days.ago.year.to_s
            }
          }

          let(:claim_params_step1) do
            {
                external_user_id: litigator.id,
                supplier_number: supplier_number,
                court_id: court,
                case_type_id: case_type.id,
                offence_id: offence,
                case_number: case_number,
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
              additional_information: 'foo'
            }.merge(interim_fee_params)
          end

          let(:subject_claim) { Claim::InterimClaim.where(case_number: case_number).first }

          context 'step 1 continue' do
            render_views
            before do
              post :create, params: { commit_continue: 'Continue', claim: claim_params_step1 }
            end

            it 'should leave claim in draft state' 


            it { expect(response).to redirect_to edit_litigators_interim_claim_path(subject_claim, step: :defendants) }
          end

          context 'step 2 submit to LAA' do
            before do
              post :create, params: { commit_continue: 'Continue', claim: claim_params_step1 }
              put :update, params: { id: subject_claim, commit_submit_claim: 'Submit to LAA', claim: claim_params_step2 }
            end

            it 'saves as draft' 


            it 'redirects to summary page' 


            it 'updates the interim fee' 


          end
        end
      end

      context 'submit to LAA with incomplete/invalid params' do
        let(:invalid_claim_params)      { { advocate_category: 'QC' } }
        it 'does not create a claim' 


        it 'renders the new template' 

      end
    end
  end

  describe 'GET #edit' do
    let(:edit_request) { -> { get :edit, params: { id: claim } } }

    before { edit_request.call }

    context 'editable claim' do
      let(:claim) { create(:interim_claim, creator: litigator) }

      it 'returns http success' 


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
      let(:claim) { create(:interim_claim, :allocated, :interim_effective_pcmh_fee, creator: litigator) }

      it 'redirects to the claims index' 

    end
  end

  describe 'PUT #update' do
    subject { create(:interim_claim, :interim_effective_pcmh_fee, creator: litigator) }

    context 'when valid' do

      context 'and deleting a rep order' do
        before {
          put :update, params: { id: subject, claim: { defendants_attributes: { '1' => { id: subject.defendants.first, representation_orders_attributes: {'0' => {id: subject.defendants.first.representation_orders.first, _destroy: 1}}}}}, commit_save_draft: 'Save to drafts' }
        }
        it 'reduces the number of associated rep orders by 1' 

      end

      context 'and saving to draft' do
        before { put :update, params: { id: subject, claim: { additional_information: 'foo' }, commit_save_draft: 'Save to drafts' } }
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

end

