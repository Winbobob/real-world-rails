require 'rails_helper'

RSpec.describe Admin::DebateOutcomesController, type: :controller, admin: true do

  let!(:petition) { FactoryBot.create(:open_petition) }

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
      describe 'for an open petition' do
        it 'fetches the requested petition' 


        context 'that does not already have a debate outcome' do
          it 'exposes an new unsaved debate_outcome for the requested petition' 

        end

        context 'that already has a debate outcome' do
          let!(:debate_outcome) { FactoryBot.create(:debate_outcome, petition: petition) }
          it 'exposes the existing debate_outcome on the requested petition' 

        end

        it 'responds successfully and renders the petitions/show template' 

      end

      shared_examples_for 'trying to view a debate outcome for a petition in the wrong state' do
        it 'raises a 404 error' 

      end

      describe 'for a pending petition' do
        before { petition.update_column(:state, Petition::PENDING_STATE) }
        it_behaves_like 'trying to view a debate outcome for a petition in the wrong state'
      end

      describe 'for a validated petition' do
        before { petition.update_column(:state, Petition::VALIDATED_STATE) }
        it_behaves_like 'trying to view a debate outcome for a petition in the wrong state'
      end

      describe 'for a sponsored petition' do
        before { petition.update_column(:state, Petition::SPONSORED_STATE) }
        it_behaves_like 'trying to view a debate outcome for a petition in the wrong state'
      end

      describe 'for a rejected petition' do
        before { petition.update_columns(state: Petition::REJECTED_STATE) }
        it_behaves_like 'trying to view a debate outcome for a petition in the wrong state'
      end

      describe 'for a hidden petition' do
        before { petition.update_column(:state, Petition::HIDDEN_STATE) }
        it_behaves_like 'trying to view a debate outcome for a petition in the wrong state'
      end
    end

    describe 'PATCH /update' do
      let(:debate_outcome_attributes) do
        {
          debated_on: '2014-12-01',
          overview: 'Discussion of the 2014 Christmas Adjournment - has the house considered everything it needs to before it closes for the festive period?',
          transcript_url: 'http://www.publications.parliament.uk/pa/cm201415/cmhansrd/cm141218/debtext/141218-0003.htm#14121849000001',
          video_url: 'http://parliamentlive.tv/event/index/f9eb68af-6a5c-4a94-95d3-6108aa87e9d7?in=13:57:00',
          debate_pack_url: "http://researchbriefings.parliament.uk/ResearchBriefing/Summary/CDP-2014-1234"
        }
      end

      context 'when clicking the Email button' do
        def do_patch(overrides = {})
          params = {
            petition_id: petition.id,
            debate_outcome: debate_outcome_attributes,
            save_and_email: "Email"
          }

          patch :update, params.merge(overrides)
        end

        describe 'for an open petition' do
          it 'fetches the requested petition' 


          describe 'with valid params' do
            it 'redirects to the petition show page' 


            it 'tells the moderator that their email will be sent overnight' 


            it 'stores the supplied debate outcome details in the db' 


            describe "emails out a debate outcome response" do
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


              it "stamps the 'debate_outcome' email sent timestamp on each signature when the job runs" 


              it "should email out to the validated signees who have opted in when the delayed job runs" 

            end
          end

          shared_examples_for 'a debate_outcome with invalid parameters' do
            it 're-renders the petitions/show template' 


            it 'leaves the in-memory instance with errors' 


            it 'does not stores the supplied debate outcome details in the db' 

          end

          describe 'with invalid params' do
            before { debate_outcome_attributes.delete(:debated_on) }
            it_behaves_like 'a debate_outcome with invalid parameters'
          end

          describe 'image handling' do
            def patch_and_reload
              do_patch
              petition.reload
            end

            describe 'with no supplied image' do
              before { patch_and_reload }
              it 'returns the default image url' 

            end

            describe 'a valid image' do

              before { debate_outcome_attributes[:commons_image] = Rack::Test::UploadedFile.new(commons_image_file, 'image/jpeg') }
              before { patch_and_reload }

              it 'does not return the default image url' 

            end

            describe 'a small image' do
              before { debate_outcome_attributes[:commons_image] = Rack::Test::UploadedFile.new(commons_image_file_too_small, 'image/jpeg') }
              it_behaves_like 'a debate_outcome with invalid parameters'
            end

            describe 'an image in the wrong ratio' do
              before { debate_outcome_attributes[:commons_image] = Rack::Test::UploadedFile.new(commons_image_file_wrong_ratio, 'image/jpeg') }
              it_behaves_like 'a debate_outcome with invalid parameters'
            end
          end
        end

        shared_examples_for 'trying to add debate outcome details to a petition in the wrong state' do
          it 'raises a 404 error' 


          it 'does not stores the supplied debate outcome details in the db' 

        end

        describe 'for a pending petition' do
          before { petition.update_column(:state, Petition::PENDING_STATE) }
          it_behaves_like 'trying to add debate outcome details to a petition in the wrong state'
        end

        describe 'for a validated petition' do
          before { petition.update_column(:state, Petition::VALIDATED_STATE) }
          it_behaves_like 'trying to add debate outcome details to a petition in the wrong state'
        end

        describe 'for a sponsored petition' do
          before { petition.update_column(:state, Petition::SPONSORED_STATE) }
          it_behaves_like 'trying to add debate outcome details to a petition in the wrong state'
        end

        describe 'for a rejected petition' do
          before { petition.update_columns(state: Petition::REJECTED_STATE) }
          it_behaves_like 'trying to add debate outcome details to a petition in the wrong state'
        end

        describe 'for a hidden petition' do
          before { petition.update_column(:state, Petition::HIDDEN_STATE) }
          it_behaves_like 'trying to add debate outcome details to a petition in the wrong state'
        end
      end

      context 'when clicking the Save button' do
        def do_patch(overrides = {})
          params = {
            petition_id: petition.id,
            debate_outcome: debate_outcome_attributes,
            save: "Save"
          }

          patch :update, params.merge(overrides)
        end

        describe 'for an open petition' do
          it 'fetches the requested petition' 


          describe 'with valid params' do
            it 'redirects to the petition show page' 


            it 'tells the moderator that their changes were saved' 


            it 'stores the supplied debate outcome details in the db' 


            describe "does not email out debate outcome response" do
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
            before { debate_outcome_attributes.delete(:debated_on) }

            it 're-renders the petitions/show template' 


            it 'leaves the in-memory instance with errors' 


            it 'does not stores the supplied debate outcome details in the db' 

          end
        end

        shared_examples_for 'trying to add debate outcome details to a petition in the wrong state' do
          it 'raises a 404 error' 


          it 'does not stores the supplied debate outcome details in the db' 

        end

        describe 'for a pending petition' do
          before { petition.update_column(:state, Petition::PENDING_STATE) }
          it_behaves_like 'trying to add debate outcome details to a petition in the wrong state'
        end

        describe 'for a validated petition' do
          before { petition.update_column(:state, Petition::VALIDATED_STATE) }
          it_behaves_like 'trying to add debate outcome details to a petition in the wrong state'
        end

        describe 'for a sponsored petition' do
          before { petition.update_column(:state, Petition::SPONSORED_STATE) }
          it_behaves_like 'trying to add debate outcome details to a petition in the wrong state'
        end

        describe 'for a rejected petition' do
          before { petition.update_columns(state: Petition::REJECTED_STATE) }
          it_behaves_like 'trying to add debate outcome details to a petition in the wrong state'
        end

        describe 'for a hidden petition' do
          before { petition.update_column(:state, Petition::HIDDEN_STATE) }
          it_behaves_like 'trying to add debate outcome details to a petition in the wrong state'
        end
      end

      context "when two moderators update the debate outcome for the first time simultaneously" do
        let(:debate_outcome) do
          FactoryBot.build(:debate_outcome, overview: "", debated: false, petition: petition)
        end

        before do
          debateable = double(:scope)
          allow(Petition).to receive(:debateable).and_return(debateable)
          allow(debateable).to receive(:find).with(petition.id.to_s).and_return(petition)
        end

        it "doesn't raise an ActiveRecord::RecordNotUnique error" 

      end
    end
  end
end

