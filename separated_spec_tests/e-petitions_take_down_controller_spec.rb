require 'rails_helper'

RSpec.describe Admin::TakeDownController, type: :controller, admin: true do
  let(:petition) do
    FactoryBot.create(:open_petition,
      creator_attributes: {
        name: "Barry Butler",
        email: "bazbutler@gmail.com"
      },
      sponsor_count: 0
    )
  end

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
      shared_examples_for 'viewing take down UI for a petition' do
        it 'fetches the requested petition' 


        it 'responds successfully and renders the petitions/show template' 

      end

      describe 'for an open petition' do
        it_behaves_like 'viewing take down UI for a petition'
      end

      describe 'for a closed petition' do
        before { petition.update_column(:closed_at, 2.days.ago) }
        it_behaves_like 'viewing take down UI for a petition'
      end

      describe 'for a pending petition' do
        before { petition.update_column(:state, Petition::PENDING_STATE) }
        it_behaves_like 'viewing take down UI for a petition'
      end

      describe 'for a validated petition' do
        before { petition.update_column(:state, Petition::VALIDATED_STATE) }
        it_behaves_like 'viewing take down UI for a petition'
      end

      describe 'for a sponsored petition' do
        before { petition.update_column(:state, Petition::SPONSORED_STATE) }
        it_behaves_like 'viewing take down UI for a petition'
      end

      describe 'for a rejected petition' do
        before { petition.update_columns(state: Petition::REJECTED_STATE) }
        it_behaves_like 'viewing take down UI for a petition'
      end

      describe 'for a hidden petition' do
        before { petition.update_column(:state, Petition::HIDDEN_STATE) }
        it_behaves_like 'viewing take down UI for a petition'
      end
    end

    describe 'PATCH /update' do
      let(:rejection_code) { 'duplicate' }
      let(:emails) { ActionMailer::Base.deliveries.map{ |email| email.to.first } }
      let(:take_down_attributes) do
        { rejection: { code: rejection_code, details: 'bad things' } }
      end

      let(:deliveries) { ActionMailer::Base.deliveries }
      let(:creator_email) { deliveries.detect{ |m| m.to == %w[bazbutler@gmail.com] } }
      let(:sponsor_email) { deliveries.detect{ |m| m.to == %w[laurapalmer@gmail.com] } }
      let(:pending_email) { deliveries.detect{ |m| m.to == %w[sandyfisher@hotmail.com] } }
      let!(:sponsor) { FactoryBot.create(:sponsor, :validated, petition: petition, email: "laurapalmer@gmail.com") }
      let!(:pending_sponsor) { FactoryBot.create(:sponsor, :pending, petition: petition, email: "sandyfisher@hotmail.com") }

      def do_patch(overrides = {})
        params = { petition_id: petition.id, petition: take_down_attributes }
        patch :update, params.merge(overrides)
      end

      context 'using valid take down params' do
        shared_examples_for 'rejecting a petition' do
          before do
            perform_enqueued_jobs do
              do_patch
              petition.reload
            end
          end

          it 'sets the petition state to "rejected"' 


          it 'sets the rejection code and description to the supplied params' 


          it 'redirects to the admin show page for the petition' 


          it "sends an email to the petition creator" 


          it "sends an email to validated petition sponsors" 


          it "does not send an email to pending petition sponsors" 

        end

        context 'with rejection code of "duplicate"' do
          let(:rejection_code) { 'duplicate' }

          it_behaves_like 'rejecting a petition'
        end

        shared_examples_for 'hiding a petition' do
          before do
            perform_enqueued_jobs do
              do_patch
              petition.reload
            end
          end

          it 'sets the petition state to "hidden"' 


          it 'sets the rejection code to the supplied code' 


          it 'redirects to the admin show page for the petition' 


          it "sends an email to the petition creator" 


          it "sends an email to validated petition sponsors" 


          it "does not send an email to pending petition sponsors" 

        end

        context 'with rejection code of "offensive"' do
          let(:rejection_code) { 'offensive' }

          it_behaves_like 'hiding a petition'
        end

        context 'with rejection code of "libellous"' do
          let(:rejection_code) { 'libellous' }

          it_behaves_like 'hiding a petition'
        end

        context 'with no rejection code' do
          let(:rejection_code) { '' }

          before do
            perform_enqueued_jobs do
              do_patch
              petition.reload
            end
          end

          it "leaves the state alone in the DB, and in-memory" 


          it "renders the petitions/show template" 

        end
      end

      shared_examples_for 'taking down a petition' do
        before do
          perform_enqueued_jobs do
            do_patch
            petition.reload
          end
        end

        it 'fetches the requested petition' 


        it 'performs the requested take down on the petition' 

      end

      describe 'for an open petition' do
        it_behaves_like 'taking down a petition'
      end

      describe 'for a closed petition' do
        before { petition.update_column(:closed_at, 3.days.ago) }
        it_behaves_like 'taking down a petition'
      end

      describe 'for a pending petition' do
        before { petition.update_column(:state, Petition::PENDING_STATE) }
        it_behaves_like 'taking down a petition'
      end

      describe 'for a validated petition' do
        before { petition.update_column(:state, Petition::VALIDATED_STATE) }
        it_behaves_like 'taking down a petition'
      end

      describe 'for a sponsored petition' do
        before { petition.update_column(:state, Petition::SPONSORED_STATE) }
        it_behaves_like 'taking down a petition'
      end

      describe 'for a rejected petition' do
        before { petition.update_columns(state: Petition::REJECTED_STATE) }
        it_behaves_like 'taking down a petition'
      end

      describe 'for a hidden petition' do
        before { petition.update_column(:state, Petition::HIDDEN_STATE) }
        it_behaves_like 'taking down a petition'
      end
    end
  end
end

