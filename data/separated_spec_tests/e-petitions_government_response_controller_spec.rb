require 'rails_helper'

RSpec.describe Admin::Archived::GovernmentResponseController, type: :controller, admin: true do
  let!(:petition) { FactoryBot.create(:archived_petition) }
  let!(:creator) { FactoryBot.create(:archived_signature, :validated, creator: true, petition: petition) }
  let(:government_response) { petition.government_response }

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
      shared_examples_for 'viewing government response for a petition' do
        it 'fetches the requested petition' 


        it 'responds successfully and renders the petitions/show template' 

      end

      shared_examples_for 'viewing government response for a petition in the wrong state' do
        it 'throws a 404' 

      end

      describe 'for a published petition' do
        it_behaves_like 'viewing government response for a petition'
      end

      describe 'for a rejected petition' do
        let!(:petition) { FactoryBot.create(:archived_petition, :rejected) }

        it_behaves_like 'viewing government response for a petition'
      end

      describe 'for a hidden petition' do
        let!(:petition) { FactoryBot.create(:archived_petition, :hidden) }

        it_behaves_like 'viewing government response for a petition'
      end
    end

    describe 'PATCH /update' do
      let(:government_response_attributes) do
        {
          summary: 'The government agrees',
          details: 'Your petition is brilliant and we will do our utmost to make it law.'
        }
      end

      context 'when clicking the Email button' do
        def do_patch(overrides = {})
          login_as(user)

          params = {
            petition_id: petition.id,
            archived_government_response: government_response_attributes,
            save_and_email: "Email"
          }

          patch :update, params.merge(overrides)
        end

        describe 'using valid params to add a government response' do
          it 'redirects to the show page' 


          it 'tells the moderator that their email will be sent overnight' 


          it 'stores the supplied government response in the db' 


          it 'stamps the current time on the government_response_at timestamp in the db' 


          it "sets the 'government_response' email requested receipt timestamp" 


          describe "emails out debate outcomes response" do
            before do
              3.times do |i|
                attributes = {
                  name: "Laura #{i}",
                  email: "laura_#{i}@example.com",
                  notify_by_email: true,
                  petition: petition
                }

                FactoryBot.create(:archived_signature, :validated, attributes)
              end

              2.times do |i|
                attributes = {
                  name: "Sarah #{i}",
                  email: "sarah_#{i}@example.com",
                  notify_by_email: false,
                  petition: petition
                }

                FactoryBot.create(:archived_signature, :validated, attributes)
              end

              2.times do |i|
                attributes = {
                  name: "Brian #{i}",
                  email: "brian_#{i}@example.com",
                  notify_by_email: true,
                  petition: petition
                }

                FactoryBot.create(:archived_signature, :pending, attributes)
              end

              petition.reload
            end

            it "queues a job to process the emails" 


            it "stamps the 'government_response' email sent timestamp on each signature when the job runs" 


            it "should email out to the validated signees who have opted in when the delayed job runs" 

          end
        end

        describe 'using no params to add a government response' do
          before do
            government_response_attributes[:summary] = nil
            government_response_attributes[:details] = nil
          end

          it 'does not tell the moderator that their email will be sent overnight' 


          it "does not set the 'government_response' email requested receipt timestamp" 


          it "does not queue a job to process the emails" 


          it 're-renders the admin/archived/petitions/show template' 

        end

        describe 'using invalid params to add a government response' do
          before { government_response_attributes[:summary] = 'a' * 501 }

          it 're-renders the petitions/show template' 


          it 'leaves the in-memory instance with errors' 


          it 'does not store the supplied government response in the db' 


          it 'does not stamp the government_response_at timestamp in the db' 


          it "does not stamp the 'government_response' email requested receipt timestamp" 


          it "doest not queue up a job to send the 'government_response' emails" 

        end

        shared_examples_for 'adding a government response to a petition' do
          it 'fetches the requested petition' 


          it 'stores the supplied response on the petition in the db' 

        end

        shared_examples_for 'adding a government response to a petition in the wrong state' do
          it 'throws a 404' 


          it 'does not store the supplied response on the petition in the db' 

        end

        describe 'for a published petition' do
          it_behaves_like 'adding a government response to a petition'
        end

        describe 'for a rejected petition' do
          let!(:petition) { FactoryBot.create(:archived_petition, :rejected) }

          it_behaves_like 'adding a government response to a petition'
        end

        describe 'for a hidden petition' do
          let!(:petition) { FactoryBot.create(:archived_petition, :hidden) }

          it_behaves_like 'adding a government response to a petition'
        end
      end

      context 'when clicking the Save button' do
        def do_patch(overrides = {})
          login_as(user)

          params = {
            petition_id: petition.id,
            archived_government_response: government_response_attributes,
            save: "Save"
          }

          patch :update, params.merge(overrides)
        end

        describe 'using valid params to add a government response' do
          it 'redirects to the show page' 


          it 'tells the moderator that their changes were saved' 


          it 'stores the supplied government response in the db' 


          it 'stamps the current time on the government_response_at timestamp in the db' 


          it "does not set the 'government_response' email requested receipt timestamp" 


          describe "does not email out debate outcomes response" do
            before do
              3.times do |i|
                attributes = {
                  name: "Laura #{i}",
                  email: "laura_#{i}@example.com",
                  notify_by_email: true,
                  petition: petition
                }

                FactoryBot.create(:archived_signature, :validated, attributes)
              end

              2.times do |i|
                attributes = {
                  name: "Sarah #{i}",
                  email: "sarah_#{i}@example.com",
                  notify_by_email: false,
                  petition: petition
                }

                FactoryBot.create(:archived_signature, :validated, attributes)
              end

              2.times do |i|
                attributes = {
                  name: "Brian #{i}",
                  email: "brian_#{i}@example.com",
                  notify_by_email: true,
                  petition: petition
                }

                FactoryBot.create(:archived_signature, :pending, attributes)
              end

              petition.reload
            end

            it "does not queue a job to process the emails" 

          end
        end

        describe 'using no params to add a government response' do
          before do
            government_response_attributes[:summary] = nil
            government_response_attributes[:details] = nil
          end

          it 'does not tell the moderator that their changes were saved' 


          it "does not set the 'government_response' email requested receipt timestamp" 


          it "does not queue a job to process the emails" 


          it 're-renders the admin/archived/petitions/show template' 

        end

        describe 'using invalid params to add a government response' do
          before { government_response_attributes[:summary] = 'a' * 501 }

          it 're-renders the petitions/show template' 


          it 'leaves the in-memory instance with errors' 


          it 'does not store the supplied government response in the db' 


          it 'does not stamp the government_response_at timestamp in the db' 


          it "does not stamp the 'government_response' email requested receipt timestamp" 


          it "doest not queue up a job to send the 'government_response' emails" 

        end

        shared_examples_for 'adding a government response to a petition' do
          it 'fetches the requested petition' 


          it 'stores the supplied response on the petition in the db' 

        end

        shared_examples_for 'adding a government response to a petition in the wrong state' do
          it 'throws a 404' 


          it 'does not store the supplied response on the petition in the db' 

        end

        describe 'for a published petition' do
          it_behaves_like 'adding a government response to a petition'
        end

        describe 'for a rejected petition' do
          let!(:petition) { FactoryBot.create(:archived_petition, :rejected) }

          it_behaves_like 'adding a government response to a petition'
        end

        describe 'for a hidden petition' do
          let!(:petition) { FactoryBot.create(:archived_petition, :hidden) }

          it_behaves_like 'adding a government response to a petition'
        end
      end

      context "when two moderators update the response for the first time simultaneously" do
        let(:government_response) do
          FactoryBot.build(:archived_government_response, summary: "", details: "", petition: petition)
        end

        before do
          moderated = double(:scope)
          allow(Archived::Petition).to receive(:moderated).and_return(moderated)
          allow(moderated).to receive(:find).with(petition.id.to_s).and_return(petition)
        end

        it "doesn't raise an ActiveRecord::RecordNotUnique error" 

      end
    end
  end
end

