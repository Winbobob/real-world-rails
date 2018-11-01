# frozen_string_literal: true

require "rails_helper"

RSpec.describe AssignmentInvitationsController, type: :controller do
  let(:organization)  { classroom_org     }
  let(:user)          { classroom_student }
  let(:config_branch) { ClassroomConfig::CONFIG_BRANCH }

  let(:invitation)      { create(:assignment_invitation, organization: organization) }
  let(:invite_status)   { create(:invite_status, user: user, assignment_invitation: invitation) }
  let(:assignment_repo) { create(:assignment_repo, user: user, assignment: invitation.assignment) }

  let(:unconfigured_repo) { stub_repository("template") }
  let(:configured_repo)   { stub_repository("configured-repo") }

  describe "route_based_on_status", :vcr do
    before do
      sign_in_as(user)
      GitHubClassroom.flipper[:import_resiliency].enable
    end

    after do
      GitHubClassroom.flipper[:import_resiliency].disable
    end

    describe "unaccepted!" do
      it "gets #show" 


      it "gets #setup and redirects to #show" 


      it "gets #success and redirects to #show" 

    end

    describe "accepted!" do
      it "gets #setup" 


      it "gets #show and redirects to #setup" 


      it "gets #success and redirects to #setup" 

    end

    describe "waiting!" do
      it "gets #setup" 


      it "gets #show and redirects to #setup" 


      it "gets #success and redirects to #setup" 

    end

    describe "creating_repo!" do
      it "gets #setup" 


      it "gets #show and redirects to #setup" 


      it "gets #success and redirects to #setup" 

    end

    describe "errored_creating_repo!" do
      it "gets #setup" 


      it "gets #show and redirects to #setup" 


      it "gets #success and redirects to #setup" 

    end

    describe "importing_starter_code!" do
      it "gets #setup" 


      it "gets #show and redirects to #setup" 


      it "gets #success and redirects to #setup" 

    end

    describe "errored_importing_starter_code!" do
      it "gets #setup" 


      it "gets #show and redirects to #setup" 


      it "gets #success and redirects to #setup" 

    end

    describe "completed!" do
      it "gets #show and redirects to #success" 


      it "gets #setup and redirects to #success" 

    end
  end

  describe "GET #show", :vcr do
    context "unauthenticated request" do
      it "redirects the new user to sign in with GitHub" 

    end

    context "authenticated request" do
      before(:each) do
        sign_in_as(user)
      end

      context "no roster" do
        it "will bring you to the page" 


        context "previous acceptee" do
          before(:each) do
            expect_any_instance_of(AssignmentInvitationsController)
              .to receive(:current_submission)
              .and_return(assignment_repo)
          end

          it "redirects to success" 

        end
      end

      context "with a roster" do
        before do
          organization.roster = create(:roster)
          organization.save
        end

        context "with no ignore param" do
          context "when user is on the roster" do
            before do
              RosterEntry.create(roster: organization.roster, user: user, identifier: "a@b.c")
            end

            it "will bring you to the show page" 

          end

          context "when user is not on the roster" do
            it "will bring you to the join_roster page" 

          end
        end

        context "with ignore param" do
          it "will bring you to the show page" 

        end
      end
    end
  end

  describe "PATCH #accept", :vcr do
    let(:result) do
      assignment_repo = create(:assignment_repo, assignment: invitation.assignment, user: user)
      AssignmentRepo::Creator::Result.success(assignment_repo)
    end

    before do
      request.env["HTTP_REFERER"] = "http://classroomtest.com/assignment-invitations/#{invitation.key}"
      sign_in_as(user)
    end

    it "redeems the users invitation" 


    it "sends an event to statsd" 


    context "redeem returns an fail" do
      let(:result) { AssignmentRepo::Creator::Result.failed("Couldn't accept the invitation") }

      before do
        allow_any_instance_of(AssignmentInvitation).to receive(:redeem_for).with(user).and_return(result)
      end

      it "records error stat" 


      it "flash error" 


      it "redirects to #show" 

    end

    context "with import resiliency enabled" do
      before do
        GitHubClassroom.flipper[:import_resiliency].enable
      end

      after do
        GitHubClassroom.flipper[:import_resiliency].disable
      end

      it "sends an event to statsd" 


      it "redirects to success when AssignmentRepo already exists" 


      it "redirects to setup when AssignmentRepo already exists but isn't completed" 


      it "redirects to setup when AssignmentRepo doesn't already exist" 

    end
  end

  describe "POST #create_repo", :vcr do
    before do
      sign_in_as(user)
    end

    it "404 when feature is off" 


    context "with import resiliency enabled" do
      before do
        GitHubClassroom.flipper[:import_resiliency].enable
      end

      after do
        GitHubClassroom.flipper[:import_resiliency].disable
      end

      context "when invitation status is accepted" do
        before do
          invite_status.accepted!
        end

        it "enqueues a CreateRepositoryJob" 


        it "says a job was succesfully kicked off" 

      end

      context "when invitation status is errored" do
        before do
          invite_status.errored_creating_repo!
        end

        it "deletes an assignment repo if one already exists and is empty" 


        it "doesn't delete an assignment repo when one already exists and is not empty" 


        it "enqueues a CreateRepositoryJob" 


        it "says a job was succesfully kicked off" 


        it "reports an error was retried" 


        it "reports an error importing was retried" 

      end

      context "when invitation status is anything else" do
        before do
          invite_status.unaccepted!
        end

        it "does not enqueue a CreateRepositoryJob" 


        it "says a job was unsuccesfully kicked off" 

      end
    end
  end

  describe "GET #setup", :vcr do
    before(:each) do
      sign_in_as(user)
    end

    it "404s when feature is off" 

  end

  describe "GET #progress", :vcr do
    before do
      sign_in_as(user)
    end

    it "404 when feature is off" 


    context "with import resiliency enabled" do
      before do
        GitHubClassroom.flipper[:import_resiliency].enable
      end

      after do
        GitHubClassroom.flipper[:import_resiliency].disable
      end

      it "returns the invite_status" 


      context "when the github_repository already exists" do
        it "has a repo_url field present" 

      end
    end
  end

  describe "GET #success", :vcr do
    let(:assignment) do
      create(:assignment, title: "Learn Clojure", starter_code_repo_id: 1_062_897, organization: organization)
    end

    let(:invitation) { create(:assignment_invitation, assignment: assignment) }
    let(:invite_status) { create(:invite_status, assignment_invitation: invitation, user: user) }

    before(:each) do
      sign_in_as(user)
      result = AssignmentRepo::Creator.perform(assignment: assignment, user: user)
      @assignment_repo = result.assignment_repo
    end

    after(:each) do
      AssignmentRepo.destroy_all
    end

    context "github repository deleted after accepting a invitation successfully" do
      before do
        organization.github_client.delete_repository(@assignment_repo.github_repo_id)
        get :success, params: { id: invitation.key }
      end

      it "deletes the old assignment repo" 


      it "creates a new assignment repo for the student" 

    end

    context "creates a GitHub repo if one doesn't exist" do
      it "renders #success when no GitHub repo present" 

    end

    describe "import resiliency enabled" do
      before do
        GitHubClassroom.flipper[:import_resiliency].enable
      end

      after do
        GitHubClassroom.flipper[:import_resiliency].disable
      end

      it "redirects to setup when no GitHub repo present" 


      it "sets invite status to accepted when no GitHub repo present" 


      it "renders #success" 


      it "doesn't 404 when there is no current_submission" 


      it "redirects to setup when there is no current_submission" 

    end
  end

  describe "PATCH #join_roster", :vcr do
    before do
      organization.roster = create(:roster)
      organization.save
    end

    context "unauthenticated request" do
      it "redirects the new user to sign in with GitHub" 

    end

    context "authenticated request" do
      before(:each) do
        sign_in_as(user)
      end

      context "with invalid roster entry id" do
        before do
          patch :join_roster, params: { id: invitation.key, roster_entry_id: "not_an_id" }
        end

        it "renders join_roster view" 


        it "shows flash message" 

      end

      context "with a valid roster entry id" do
        before do
          entry = organization.roster.roster_entries.first
          patch :join_roster, params: { id: invitation.key, roster_entry_id: entry.id }
        end

        it "adds the user to the roster entry" 


        it "renders show" 

      end
    end
  end
end

