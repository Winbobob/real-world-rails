require 'set'

describe PeerReviewsController do
  TEMP_CSV_FILE_PATH = 'files/_temp_peer_review.csv'

  before :each do
    allow(controller).to receive(:session_expired?).and_return(false)
    allow(controller).to receive(:logged_in?).and_return(true)
    allow(controller).to receive(:current_user).and_return(build(:admin))

    @assignment_with_pr = create(:assignment_with_peer_review_and_groupings_results)
    @pr_id = @assignment_with_pr.pr_assignment.id
    @selected_reviewer_group_ids = @assignment_with_pr.pr_assignment.groupings.map(&:id)
    @selected_reviewee_group_ids = @assignment_with_pr.groupings.map(&:id)

    post :assign_groups,
         params: { actionString: 'random_assign', selectedReviewerGroupIds: @selected_reviewer_group_ids,
                   selectedRevieweeGroupIds: @selected_reviewee_group_ids, assignment_id: @pr_id,
                   numGroupsToAssign: 1 }
  end

  context 'peer review assignment controller' do
    it 'random assigns properly' 


    it 'download and upload CSV properly' 

  end
end

