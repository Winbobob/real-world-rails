require 'spec_helper'

describe 'User sorts merge requests' do
  let!(:merge_request) { create(:merge_request, source_project: project, target_project: project) }
  let!(:merge_request2) do
    create(:merge_request_with_diffs, source_project: project, target_project: project, source_branch: 'merge-test')
  end
  let(:project) { create(:project, :public, :repository) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(project_merge_requests_path(project))
  end

  it 'keeps the sort option' 


  context 'when merge requests have awards' do
    before do
      create_list(:award_emoji, 2, awardable: merge_request)
      create(:award_emoji, :downvote, awardable: merge_request)

      create(:award_emoji, awardable: merge_request2)
      create_list(:award_emoji, 2, :downvote, awardable: merge_request2)
    end

    it 'sorts by popularity' 

  end
end

