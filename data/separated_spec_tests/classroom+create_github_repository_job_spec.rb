# frozen_string_literal: true

require "rails_helper"

RSpec.describe GroupAssignmentRepo::CreateGitHubRepositoryJob, type: :job do
  include ActiveJob::TestHelper

  subject { described_class }

  let(:group_repo_channel) { GroupRepositoryCreationStatusChannel }

  context "with created objects", :vcr do
    let(:organization)  { classroom_org }
    let(:student)       { classroom_student }
    let(:repo_access)   { RepoAccess.create(user: student, organization: organization) }
    let(:grouping)      { create(:grouping, organization: organization) }
    let(:group)         { create(:group, grouping: grouping, github_team_id: 2_976_561) }
    let(:invite_status) { group_assignment.invitation.status(group) }
    let(:channel)       { group_repo_channel.channel(group_assignment_id: group_assignment.id, group_id: group.id) }
    let(:group_assignment) do
      group_assignment = create(
        :group_assignment,
        grouping: grouping,
        title: "Learn JavaScript",
        organization: organization,
        public_repo: true,
        starter_code_repo_id: 1_062_897
      )
      group_assignment.build_group_assignment_invitation
      group_assignment
    end

    after(:each) do
      GroupAssignmentRepo.destroy_all
      clear_enqueued_jobs
      clear_performed_jobs
    end

    it "uses the create_repository queue" 


    context "invalid invitation status" do
      before(:each) do
        group.repo_accesses << repo_access
      end

      after(:each) do
        expect_any_instance_of(subject).to_not receive(:broadcast_message)
        subject.perform_now(group_assignment, group)
        expect { GroupAssignmentRepo.find_by!(group_assignment: group_assignment, group: group) }
          .to raise_error(ActiveRecord::RecordNotFound)
      end

      it "returns early when invitation status is unaccepted" 


      it "returns early when invitation status is accepted" 


      it "returns early when invitation status is creating_repo" 


      it "returns early when invitation status is importing_starter_code" 


      it "returns early when invitation status is errored_creating_repo" 


      it "returns early when invitation status is errored_importing_starter_code" 

    end

    context "valid invitation status" do
      before(:each) do
        group.repo_accesses << repo_access
        invite_status.waiting!
      end

      describe "successful creation" do
        let(:assignment_repo) { GroupAssignmentRepo.find_by!(group_assignment: group_assignment, group: group) }

        before do
          subject.perform_now(group_assignment, group)
        end

        it "changes the invite_status to importing_starter_code" 


        it "group_assignment_repo not nil" 


        it "is the same assignment" 


        it "has the same group" 


        it "created a GitHub repository" 


        it "started a source import" 


        it "added the team to the repository" 

      end

      describe "successful creation" do
        describe "broadcasts" do
          it "creating_repo" 


          it "importing_starter_code" 

        end

        describe "datadog stats" do
          after do
            subject.perform_now(group_assignment, group)
          end

          it "tracks create success and import started" 


          it "tracks elapsed time" 

        end
      end

      describe "context no starter code" do
        let(:group_assignment) do
          group_assignment = create(
            :group_assignment,
            grouping: grouping,
            title: "Empty repo",
            organization: organization,
            public_repo: false
          )
          group_assignment.build_group_assignment_invitation
          group_assignment
        end

        describe "successful creation" do
          let(:assignment_repo) { GroupAssignmentRepo.find_by!(group_assignment: group_assignment, group: group) }

          before do
            subject.perform_now(group_assignment, group)
          end

          it "changes the invite_status to completed" 


          it "group_assignment_repo not nil" 


          it "is the same assignment" 


          it "has the same group" 


          it "created a GitHub repository" 


          it "did not start a source import" 


          it "added the team to the repository" 

        end

        describe "successful creation" do
          describe "broadcasts" do
            it "creating_repo" 


            it "completed" 

          end

          describe "datadog stats" do
            after do
              subject.perform_now(group_assignment, group)
            end

            it "tracks create success" 


            it "tracks elapsed time" 

          end
        end
      end

      describe "creation failure" do
        describe "positive retries" do
          before do
            stub_request(:post, github_url("/organizations/#{organization.github_id}/repos"))
              .to_return(status: 500)
          end

          it "fails and automatically retries" 


          it "fails and puts invite status in state to retry" 

        end

        context "fails to create a GitHub repo" do
          before do
            stub_request(:post, github_url("/organizations/#{organization.github_id}/repos"))
              .to_return(status: 500)
          end

          describe "broadcasts" do
            it "creating_repo" 


            it "errored_creating_repo" 

          end

          context "perform before" do
            before do
              subject.perform_now(group_assignment, group)
            end

            it "doesn't create a GroupAssignmentRepo" 


            it "changes invite_status to be errored_creating_repo" 

          end

          context "perform after" do
            after do
              subject.perform_now(group_assignment, group)
            end

            it "tracks create fail" 


            it "logs error" 

          end
        end

        context "fails to start a source import" do
          before do
            stub_request(:put, %r{#{github_url("/repositories")}/\d+/import$})
              .to_return(status: 500)
          end

          after(:each) do
            expect(WebMock).to have_requested(:delete, %r{#{github_url("/repositories")}/\d+$})
          end

          describe "broadcasts" do
            it "creating_repo" 


            it "errored_creating_repo" 

          end

          context "perform before" do
            before do
              subject.perform_now(group_assignment, group)
            end

            it "doesn't create a GroupAssignmentRepo" 


            it "changes invite_status to be errored_creating_repo" 

          end

          context "perform after" do
            after do
              subject.perform_now(group_assignment, group)
            end

            it "tracks create fail" 


            it "logs error" 

          end
        end

        context "fails to add the team to the repository" do
          before do
            username_regex = GitHub::USERNAME_REGEX
            repository_regex = GitHub::REPOSITORY_REGEX
            regex = %r{#{github_url("/teams/#{group.github_team_id}/repos/")}#{username_regex}\/#{repository_regex}$}
            stub_request(:put, regex)
              .to_return(status: 500)
          end

          after(:each) do
            expect(WebMock).to have_requested(:delete, %r{#{github_url("/repositories")}/\d+$})
          end

          describe "broadcasts" do
            it "creating_repo" 


            it "errored_creating_repo" 

          end

          context "perform before" do
            before do
              subject.perform_now(group_assignment, group)
            end

            it "doesn't create a GroupAssignmentRepo" 


            it "changes invite_status to be errored_creating_repo" 

          end

          context "perform after" do
            after do
              subject.perform_now(group_assignment, group)
            end

            it "tracks create fail" 


            it "logs error" 

          end
        end

        context "fails to save the record" do
          before do
            allow(GroupAssignmentRepo).to receive(:create!).and_raise(ActiveRecord::RecordInvalid)
          end

          describe "broadcasts" do
            it "creating_repo" 


            it "errored_creating_repo" 

          end

          context "perform before" do
            before do
              subject.perform_now(group_assignment, group)
            end

            it "doesn't create a GroupAssignmentRepo" 


            it "changes invite_status to be errored_creating_repo" 

          end

          context "perform after" do
            after do
              subject.perform_now(group_assignment, group)
            end

            it "tracks create fail" 


            it "logs error" 

          end
        end
      end
    end
  end
end

