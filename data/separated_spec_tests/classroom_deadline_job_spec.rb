# frozen_string_literal: true

require "rails_helper"

RSpec.describe DeadlineJob, type: :job do
  let(:organization) { classroom_org }
  let(:assignment) { create(:assignment, organization: organization) }
  let(:deadline) { create(:deadline, assignment: assignment) }

  before do
    Octokit.reset!
  end

  it "uses the :deadline queue" 


  it "does not throw if the deadline no longer exists" 


  it "sets submission sha for assignment repos", :vcr do
    assignment_repo = create(:assignment_repo, assignment: assignment, github_repo_id: 8514) # rails/rails
    DeadlineJob.perform_now(deadline.id)

    expect(assignment_repo.reload.submission_sha).to be_truthy
  end
end

