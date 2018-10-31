require 'rails_helper'

RSpec.describe Admin::Archived::ScheduleDebateController, type: :controller, admin: true do
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
      shared_examples_for 'viewing scheduled debate date' do
        it 'fetches the requested petition' 


        it 'responds successfully and renders the petitions/show template' 

      end

      describe 'for an open petition' do
        it_behaves_like 'viewing scheduled debate date'
      end

      describe 'for a rejected petition' do
        let!(:petition) { FactoryBot.create(:archived_petition, :rejected) }

        it_behaves_like 'viewing scheduled debate date'
      end

      describe 'for a hidden petition' do
        let!(:petition) { FactoryBot.create(:archived_petition, :hidden) }

        it_behaves_like 'viewing scheduled debate date'
      end
    end

    describe 'PATCH /update' do
      let(:scheduled_debate_date_attributes) do
        {
          scheduled_debate_date: '2014-12-01',
        }
      end

      context 'when clicking the Email button' do
        def do_patch(overrides = {})
          params = {
            petition_id: petition.id,
            archived_petition: scheduled_debate_date_attributes,
            save_and_email: "Email"
          }

          patch :update, params.merge(overrides)
        end

        describe 'scheduling a debate date for a petition' do
          it 'fetches the requested petition' 


          describe 'with valid params' do
            it 'redirects to the petition show page' 


            it 'tells the moderator that their email will be sent overnight' 


            it 'stores the supplied scheduled debate date against the petition in the db' 


            describe "emails out debate scheduled response" do
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


              it "stamps the 'debate_scheduled' email sent timestamp on each signature when the job runs" 


              it "should email out to the validated signees who have opted in when the delayed job runs" 

            end
          end

          describe 'with invalid params' do
            before do
              # NOTE this can't fail as there's no validation
              allow_any_instance_of(Archived::Petition).to receive(:valid?) do |receiver|
                receiver.errors.add(:base, 'this is all messed up')
                false
              end
            end

            it 're-renders the petitions/show template' 


            it 'leaves the in-memory instance with errors' 


            it 'does not store the supplied debate scheduled date in the db' 

          end
        end

        shared_examples_for 'scheduling a debate date' do
          it 'fetches the requested petition' 


          it 'stores the supplied schedule date on the petition' 

        end

        describe 'for an open petition' do
          it_behaves_like 'scheduling a debate date'
        end

        describe 'for a rejected petition' do
          let!(:petition) { FactoryBot.create(:archived_petition, :rejected) }

          it_behaves_like 'scheduling a debate date'
        end

        describe 'for a hidden petition' do
          let!(:petition) { FactoryBot.create(:archived_petition, :hidden) }

          it_behaves_like 'scheduling a debate date'
        end
      end

      context 'when clicking the Save button' do
        def do_patch(overrides = {})
          params = {
            petition_id: petition.id,
            archived_petition: scheduled_debate_date_attributes,
            save: "Save"
          }

          patch :update, params.merge(overrides)
        end

        describe 'scheduling a debate date for a petition' do
          it 'fetches the requested petition' 


          describe 'with valid params' do
            it 'redirects to the petition show page' 


            it 'tells the moderator that their changes were saved' 


            it 'stores the supplied scheduled debate date against the petition in the db' 


            describe "does not email out debate scheduled response" do
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

          describe 'with invalid params' do
            before do
              # NOTE this can't fail as there's no validation
              allow_any_instance_of(Archived::Petition).to receive(:valid?) do |receiver|
                receiver.errors.add(:base, 'this is all messed up')
                false
              end
            end

            it 're-renders the petitions/show template' 


            it 'leaves the in-memory instance with errors' 


            it 'does not store the supplied debate scheduled date in the db' 

          end
        end

        shared_examples_for 'scheduling a debate date' do
          it 'fetches the requested petition' 


          it 'stores the supplied schedule date on the petition' 

        end

        describe 'for an open petition' do
          it_behaves_like 'scheduling a debate date'
        end

        describe 'for a rejected petition' do
          let!(:petition) { FactoryBot.create(:archived_petition, :rejected) }

          it_behaves_like 'scheduling a debate date'
        end

        describe 'for a hidden petition' do
          let!(:petition) { FactoryBot.create(:archived_petition, :hidden) }

          it_behaves_like 'scheduling a debate date'
        end
      end
    end
  end
end

