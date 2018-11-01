# frozen_string_literal: true

require "rails_helper"

RSpec.describe GroupAssignmentInvitationsController, type: :controller do
  let(:organization) { classroom_org }
  let(:student)      { classroom_student }
  let(:group_assignment) do
    options = {
      title: "HTML5",
      slug: "html5",
      organization: organization
    }
    create(:group_assignment, options)
  end
  let(:grouping) { group_assignment.grouping }
  let(:group) do
    group = create(:group, grouping: grouping, github_team_id: 2_973_107)
    group.repo_accesses << RepoAccess.create(user: student, organization: organization)
    group
  end
  let(:invitation)    { create(:group_assignment_invitation, group_assignment: group_assignment) }
  let(:invite_status) { invitation.status(group) }

  describe "route_based_on_status", :vcr do
    before(:each) do
      sign_in_as(student)
      GitHubClassroom.flipper[:group_import_resiliency].enable
    end

    after(:each) do
      GitHubClassroom.flipper[:group_import_resiliency].disable
      GroupInviteStatus.destroy_all
    end

    describe "unaccepted!" do
      it "gets #setup and redirects to #show" 


      it "gets #successful_invitation and redirects to #show" 

    end

    describe "accepted!" do
      it "gets #setup" 


      it "gets #successful_invitation and redirects to #setup" 

    end

    describe "waiting!" do
      it "gets #setup" 


      it "gets #successful_invitation and redirects to #setup" 

    end

    describe "creating_repo!" do
      it "gets #setup" 


      it "gets #successful_invitation and redirects to #setup" 

    end

    describe "errored_creating_repo!" do
      it "gets #setup" 


      it "gets #successful_invitation and redirects to #setup" 

    end

    describe "importing_starter_code!" do
      it "gets #setup" 


      it "gets #successful_invitation and redirects to #setup" 

    end

    describe "errored_importing_starter_code!" do
      it "gets #setup" 


      it "gets #successful_invitation and redirects to #setup" 

    end

    describe "completed!" do
      it "gets #setup and redirects to #successful_invitation" 


      # see GET #successful_invitation tests
    end
  end

  describe "GET #show", :vcr do
    context "unauthenticated request" do
      it "redirects the new student to sign in with GitHub" 

    end

    context "authenticated request" do
      before(:each) do
        sign_in_as(student)
      end

      context "no roster" do
        it "will bring you to the page" 

      end

      context "with a roster" do
        before do
          organization.roster = create(:roster)
          organization.save
        end

        context "with no ignore param" do
          context "when user is on the roster" do
            before do
              RosterEntry.create(roster: organization.roster, user: student, identifier: "a@b.c")
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

  describe "GET #accept", :vcr do
    context "user is already a member of a group in the grouping" do
      before do
        sign_in_as(student)
        group
      end

      after do
        GroupAssignmentRepo.destroy_all
      end

      it "returns success status" 


      it "render :accept" 


      context "with group import resiliency enabled" do
        before do
          GitHubClassroom.flipper[:group_import_resiliency].enable
        end

        after do
          GitHubClassroom.flipper[:group_import_resiliency].disable
        end

        it "renders accept" 

      end
    end
  end

  describe "PATCH #accept_invitation", :vcr do
    context "authenticated request" do
      before(:each) do
        request.env["HTTP_REFERER"] = "http://classroomtest.com/group-assignment-invitations/#{invitation.key}"
        sign_in_as(student)
      end

      after(:each) do
        GroupAssignmentRepo.destroy_all
      end

      it "sends an event to statsd" 


      context "invitations are disabled" do
        before do
          group_assignment.update(invitations_enabled: false)
          patch :accept_invitation, params: { id: invitation.key, group: { title: "Code Squad" } }
        end

        it "redirects" 


        it "has errors" 


        it "doesn't record a failure" 

      end

      it "does not allow users to join a group that is not apart of the grouping" 


      context "group has reached maximum number of members", :vcr do
        before(:each) do
          allow_any_instance_of(RepoAccess).to receive(:silently_remove_organization_member).and_return(true)
          group_assignment.update(max_members: 1)
        end

        it "does not allow user to join" 


        it "sends an event to statsd" 

      end

      context "group has not reached maximum number of members" do
        let(:group) { create(:group, grouping: grouping, github_team_id: 2_973_107) }

        before(:each) do
          group_assignment.update(max_members: 1)
        end

        it "allows user to join" 

      end

      context "group does not have maximum number of members" do
        let(:group) { create(:group, grouping: grouping, github_team_id: 2_973_107) }

        it "allows user to join" 

      end

      context "github repository with the same name already exists" do
        let(:group) { create(:group, grouping: grouping, github_team_id: 2_973_107) }

        before do
          group_assignment_repo = GroupAssignmentRepo.create!(group_assignment: group_assignment, group: group)
          @original_repository = organization.github_client.repository(group_assignment_repo.github_repo_id)
          group_assignment_repo.delete
          patch :accept_invitation, params: { id: invitation.key, group: { id: group.id } }
        end

        it "creates a new group assignment repo" 


        it "new repository name has expected suffix" 

      end

      context "with group import resiliency enabled" do
        before do
          GitHubClassroom.flipper[:group_import_resiliency].enable
        end

        after do
          GitHubClassroom.flipper[:group_import_resiliency].disable
        end

        describe "success" do
          it "sends an event to statsd" 


          it "creates a team" 


          it "does not create a repo" 


          it "redirects to #setup" 


          it "makes the invite status accepted" 


          context "joins an existing group" do
            let(:group) { create(:group, grouping: grouping, github_team_id: 2_973_107) }

            it "creates a repo_access" 


            context "groups status is already completed" do
              before do
                invitation.status(group).completed!
              end

              it "redirects to #successful_invitation" 

            end
          end
        end

        describe "failed" do
          it "fails if assignment invitations are disabled" 

        end
      end
    end
  end

  describe "GET #setup", :vcr do
    before(:each) do
      sign_in_as(student)
    end

    it "404s when feature is off" 


    context "with group import resiliency enabled" do
      before do
        GitHubClassroom.flipper[:group_import_resiliency].enable
      end

      after do
        GitHubClassroom.flipper[:group_import_resiliency].disable
      end

      it "renders setup" 

    end
  end

  describe "POST #create_repo", :vcr do
    before(:each) do
      sign_in_as(student)
    end

    it "404s when feature is off" 


    context "with group import resiliency enabled" do
      before do
        GitHubClassroom.flipper[:group_import_resiliency].enable
      end

      after do
        GitHubClassroom.flipper[:group_import_resiliency].disable
      end

      invalid_statuses = GroupInviteStatus::SETUP_STATUSES - ["accepted"]
      valid_statuses = GroupInviteStatus::ERRORED_STATUSES + ["accepted"]

      context "invalid statuses" do
        invalid_statuses.each do |status|
          context "when #{status}" do
            before do
              invite_status.update(status: status)
            end

            it "didn't kick off a job" 

          end
        end

        invalid_statuses.each do |status|
          context "when #{status}" do
            before do
              invite_status.update(status: status)
              post :create_repo, params: { id: invitation.key }
            end

            it "has a successful response" 


            it "has a job_started of false" 


            it "has a status of #{status}" 

          end
        end
      end

      context "valid statuses" do
        valid_statuses.each do |status|
          context "when #{status}" do
            before do
              invite_status.update(status: status)
            end

            it "kick off a job" 

          end
        end

        valid_statuses.each do |status|
          context "when #{status}" do
            before do
              invite_status.update(status: status)
              post :create_repo, params: { id: invitation.key }
            end

            it "has a successful response" 


            it "has a job_started of true" 


            it "has a status of waiting" 

          end
        end
      end
    end
  end

  describe "GET #progress", :vcr do
    before(:each) do
      sign_in_as(student)
    end

    it "404s when feature is off" 


    context "with group import resiliency enabled" do
      before do
        GitHubClassroom.flipper[:group_import_resiliency].enable
        invite_status.unaccepted!
      end

      after do
        GitHubClassroom.flipper[:group_import_resiliency].disable
      end

      context "GroupAssignemntRepo not present" do
        before do
          get :progress, params: { id: invitation.key }
        end

        it "returns status" 


        it "doesn't have a repo_url" 

      end

      context "GroupAssignmentRepo already present" do
        before do
          GroupAssignmentRepo.create!(group_assignment: group_assignment, group: group)
          get :progress, params: { id: invitation.key }
        end

        it "has a repo_url" 

      end
    end
  end

  describe "GET #successful_invitation", :vcr do
    let(:group) do
      group = create(:group, grouping: grouping, github_team_id: 2_973_107)
      group.repo_accesses << RepoAccess.create(user: student, organization: organization)
      group
    end

    before(:each) do
      sign_in_as(student)
      @group_assignment_repo = GroupAssignmentRepo.create!(group_assignment: group_assignment, group: group)
    end

    after(:each) do
      GroupAssignmentRepo.destroy_all
    end

    it "renders #successful_invitation" 


    context "delete github repository after accepting a invitation successfully" do
      before do
        organization.github_client.delete_repository(@group_assignment_repo.github_repo_id)
        get :successful_invitation, params: { id: invitation.key }
      end

      it "deletes the old group assignment repo" 

    end

    context "with group import resiliency enabled" do
      before do
        GitHubClassroom.flipper[:group_import_resiliency].enable
      end

      after do
        GitHubClassroom.flipper[:group_import_resiliency].disable
      end

      it "renders #successful_invitation" 

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
        sign_in_as(student)
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

