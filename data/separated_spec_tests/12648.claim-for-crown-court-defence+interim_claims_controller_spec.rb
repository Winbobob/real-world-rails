require 'rails_helper'

RSpec.describe ExternalUsers::Advocates::InterimClaimsController, type: :controller, focus: true do
  let(:resource_klass) { Claim::AdvocateInterimClaim }
  let(:unauthorized_user) { create(:external_user, :litigator) }
  let(:authorized_user) { create(:external_user, :advocate) }

  def create_claim(*args)
    claim = build(*args)
    claim.save
    claim.reload
  end

  describe "GET #new" do
    subject(:new_request) { get :new }

    context 'when the user in NOT authenticated' do
      it 'redirects the user to the login page' 

    end

    context 'when the user is authenticated' do
      context 'but the user is not authorized to manage this claim type' do
        before do
          sign_in(unauthorized_user.user)
        end

        it 'redirects the user to its home page with an unauthorised error' 

      end

      context 'and the user is authorized to manage this claim type' do
        before do
          sign_in(authorized_user.user)
        end

        it 'assigns @claim is an instance of the defined claim type' 


        it 'renders the template' 

      end
    end
  end

  describe "POST #create" do
    let(:court) { create(:court) }
    let(:form_action) { { commit_continue: 'Save and continue' } }
    let(:claim_params) {
      {
        form_step: 'case_details',
        court_id: court.id,
        case_number: 'A20161234',
        case_transferred_from_another_court: 'false'
      }
    }
    let(:params) { { claim: claim_params }.merge(form_action) }

    subject(:create_request) { post :create, params: params }

    context 'when the user in NOT authenticated' do
      it 'redirects the user to the login page' 


      it 'does not create a claim record' 

    end

    context 'when the user is authenticated' do
      context 'but the user is not authorized to manage this claim type' do
        before do
          sign_in(unauthorized_user.user)
        end

        it 'redirects the user to its home page with an unauthorised error' 


        it 'does not create a claim record' 

      end

      context 'and the user is authorized to manage this claim type' do
        before do
          sign_in(authorized_user.user)
        end

        context 'but the submitted claim params are invalid' do
          let(:claim_params) {
            {
              form_step: 'case_details',
              court_id: '',
              case_number: '',
              case_transferred_from_another_court: 'false'
            }
          }

          context 'and the form params were submitted as a draft' do
            let(:form_action) { { commit_save_draft: 'Save as draft' } }

            it 'assigns @claim with the newly created record' 


            it 'redirects to claims list page' 


            it 'creates a new claim record as draft with the submitted data' 

          end

          context 'and the form params were submitted to LAA' do
            let(:form_action) { { commit_submit_claim: 'Submit to LAA' } }

            it 'assigns @claim with errors' 


            it 'renders the template' 


            it 'does not create a claim record' 

          end

          it 'assigns @claim with errors' 


          it 'renders the template' 


          it 'does not create a claim record' 

        end

        context 'and the form params were submitted to LAA' do
          let(:form_action) { { commit_submit_claim: 'Submit to LAA' } }

          it 'assigns @claim with the newly created record' 


          it 'redirects user to the claim summary page' 


          it 'creates a new claim record with the submitted data' 

        end

        it 'assigns @claim with the newly created record' 


        it 'redirects the user to the next step of the claim edit form page' 


        it 'creates a new claim record with the submitted data' 

      end
    end
  end

  describe "GET #edit" do
    let(:claim) { create(:advocate_interim_claim, external_user: authorized_user, creator: authorized_user) }

    subject(:edit_request) { get :edit, params: { id: claim.id } }

    context 'when the user in NOT authenticated' do
      it 'redirects the user to the login page' 

    end

    context 'when the user is authenticated' do
      context 'but the user is not authorized to manage this claim type' do
        before do
          sign_in(unauthorized_user.user)
        end

        it 'redirects the user to its home page with an unauthorised error' 

      end


      context 'and the user is authorized to manage this claim type' do
        before do
          sign_in(authorized_user.user)
        end

        context 'but the user is not the creator of the claim' do
          let(:other_authorized_user) { create(:external_user, :advocate) }
          let(:claim) { create_claim(:advocate_interim_claim, external_user: other_authorized_user, creator: other_authorized_user) }

          it 'redirects the user to its home page with an unauthorised error' 

        end

        context 'but the claim is not longer editable' do
          # TODO: there seems to be problems with the factories which previously allowed claims to be in submitted state without the
          # necessary valid information. Needs looking at!
          let!(:claim) { create_claim(:advocate_interim_claim, :submitted, external_user: authorized_user, creator: authorized_user).tap { |c| c.submit! } }

          it 'redirects the user to its home page with an unauthorised error' 

        end

        it 'assigned @claim is an instance of the defined claim type' 


        it 'renders the template' 

      end
    end
  end

  describe "PUT #update" do
    let(:original_case_number) { 'A20161234' }
    let(:original_court) { create(:court) }
    let!(:claim) { create(:advocate_interim_claim, external_user: authorized_user, creator: authorized_user, case_number: original_case_number, court: original_court) }
    let(:court) { create(:court) }
    let(:case_number) { 'A20171445' }
    let(:form_action) { { commit_continue: 'Save and continue' } }
    let(:claim_params) {
      {
        form_step: 'case_details',
        court_id: court.id,
        case_number: case_number,
        case_transferred_from_another_court: 'false'
      }
    }
    let(:params) { { id: claim.id, claim: claim_params }.merge(form_action) }

    subject(:update_request) { put :update, params: params }

    context 'when the user in NOT authenticated' do
      it 'redirects the user to the login page' 


      it 'does not update the existent claim record' 

    end

    context 'when the user is authenticated' do
      context 'but the user is not authorized to manage this claim type' do
        before do
          sign_in(unauthorized_user.user)
        end

        it 'redirects the user to its home page with an unauthorised error' 


        it 'does not update the existent claim record' 

      end

      context 'and the user is authorized to manage this claim type' do
        before do
          sign_in(authorized_user.user)
        end

        context 'but the user is not the creator of the claim' do
          let(:other_authorized_user) { create(:external_user, :advocate) }
          let!(:claim) { create(:advocate_interim_claim, external_user: other_authorized_user, creator: other_authorized_user) }

          it 'redirects the user to its home page with an unauthorised error' 


          it 'does not update the existent claim record' 

        end

        context 'but the claim is not longer editable' do
          # TODO: there seems to be problems with the factories which previously allowed claims to be in submitted state without the
          # necessary valid information. Needs looking at!
          let!(:claim) { create_claim(:advocate_interim_claim, :submitted, external_user: authorized_user, creator: authorized_user).tap { |c| c.submit! } }

          it 'redirects the user to its home page with an unauthorised error' 


          it 'does not update the existent claim record' 

        end

        context 'but the submitted claim params are invalid' do
          let(:claim_params) {
            {
              form_step: 'case_details',
              court_id: '',
              case_number: '',
              case_transferred_from_another_court: 'false'
            }
          }

          context 'and the form params were submitted as a draft' do
            let(:form_action) { { commit_save_draft: 'Save as draft' } }

            it 'assigns @claim with the existent updated record' 


            it 'redirects to claims list page' 


            it 'updates the existent claim record as draft with the submitted data' 

          end

          context 'and the form params were submitted to LAA' do
            let(:form_action) { { commit_submit_claim: 'Submit to LAA' } }

            it 'assigns @claim with errors' 


            it 'renders the template' 


            it 'does not update the existent claim record' 

          end

          it 'assigns @claim with errors' 


          it 'renders the template' 


          it 'does not update the existent claim record' 

        end

        context 'and the form params were submitted to LAA' do
          let(:form_action) { { commit_submit_claim: 'Submit to LAA' } }

          it 'assigns @claim with the existent updated record' 


          it 'redirects user to the claim summary page' 


          it 'updates the existent claim record with the submitted data' 

        end

        it 'assigns @claim with the newly created record' 


        it 'redirects the user to the next step of the edit claim form page' 


        it 'updates the existent claim record with the submitted data' 

      end
    end
  end
end

