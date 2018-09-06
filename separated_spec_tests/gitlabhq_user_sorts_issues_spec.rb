require "spec_helper"

describe "User sorts issues" do
  set(:project) { create(:project_empty_repo, :public) }
  set(:issue1) { create(:issue, project: project) }
  set(:issue2) { create(:issue, project: project) }
  set(:issue3) { create(:issue, project: project) }

  before do
    create_list(:award_emoji, 2, :upvote, awardable: issue1)
    create_list(:award_emoji, 2, :downvote, awardable: issue2)
    create(:award_emoji, :downvote, awardable: issue1)
    create(:award_emoji, :upvote, awardable: issue2)

    visit(project_issues_path(project))
  end

  it "sorts by popularity" 

end

