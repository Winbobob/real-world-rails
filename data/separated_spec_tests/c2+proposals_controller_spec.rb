describe Api::V2::ProposalsController do
  describe "#show" do
    it "fetches a specific proposal" 

  end

  describe "#index" do
    it "fetches a list of proposals", :elasticsearch do
      es_execute_with_retries 3 do
        user = mock_api_doorkeeper_pass
        test_requests = 3.times.map do |i|
          tr = create(:test_client_request, :with_approvers, requester: user)
          tr.proposal.reindex
          tr
        end
        Proposal.__elasticsearch__.refresh_index!

        get :index, text: "test request"

        expect(response.status).to eq(200)
        result = JSON.parse(response.body)
        expect(result["total"]).to eq(3)
        expect(result["proposals"].size).to eq(3)
      end
    end
  end

  describe "#create" do
    it "respects client type on initial POST" 


    it "returns errors when sent invalid params" 

  end

  describe "#update" do
    it "updates params" 

  end

  def new_proposal
    {
      test_client_request: {
        project_title: "i am a test",
        amount: 123.00
      }
    }
  end
end

