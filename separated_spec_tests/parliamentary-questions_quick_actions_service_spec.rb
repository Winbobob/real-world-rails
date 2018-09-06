require 'spec_helper'

describe 'QuickActionsService' do

  let!(:pq) { create(:pq) }
  let!(:pq2) { create(:pq) }

  let!(:pq_with_state) { create(:draft_pending_pq) }
  let!(:pq_with_minister) { create(:with_minister_pq)}
  let!(:pq_with_state2) { create(:draft_pending_pq) }

  before(:each) do
    @quick_actions_service               = QuickActionsService.new
    @pqs_array = Array.new
    @pqs_array.push(pq)
    @pq_list = pq.uin
  end

  it "Doesn't validate a list with any invalid PQ" 

  it "Validates a single PQ" 


  context 'Update dates is run' do
    it "Doesn't validate a list of valid PQs with invalid internal_deadline" 

    it "Doesn't validate a list of valid PQs with invalid draft_received" 

    it "Doesn't validate a list of valid PQs with invalid pod_clearance" 

    it "Doesn't validate a list of valid PQs with invalid minister_cleared" 

    it "Doesn't validate a list of valid PQs with invalid answered" 

    it "Does validate a list of valid PQs with all valid dates" 

    it "updates internal_deadline date for a list of valid pqs." 


      #Internal deadline does not change question state - the following dates do...

    it "updates draft_answer_received date and therefore state for a list of valid pqs." 

    it "updates pod_clearance date and therefore state for a list of valid pqs." 

    it "updates cleared_by_answering_minister date and therefore state for a list of valid pqs." 

    it "updates answer_submitted date and therefore state for a list of valid pqs." 

  end
  context 'Send Draft Reminders' do


    it 'Gets action officer association of an accepted Pq' 

    it "doesn't crash for a pq that has not been accepted" 

    it 'Mails the draft reminder to the Action officer who accepted a question' 

    it 'Mails the draft reminder to the Action officer who accepted a question' 


    it 'Takes a comma separated pq list and mails the Action Officers of Accepted Questions' 


  end

end

