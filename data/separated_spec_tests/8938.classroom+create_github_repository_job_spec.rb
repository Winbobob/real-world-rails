# frozen_string_literal: true

require "rails_helper"

RSpec.describe AssignmentRepo::CreateGitHubRepositoryJob, type: :job do
  include ActiveJob::TestHelper

  subject { described_class }

  let(:organization)  { classroom_org }
  let(:student)       { classroom_student }
  let(:teacher)       { classroom_teacher }

  let(:assignment) do
    options = {
      title: "Learn Elm",
      starter_code_repo_id: 1_062_897,
      organization: organization,
      students_are_repo_admins: true
    }

    create(:assignment, options)
  end

  before do
    @invitation = AssignmentInvitation.create(assignment: assignment)
    @teacher_invite_status = @invitation.status(teacher)
    @student_invite_status = @invitation.status(student)
  end

  before(:each) do
    @teacher_invite_status.waiting!
    @student_invite_status.waiting!
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
    AssignmentRepo.destroy_all
  end

  describe "invalid invitation statuses", :vcr do
    it "returns early when invitation status is unaccepted" 


    it "returns early when invitation status is creating_repo" 


    it "returns early when invitation status is importing_starter_code" 


    it "returns early when invitation status is completed" 

  end

  describe "successful creation", :vcr do
    it "uses the create_repository queue" 


    context "creates an AssignmentRepo as an outside_collaborator" do
      let(:assignment_repo) { AssignmentRepo.find_by(user: student, assignment: assignment) }

      before do
        subject.perform_now(assignment, student)
      end

      it "is not nil" 


      it "is the same assignment" 


      it "has the same user" 


      it "has a github_global_relay_id" 

    end

    context "creates an AssignmentRepo as a member" do
      let(:assignment_repo) { AssignmentRepo.find_by(user: teacher, assignment: assignment) }

      before do
        subject.perform_now(assignment, teacher)
      end

      it "is not nil" 


      it "is the same assignment" 


      it "has the same user" 


      it "has a github_global_relay_id" 

    end

    it "broadcasts status on channel" 


    it "tracks create success stat" 


    it "tracks how long it too to be created" 

  end

  describe "failure", :vcr do
    it "tracks create fail stat" 


    it "broadcasts create repo failure" 


    it "fails and automatically retries" 


    it "fails and puts invite status in state to retry" 


    context "with successful repo creation" do
      # Verify that we try to delete the GitHub repository
      # if part of the process fails.
      after(:each) do
        regex = %r{#{github_url("/repositories")}/\d+$}
        expect(WebMock).to have_requested(:delete, regex)
      end

      it "fails to import starter code and broadcasts" 


      it "fails to import starter code and logs" 


      it "fails to import starter code and reports" 


      it "fails to add the user to the repo and broadcasts" 


      it "fails to add the user to the repo and logs" 


      it "fails to add the user to the repo and reports" 


      it "fails to save the AssignmentRepo and broadcasts" 


      it "fails to save the AssignmentRepo and logs" 


      it "fails to save the AssignmentRepo and reports" 

    end
  end
end

