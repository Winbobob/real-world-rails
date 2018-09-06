require "spec_helper"

# The main goal of this spec is not to check whether the sorting UI works, but
# to check if the sorting option set by user is being kept persisted while going through pages.
# The `it`s are named here by convention `starting point -> some pages -> final point`.
# All those specs are moved out to this spec intentionally to keep them all in one place.
describe "User sorts things" do
  include Spec::Support::Helpers::Features::SortingHelpers
  include Helpers::DashboardHelper

  set(:project) { create(:project_empty_repo, :public) }
  set(:current_user) { create(:user) } # Using `current_user` instead of just `user` because of the hardoced call in `assigned_mrs_dashboard_path` which is used below.
  set(:issue) { create(:issue, project: project, author: current_user) }
  set(:merge_request) { create(:merge_request, target_project: project, source_project: project, author: current_user) }

  before do
    project.add_developer(current_user)
    sign_in(current_user)
  end

  it "issues -> project home page -> issues" 


  it "issues -> merge requests" 


  it "merge requests -> dashboard merge requests" 

end

