require 'rails_helper'
describe ReviewMappingController do
  let(:assignment) { double('Assignment', id: 1) }
  let(:review_response_map) do
    double('ReviewResponseMap', id: 1, map_id: 1, assignment: assignment,
                                reviewer: double('Participant', id: 1, name: 'reviewer'), reviewee: double('Participant', id: 2, name: 'reviewee'))
  end
  let(:metareview_response_map) do
    double('MetareviewResponseMap', id: 1, map_id: 1, assignment: assignment,
                                    reviewer: double('Participant', id: 1, name: 'reviewer'), reviewee: double('Participant', id: 2, name: 'reviewee'))
  end
  let(:participant) { double('AssignmentParticipant', id: 1, can_review: false, user: double('User', id: 1)) }
  let(:participant1) { double('AssignmentParticipant', id: 2, can_review: true, user: double('User', id: 2)) }
  let(:user) { double('User', id: 3) }
  let(:participant2) { double('AssignmentParticipant', id: 3, can_review: true, user: user) }
  let(:team) { double('AssignmentTeam', name: 'no one') }
  let(:team1) { double('AssignmentTeam', name: 'no one1') }

  before(:each) do
    allow(Assignment).to receive(:find).with('1').and_return(assignment)
    instructor = build(:instructor)
    stub_current_user(instructor, instructor.role.name, instructor.role)
  end

  describe '#add_calibration' do
    context 'when both participant and review_response_map have already existed' do
      it 'does not need to create new objects and redirects to responses#new maps' 

    end

    context 'when both participant and review_response_map have not been created' do
      it 'creates new objects and redirects to responses#new maps' 

    end
  end

  describe '#add_reviewer and #get_reviewer' do
    before(:each) do
      allow(User).to receive_message_chain(:where, :first).with(name: 'expertiza').with(no_args).and_return(double('User', id: 1))
      @params = {
        id: 1,
        topic_id: 1,
        user: {name: 'expertiza'},
        contributor_id: 1
      }
    end

    context 'when team_user does not exist' do
      it 'shows an error message and redirects to review_mapping#list_mappings page' 

    end

    context 'when team_user exists and get_reviewer method returns a reviewer' do
      it 'creates a whole bunch of objects and redirects to review_mapping#list_mappings page' 

    end
  end

  describe '#assign_reviewer_dynamically' do
    before(:each) do
      allow(AssignmentParticipant).to receive_message_chain(:where, :first)
        .with(user_id: '1', parent_id: 1).with(no_args).and_return(participant)
    end

    context 'when assignment has topics and no topic is selected by reviewer' do
      it 'shows an error message and redirects to student_review#list page' 

    end

    context 'when assignment has topics and a topic is selected by reviewer' do
      it 'assigns reviewer dynamically and redirects to student_review#list page' 

    end

    context 'when assignment does not have topics' do
      it 'runs another algorithms and redirects to student_review#list page' 

    end
  end

  describe '#assign_quiz_dynamically' do
    before(:each) do
      allow(AssignmentParticipant).to receive_message_chain(:where, :first)
        .with(user_id: '1', parent_id: 1).with(no_args).and_return(participant)
      @params = {
        assignment_id: 1,
        reviewer_id: 1,
        questionnaire_id: 1,
        participant_id: 1
      }
    end

    context 'when corresponding response map exists' do
      it 'shows a flash error and redirects to student_quizzes page' 

    end

    context 'when corresponding response map does not exist' do
      it 'creates a new QuizResponseMap and redirects to student_quizzes page' 

    end
  end

  describe '#add_metareviewer' do
    before(:each) do
      allow(ResponseMap).to receive(:find).with('1').and_return(review_response_map)
    end

    it 'redirects to review_mapping#list_mappings page' 

  end

  describe '#assign_metareviewer_dynamically' do
    it 'redirects to student_review#list page' 

  end

  describe '#delete_outstanding_reviewers' do
    before(:each) do
      allow(AssignmentTeam).to receive(:find).with('1').and_return(team)
      allow(team).to receive(:review_mappings).and_return([double('ReviewResponseMap', id: 1)])
    end

    context 'when review response map has corresponding responses' do
      it 'shows a flash error and redirects to review_mapping#list_mappings page' 

    end

    context 'when review response map does not have corresponding responses' do
      it 'shows a flash success and redirects to review_mapping#list_mappings page' 

    end
  end

  describe '#delete_all_metareviewers' do
    before(:each) do
      allow(ResponseMap).to receive(:find).with('1').and_return(review_response_map)
      @metareview_response_maps = [metareview_response_map]
      allow(MetareviewResponseMap).to receive(:where).with(reviewed_object_id: 1).and_return(@metareview_response_maps)
    end

    context 'when failed times are bigger than 0' do
      it 'shows an error flash message and redirects to review_mapping#list_mappings page' 

    end

    context 'when failed time is equal to 0' do
      it 'shows a note flash message and redirects to review_mapping#list_mappings page' 

    end
  end

  describe '#unsubmit_review' do
    let(:review_response) { double('Response') }
    before(:each) do
      allow(Response).to receive(:where).with(map_id: '1').and_return([review_response])
      allow(ReviewResponseMap).to receive(:find_by).with(id: '1').and_return(review_response_map)
    end

    context 'when attributes of response are updated successfully' do
      it 'shows a success flash.now message and renders a .js.erb file' 

    end

    context 'when attributes of response are not updated successfully' do
      it 'shows an error flash.now message and renders a .js.erb file' 

    end
  end

  describe '#delete_reviewer' do
    before(:each) do
      allow(ReviewResponseMap).to receive(:find_by).with(id: '1').and_return(review_response_map)
      request.env['HTTP_REFERER'] = 'www.google.com'
    end

    context 'when corresponding response does not exist to current review response map' do
      it 'shows a success flash message and redirects to previous page' 

    end

    context 'when corresponding response exists to current review response map' do
      it 'shows an error flash message and redirects to previous page' 

    end
  end

  describe '#delete_metareviewer' do
    before(:each) do
      allow(MetareviewResponseMap).to receive(:find).with('1').and_return(metareview_response_map)
    end

    context 'when metareview_response_map can be deleted successfully' do
      it 'show a note flash message and redirects to review_mapping#list_mappings page' 

    end

    context 'when metareview_response_map cannot be deleted successfully' do
      it 'show a note flash message and redirects to review_mapping#list_mappings page' 

    end
  end

  describe '#delete_metareview' do
    it 'redirects to review_mapping#list_mappings page after deletion' 

  end

  describe '#list_mappings' do
    it 'renders review_mapping#list_mappings page' 

  end

  describe '#automatic_review_mapping' do
    before(:each) do
      allow(AssignmentParticipant).to receive(:where).with(parent_id: 1).and_return([participant, participant1, participant2])
    end

    context 'when teams is not empty' do
      before(:each) do
        allow(AssignmentTeam).to receive(:where).with(parent_id: 1).and_return([team, team1])
      end

      context 'when all nums in params are 0' do
        it 'shows an error flash message and redirects to review_mapping#list_mappings page' 

      end

      context 'when all nums in params are 0 except student_review_num' do
        it 'runs automatic review mapping strategy and redirects to review_mapping#list_mappings page' 

      end

      context 'when calibrated params are not 0' do
        it 'runs automatic review mapping strategy and redirects to review_mapping#list_mappings page' 

      end
    end

    context 'when teams is empty, max team size is 1 and when review params are not 0' do
      it 'shows an error flash message and redirects to review_mapping#list_mappings page' 

    end
  end

  describe '#automatic_review_mapping_staggered' do
    it 'shows a note flash message and redirects to review_mapping#list_mappings page' 

  end

  describe 'response_report' do
    before(:each) do
      stub_const('WEBSERVICE_CONFIG', 'summary_webservice_url' => 'expertiza.ncsu.edu')
    end

    context 'when type is SummaryByRevieweeAndCriteria' do
      it 'renders response_report page with corresponding data' 

    end

    context 'when type is SummaryByCriteria' do
      it 'renders response_report page with corresponding data' 

    end

    context 'when type is ReviewResponseMap' do
      it 'renders response_report page with corresponding data' 

    end

    context 'when type is FeedbackResponseMap' do
      context 'when assignment has varying_rubrics_by_round feature' do
        it 'renders response_report page with corresponding data' 

      end

      context 'when assignment does not have varying_rubrics_by_round feature' do
        it 'renders response_report page with corresponding data' 

      end
    end

    context 'when type is TeammateReviewResponseMap' do
      it 'renders response_report page with corresponding data' 

    end

    context 'when type is Calibration and participant variable is nil' do
      it 'renders response_report page with corresponding data' 

    end

    context 'when type is PlagiarismCheckerReport' do
      it 'renders response_report page with corresponding data' 

    end
  end

  describe '#save_grade_and_comment_for_reviewer' do
    it 'redirects to review_mapping#response_report page' 

  end

  describe '#start_self_review' do
    before(:each) do
      allow(TeamsUser).to receive(:find_by_sql).with(
        ["SELECT t.id as t_id FROM teams_users u, teams t WHERE u.team_id = t.id and t.parent_id = ? and user_id = ?", 1, '1']
      )
                                               .and_return([double('TeamsUser', t_id: 1)])
    end

    context 'when self review response map does not exist' do
      it 'creates a new record and redirects to submitted_content#edit page' 

    end

    context 'when self review response map exists' do
      it 'redirects to submitted_content#edit page' 

    end
  end
end

