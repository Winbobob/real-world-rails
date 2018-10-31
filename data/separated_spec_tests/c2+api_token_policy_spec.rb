describe ApiTokenPolicy do
  let(:token) { create(:api_token, step: approval) }
  let(:approval) { proposal.individual_steps.first }
  let(:proposal) { create(:proposal, :with_approver) }
  let(:approver) { approval.user }
  let(:approval_params_with_token) do
    {
      cch: token.access_token,
      id: proposal.id.to_s,
      approver_action: "approve"
    }.with_indifferent_access
  end

  permissions :valid? do
    it "allows valid parameters" 


    it "fails when the token does not exist" 


    it "fails when the token does not match an existing token" 


    it "fails when the token has expired" 


    it "fails when the token has already been used once" 

  end

  permissions :valid_and_not_delegate? do
    it "allows non-delegates to use" 


    it "does not allow delegates to use" 

  end
end

