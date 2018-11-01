require 'rails_helper'

RSpec.describe Admin::Archived::PetitionDetailsController, type: :controller, admin: true do
  let!(:petition) { FactoryBot.create(:archived_petition) }
  let!(:creator) { FactoryBot.create(:archived_signature, :validated, creator: true, petition: petition) }

  describe 'not logged in' do
    describe 'GET #show' do
      it 'redirects to the login page' 

    end

    describe 'PATCH #update' do
      it 'redirects to the login page' 

    end
  end

  context 'logged in as moderator user but need to reset password' do
    let(:user) { FactoryBot.create(:moderator_user, force_password_reset: true) }
    before { login_as(user) }

    describe 'GET #show' do
      it 'redirects to edit profile page' 

    end

    describe 'PATCH #update' do
      it 'redirects to edit profile page' 

    end
  end

  describe 'logged in as moderator user' do
    let(:user) { FactoryBot.create(:moderator_user) }
    before { login_as(user) }

    describe 'GET #show' do
      shared_examples_for 'viewing a petition in the correct state' do
        it 'fetches the requested petition' 


        it 'responds successfully and renders the petition_details/show template' 

      end

      describe 'for a published petition' do
        it_behaves_like 'viewing a petition in the correct state'
      end

      describe 'for a rejected petition' do
        let!(:petition) { FactoryBot.create(:archived_petition, :rejected) }

        it_behaves_like 'viewing a petition in the correct state'
      end

      describe 'for a hidden petition' do
        let!(:petition) { FactoryBot.create(:archived_petition, :hidden) }

        it_behaves_like 'viewing a petition in the correct state'
      end
    end

    describe 'PATCH #update' do
      let(:petition) { FactoryBot.create(:archived_petition, action: 'Old action', background: 'Old background', additional_details: 'Old additional details') }

      def do_update
        patch :update,
              petition_id: petition.id,
              archived_petition: petition_attributes
      end

      describe 'allowed params' do
        let(:params) do
          {
            petition_id: petition.id,
            archived_petition: {
              action: 'New action',
              background: 'New background',
              additional_details: 'New additional_details'
            }
          }
        end

        it "are limited to action, background, additional_details and creator name" 

      end

      describe 'with valid params' do
        let(:petition_attributes) do
          {
              action: 'New action',
              background: 'New background',
              additional_details: 'New additional_details'
          }
        end

        shared_examples_for 'updating a petition in the correct state' do
          it 'redirects to the edit petition page' 


          it 'updates the petition' 

        end

        describe 'for a published petition' do
          it_behaves_like 'updating a petition in the correct state'
        end
      end

      describe 'with invalid params' do
        let(:petition_attributes) do
          {
              action: '',
              background: '',
              additional_details: 'Blah'
          }
        end

        shared_examples_for 'updating a petition in the correct state' do
          it 'renders the petition_details/show template again' 

        end

        describe 'for a published petition' do
          it_behaves_like 'updating a petition in the correct state'
        end
      end
    end
  end
end

