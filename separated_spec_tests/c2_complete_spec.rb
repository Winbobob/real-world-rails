describe "Completing a proposal" do
  it "distinguishes user with multiple actionable steps" 


  it "responds with error message when step cannot be acted on" 


  it "sends email to observers and requester when proposal is complete", :email do
    proposal = create(:proposal, :with_approver)
    proposal.add_observer(create(:user))

    login_as(proposal.approvers.first)
    visit proposal_path(proposal)
    click_on("Approve")

    visit proposal_path(proposal)
    expect(proposal.observers.length).to eq(1)
    expect(deliveries.length).to eq(2)
  end
end

