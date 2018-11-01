describe AttachmentsController do
  describe 'permission checking' do
    let (:proposal) { create(:proposal, :with_parallel_approvers, :with_observers) }
    let (:params) {{
      proposal_id: proposal.id,
      attachment: { file: fixture_file_upload('icon-user.png', 'image/png') }
    }}

    before do
      stub_request(:put, /.*c2-prod.s3.amazonaws.com.*/)
    end

    it "allows the requester to add an attachment" 


    it "allows an approver to add an attachment" 


    it "allows an observer to add an attachment" 


    it "does not allow others to add an attachment" 

  end

  describe 'error handling' do
    it "gives an error when a file was not selected" 

  end

  describe '#show' do
    let (:proposal) { create(:proposal, :with_parallel_approvers, :with_observers) }
    let (:attachment) { create(:attachment, proposal: proposal, user: proposal.requester) }

    it "allows the requester to view attachment" 


    it "allows the approver to view attachment" 


    it "allows the observer to view attachment" 


    it "does not allow others to view attachment" 

  end
end

