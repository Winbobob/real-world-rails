require 'rails_helper'

RSpec.describe Admin::PetitionEmailsController, type: :controller, admin: true do
  let!(:petition) { FactoryBot.create(:open_petition) }

  describe 'not logged in' do
    let(:email) { FactoryBot.create(:petition_email, petition: petition) }

    describe 'GET /new' do
      it 'redirects to the login page' 

    end

    describe 'POST /' do
      it 'redirects to the login page' 

    end

    describe 'GET /:id/edit' do
      it 'redirects to the login page' 

    end

    describe 'PATCH /:id' do
      it 'redirects to the login page' 

    end

    describe 'DELETE /:id' do
      it 'redirects to the login page' 

    end
  end

  context 'logged in as moderator user but need to reset password' do
    let(:email) { FactoryBot.create(:petition_email, petition: petition) }
    let(:user) { FactoryBot.create(:moderator_user, force_password_reset: true) }

    before { login_as(user) }

    describe 'GET /new' do
      it 'redirects to edit profile page' 

    end

    describe 'POST /' do
      it 'redirects to edit profile page' 

    end

    describe 'GET /:id/edit' do
      it 'redirects to the login page' 

    end

    describe 'PATCH /:id' do
      it 'redirects to the login page' 

    end

    describe 'DELETE /:id' do
      it 'redirects to the login page' 

    end
  end

  describe "logged in as moderator user" do
    let(:user) { FactoryBot.create(:moderator_user) }
    before { login_as(user) }

    describe 'GET /new' do
      describe 'for an open petition' do
        it 'fetches the requested petition' 


        it 'responds successfully and renders the petitions/show template' 

      end

      shared_examples_for 'trying to view the email petitioners form of a petition in the wrong state' do
        it 'raises a 404 error' 

      end

      describe 'for a pending petition' do
        before { petition.update_column(:state, Petition::PENDING_STATE) }
        it_behaves_like 'trying to view the email petitioners form of a petition in the wrong state'
      end

      describe 'for a validated petition' do
        before { petition.update_column(:state, Petition::VALIDATED_STATE) }
        it_behaves_like 'trying to view the email petitioners form of a petition in the wrong state'
      end

      describe 'for a sponsored petition' do
        before { petition.update_column(:state, Petition::SPONSORED_STATE) }
        it_behaves_like 'trying to view the email petitioners form of a petition in the wrong state'
      end
    end

    describe 'POST /' do
      let(:petition_email_attributes) do
        {
          subject: "Petition email subject",
          body: "Petition email body"
        }
      end

      context 'when clicking the Email button' do
        def do_post(overrides = {})
          params = {
            petition_id: petition.id,
            petition_email: petition_email_attributes,
            save_and_email: "Email"
          }

          post :create, params.merge(overrides)
        end

        describe 'for an open petition' do
          it 'fetches the requested petition' 


          describe 'with valid params' do
            it 'redirects to the petition show page' 


            it 'tells the moderator that their email will be sent overnight' 


            it 'stores the supplied email details in the db' 


            context "emails out the petition email" do
              before do
                3.times do |i|
                  attributes = {
                    name: "Laura #{i}",
                    email: "laura_#{i}@example.com",
                    notify_by_email: true,
                    petition: petition
                  }
                  s = FactoryBot.create(:pending_signature, attributes)
                  s.validate!
                end
                2.times do |i|
                  attributes = {
                    name: "Sarah #{i}",
                    email: "sarah_#{i}@example.com",
                    notify_by_email: false,
                    petition: petition
                  }

                  s = FactoryBot.create(:pending_signature, attributes)
                  s.validate!
                end
                2.times do |i|
                  attributes = {
                    name: "Brian #{i}",
                    email: "brian_#{i}@example.com",
                    notify_by_email: true,
                    petition: petition
                  }
                  FactoryBot.create(:pending_signature, attributes)
                end
                petition.reload
              end

              it "queues a job to process the emails" 


              it "stamps the 'petition_email' email sent timestamp on each signature when the job runs" 


              it "should email out to the validated signees who have opted in when the delayed job runs" 

            end
          end

          describe 'with invalid params' do
            let(:petition_email_attributes) do
              { subject: "", body: "" }
            end

            it 're-renders the petitions/show template' 


            it 'leaves the in-memory instance with errors' 


            it 'does not stores the email details in the db' 

          end
        end

        shared_examples_for 'trying to email supporters of a petition in the wrong state' do
          it 'raises a 404 error' 


          it 'does not stores the supplied email details in the db' 

        end

        describe 'for a pending petition' do
          before { petition.update_column(:state, Petition::PENDING_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end

        describe 'for a validated petition' do
          before { petition.update_column(:state, Petition::VALIDATED_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end

        describe 'for a sponsored petition' do
          before { petition.update_column(:state, Petition::SPONSORED_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end
      end

      context 'when clicking the Save button' do
        def do_post(overrides = {})
          params = {
            petition_id: petition.id,
            petition_email: petition_email_attributes,
            save: "Save"
          }

          post :create, params.merge(overrides)
        end

        describe 'for an open petition' do
          it 'fetches the requested petition' 


          describe 'with valid params' do
            it 'redirects to the petition show page' 


            it 'tells the moderator that their changes were saved' 


            it 'stores the supplied email details in the db' 


            context "does not email out the petition email" do
              before do
                3.times do |i|
                  attributes = {
                    name: "Laura #{i}",
                    email: "laura_#{i}@example.com",
                    notify_by_email: true,
                    petition: petition
                  }
                  s = FactoryBot.create(:pending_signature, attributes)
                  s.validate!
                end
                2.times do |i|
                  attributes = {
                    name: "Sarah #{i}",
                    email: "sarah_#{i}@example.com",
                    notify_by_email: false,
                    petition: petition
                  }

                  s = FactoryBot.create(:pending_signature, attributes)
                  s.validate!
                end
                2.times do |i|
                  attributes = {
                    name: "Brian #{i}",
                    email: "brian_#{i}@example.com",
                    notify_by_email: true,
                    petition: petition
                  }
                  FactoryBot.create(:pending_signature, attributes)
                end
                petition.reload
              end

              it "does not queue a job to process the emails" 

            end
          end

          describe 'with invalid params' do
            let(:petition_email_attributes) do
              { subject: "", body: "" }
            end

            it 're-renders the petitions/show template' 


            it 'leaves the in-memory instance with errors' 


            it 'does not stores the email details in the db' 

          end
        end

        shared_examples_for 'trying to email supporters of a petition in the wrong state' do
          it 'raises a 404 error' 


          it 'does not store the supplied email details in the db' 

        end

        describe 'for a pending petition' do
          before { petition.update_column(:state, Petition::PENDING_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end

        describe 'for a validated petition' do
          before { petition.update_column(:state, Petition::VALIDATED_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end

        describe 'for a sponsored petition' do
          before { petition.update_column(:state, Petition::SPONSORED_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end
      end

      context 'when clicking the Preview button' do
        def do_post(overrides = {})
          params = {
            petition_id: petition.id,
            petition_email: petition_email_attributes,
            save_and_preview: "Save and preview"
          }

          post :create, params.merge(overrides)
        end

        describe 'for an open petition' do
          it 'fetches the requested petition' 


          describe 'with valid params' do
            it 'redirects to the petition show page' 


            it 'tells the moderator that their changes were saved' 


            it 'stores the supplied email details in the db' 


            context "does not email out the petition email" do
              before do
                3.times do |i|
                  attributes = {
                    name: "Laura #{i}",
                    email: "laura_#{i}@example.com",
                    notify_by_email: true,
                    petition: petition
                  }
                  s = FactoryBot.create(:pending_signature, attributes)
                  s.validate!
                end
                2.times do |i|
                  attributes = {
                    name: "Sarah #{i}",
                    email: "sarah_#{i}@example.com",
                    notify_by_email: false,
                    petition: petition
                  }

                  s = FactoryBot.create(:pending_signature, attributes)
                  s.validate!
                end
                2.times do |i|
                  attributes = {
                    name: "Brian #{i}",
                    email: "brian_#{i}@example.com",
                    notify_by_email: true,
                    petition: petition
                  }
                  FactoryBot.create(:pending_signature, attributes)
                end
                petition.reload
              end

              it "does not queue a job to process the emails" 

            end
          end

          describe 'with invalid params' do
            let(:petition_email_attributes) do
              { subject: "", body: "" }
            end

            it 're-renders the petitions/show template' 


            it 'leaves the in-memory instance with errors' 


            it 'does not stores the email details in the db' 

          end
        end

        shared_examples_for 'trying to email supporters of a petition in the wrong state' do
          it 'raises a 404 error' 


          it 'does not store the supplied email details in the db' 

        end

        describe 'for a pending petition' do
          before { petition.update_column(:state, Petition::PENDING_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end

        describe 'for a validated petition' do
          before { petition.update_column(:state, Petition::VALIDATED_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end

        describe 'for a sponsored petition' do
          before { petition.update_column(:state, Petition::SPONSORED_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end
      end
    end

    describe 'GET /:id/edit' do
      let(:email) do
        FactoryBot.create(
          :petition_email,
          petition: petition,
          subject: "Petition email subject",
          body: "Petition email body"
        )
      end

      describe 'for an open petition' do
        it 'fetches the requested petition' 


        it 'fetches the requested email' 


        it 'responds successfully and renders the petition_emails/edit template' 

      end

      shared_examples_for 'trying to view the email petitioners form of a petition in the wrong state' do
        it 'raises a 404 error' 

      end

      describe 'for a pending petition' do
        before { petition.update_column(:state, Petition::PENDING_STATE) }
        it_behaves_like 'trying to view the email petitioners form of a petition in the wrong state'
      end

      describe 'for a validated petition' do
        before { petition.update_column(:state, Petition::VALIDATED_STATE) }
        it_behaves_like 'trying to view the email petitioners form of a petition in the wrong state'
      end

      describe 'for a sponsored petition' do
        before { petition.update_column(:state, Petition::SPONSORED_STATE) }
        it_behaves_like 'trying to view the email petitioners form of a petition in the wrong state'
      end
    end

    describe 'PATCH /:id' do
      let(:email) do
        FactoryBot.create(
          :petition_email,
          petition: petition,
          subject: "Petition email subject",
          body: "Petition email body"
        )
      end

      let(:petition_email_attributes) do
        {
          subject: "New petition email subject",
          body: "New petition email body"
        }
      end

      context 'when clicking the Email button' do
        def do_patch(overrides = {})
          params = {
            petition_id: petition.id,
            id: email.id,
            petition_email: petition_email_attributes,
            save_and_email: "Email"
          }

          patch :update, params.merge(overrides)
        end

        describe 'for an open petition' do
          it 'fetches the requested petition' 


          it 'fetches the requested email' 


          describe 'with valid params' do
            it 'redirects to the petition show page' 


            it 'tells the moderator that their email will be sent overnight' 


            it 'stores the supplied email details in the db' 


            context "emails out the petition email" do
              before do
                3.times do |i|
                  attributes = {
                    name: "Laura #{i}",
                    email: "laura_#{i}@example.com",
                    notify_by_email: true,
                    petition: petition
                  }
                  s = FactoryBot.create(:pending_signature, attributes)
                  s.validate!
                end
                2.times do |i|
                  attributes = {
                    name: "Sarah #{i}",
                    email: "sarah_#{i}@example.com",
                    notify_by_email: false,
                    petition: petition
                  }

                  s = FactoryBot.create(:pending_signature, attributes)
                  s.validate!
                end
                2.times do |i|
                  attributes = {
                    name: "Brian #{i}",
                    email: "brian_#{i}@example.com",
                    notify_by_email: true,
                    petition: petition
                  }
                  FactoryBot.create(:pending_signature, attributes)
                end
                petition.reload
              end

              it "queues a job to process the emails" 


              it "stamps the 'petition_email' email sent timestamp on each signature when the job runs" 


              it "should email out to the validated signees who have opted in when the delayed job runs" 

            end
          end

          describe 'with invalid params' do
            let(:petition_email_attributes) do
              { subject: "", body: "" }
            end

            it 're-renders the petitions/show template' 


            it 'leaves the in-memory instance with errors' 


            it 'does not stores the email details in the db' 

          end
        end

        shared_examples_for 'trying to email supporters of a petition in the wrong state' do
          it 'raises a 404 error' 


          it 'does not stores the supplied email details in the db' 

        end

        describe 'for a pending petition' do
          before { petition.update_column(:state, Petition::PENDING_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end

        describe 'for a validated petition' do
          before { petition.update_column(:state, Petition::VALIDATED_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end

        describe 'for a sponsored petition' do
          before { petition.update_column(:state, Petition::SPONSORED_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end
      end

      context 'when clicking the Save button' do
        def do_patch(overrides = {})
          params = {
            petition_id: petition.id,
            id: email.id,
            petition_email: petition_email_attributes,
            save: "Save"
          }

          patch :update, params.merge(overrides)
        end

        describe 'for an open petition' do
          it 'fetches the requested petition' 


          it 'fetches the requested email' 


          describe 'with valid params' do
            it 'redirects to the petition show page' 


            it 'tells the moderator that their changes were saved' 


            it 'stores the supplied email details in the db' 


            context "does not email out the petition email" do
              before do
                3.times do |i|
                  attributes = {
                    name: "Laura #{i}",
                    email: "laura_#{i}@example.com",
                    notify_by_email: true,
                    petition: petition
                  }
                  s = FactoryBot.create(:pending_signature, attributes)
                  s.validate!
                end
                2.times do |i|
                  attributes = {
                    name: "Sarah #{i}",
                    email: "sarah_#{i}@example.com",
                    notify_by_email: false,
                    petition: petition
                  }

                  s = FactoryBot.create(:pending_signature, attributes)
                  s.validate!
                end
                2.times do |i|
                  attributes = {
                    name: "Brian #{i}",
                    email: "brian_#{i}@example.com",
                    notify_by_email: true,
                    petition: petition
                  }
                  FactoryBot.create(:pending_signature, attributes)
                end
                petition.reload
              end

              it "does not queue a job to process the emails" 

            end
          end

          describe 'with invalid params' do
            let(:petition_email_attributes) do
              { subject: "", body: "" }
            end

            it 're-renders the petitions/show template' 


            it 'leaves the in-memory instance with errors' 


            it 'does not stores the email details in the db' 

          end
        end

        shared_examples_for 'trying to email supporters of a petition in the wrong state' do
          it 'raises a 404 error' 


          it 'does not store the supplied email details in the db' 

        end

        describe 'for a pending petition' do
          before { petition.update_column(:state, Petition::PENDING_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end

        describe 'for a validated petition' do
          before { petition.update_column(:state, Petition::VALIDATED_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end

        describe 'for a sponsored petition' do
          before { petition.update_column(:state, Petition::SPONSORED_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end
      end

      context 'when clicking the Preview button' do
        def do_patch(overrides = {})
          params = {
            petition_id: petition.id,
            id: email.id,
            petition_email: petition_email_attributes,
            save_and_preview: "Save and preview"
          }

          patch :update, params.merge(overrides)
        end

        describe 'for an open petition' do
          it 'fetches the requested petition' 


          it 'fetches the requested email' 


          describe 'with valid params' do
            it 'redirects to the petition show page' 


            it 'tells the moderator that their changes were saved' 


            it 'stores the supplied email details in the db' 


            context "does not email out the petition email" do
              before do
                3.times do |i|
                  attributes = {
                    name: "Laura #{i}",
                    email: "laura_#{i}@example.com",
                    notify_by_email: true,
                    petition: petition
                  }
                  s = FactoryBot.create(:pending_signature, attributes)
                  s.validate!
                end
                2.times do |i|
                  attributes = {
                    name: "Sarah #{i}",
                    email: "sarah_#{i}@example.com",
                    notify_by_email: false,
                    petition: petition
                  }

                  s = FactoryBot.create(:pending_signature, attributes)
                  s.validate!
                end
                2.times do |i|
                  attributes = {
                    name: "Brian #{i}",
                    email: "brian_#{i}@example.com",
                    notify_by_email: true,
                    petition: petition
                  }
                  FactoryBot.create(:pending_signature, attributes)
                end
                petition.reload
              end

              it "does not queue a job to process the emails" 

            end

            it "should email out a preview email" 

          end

          describe 'with invalid params' do
            let(:petition_email_attributes) do
              { subject: "", body: "" }
            end

            it 're-renders the petitions/show template' 


            it 'leaves the in-memory instance with errors' 


            it 'does not stores the email details in the db' 

          end
        end

        shared_examples_for 'trying to email supporters of a petition in the wrong state' do
          it 'raises a 404 error' 


          it 'does not store the supplied email details in the db' 

        end

        describe 'for a pending petition' do
          before { petition.update_column(:state, Petition::PENDING_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end

        describe 'for a validated petition' do
          before { petition.update_column(:state, Petition::VALIDATED_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end

        describe 'for a sponsored petition' do
          before { petition.update_column(:state, Petition::SPONSORED_STATE) }
          it_behaves_like 'trying to email supporters of a petition in the wrong state'
        end
      end
    end

    describe 'DELETE /:id' do
      let(:email) do
        FactoryBot.create(
          :petition_email,
          petition: petition,
          subject: "Petition email subject",
          body: "Petition email body"
        )
      end

      def do_delete(overrides = {})
        params = { petition_id: petition.id, id: email.id }
        delete :destroy, params.merge(overrides)
      end

      describe 'for an open petition' do
        let(:moderated) { double(:moderated) }
        let(:emails) { double(:emails) }

        before do
          expect(Petition).to receive(:moderated).and_return(moderated)
          expect(moderated).to receive(:find).with("#{petition.id}").and_return(petition)
          expect(petition).to receive(:emails).and_return(emails)
          expect(emails).to receive(:find).with("#{email.id}").and_return(email)
        end

        it 'fetches the requested petition' 


        it 'fetches the requested email' 


        context "when the delete is successful" do
          before do
            expect(email).to receive(:destroy).and_return(true)
          end

          it 'redirects to the petition show page' 


          it 'tells the moderator that the record was deleted' 

        end

        context "when the delete is unsuccessful" do
          before do
            expect(email).to receive(:destroy).and_return(false)
          end

          it 'redirects to the petition show page' 


          it 'tells the moderator to contact support' 

        end
      end
    end
  end
end

