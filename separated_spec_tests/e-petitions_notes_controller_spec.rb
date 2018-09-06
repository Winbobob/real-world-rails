require 'rails_helper'

RSpec.describe Admin::Archived::NotesController, type: :controller, admin: true do
  let!(:petition) { FactoryBot.create(:archived_petition) }
  let!(:creator) { FactoryBot.create(:archived_signature, :validated, creator: true, petition: petition) }

  describe 'not logged in' do
    describe 'GET /show' do
      it 'redirects to the login page' 

    end

    describe 'PATCH /update' do
      it 'redirects to the login page' 

    end
  end

  context 'logged in as moderator user but need to reset password' do
    let(:user) { FactoryBot.create(:moderator_user, force_password_reset: true) }
    before { login_as(user) }

    describe 'GET /show' do
      it 'redirects to edit profile page' 

    end

    describe 'PATCH /update' do
      it 'redirects to edit profile page' 

    end
  end

  describe "logged in as moderator user" do
    let(:user) { FactoryBot.create(:moderator_user) }
    before { login_as(user) }

    describe 'GET /show' do
      shared_examples_for 'viewing notes for a petition' do
        it 'fetches the requested petition' 


        it 'responds successfully and renders the petitions/show template' 

      end

      describe 'for an open petition' do
        it_behaves_like 'viewing notes for a petition'
      end

      describe 'for a rejected petition' do
        let!(:petition) { FactoryBot.create(:archived_petition, :rejected) }

        it_behaves_like 'viewing notes for a petition'
      end

      describe 'for a hidden petition' do
        let!(:petition) { FactoryBot.create(:archived_petition, :hidden) }

        it_behaves_like 'viewing notes for a petition'
      end
    end

    describe 'PATCH /update' do
      let(:notes_attributes) do
        {
          details: 'This seems fine, just need to get legal to give it the once over before letting it through.'
        }
      end

      def do_patch(overrides = {})
        params = { petition_id: petition.id, archived_note: notes_attributes }
        patch :update, params.merge(overrides)
      end

      shared_examples_for 'updating notes for a petition' do
        it 'fetches the requested petition' 


        context 'with valid params' do
          it 'redirects to the petition show page' 


          it 'stores the supplied notes in the db' 

        end
      end

      describe 'for a published petition' do
        it_behaves_like 'updating notes for a petition'
      end

      describe 'for a rejected petition' do
        let!(:petition) { FactoryBot.create(:archived_petition, :rejected) }

        it_behaves_like 'updating notes for a petition'
      end

      describe 'for a hidden petition' do
        let!(:petition) { FactoryBot.create(:archived_petition, :hidden) }

        it_behaves_like 'updating notes for a petition'
      end

      context "when two moderators update the notes for the first time simultaneously" do
        let(:note) { FactoryBot.build(:archived_note, details: "", petition: petition) }

        before do
          allow(Archived::Petition).to receive(:find).with(petition.id.to_s).and_return(petition)
        end

        it "doesn't raise an ActiveRecord::RecordNotUnique error" 

      end
    end
  end
end

