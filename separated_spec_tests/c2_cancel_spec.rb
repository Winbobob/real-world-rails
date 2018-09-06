describe "Canceling a request" do
  it "shows a cancel link for the requester" 


  it "does not show a cancel link for non-actionable user" 


  it "shows/hide cancel form when link is selected on redesign", js: true do
    work_order = create(:ncr_work_order, :with_beta_requester)
    login_as(work_order.proposal.requester)
    visit proposal_path(work_order.proposal)
    expect(page).to have_selector(".popup-modal", visible: false)
    click_on("Cancel request")
    expect(page).to have_selector(".popup-modal", visible: true)
    click_on("NO, TAKE ME BACK")
    expect(page).to have_selector(".popup-modal", visible: false)
  end

  it "shows cancel link for admins" 


  it "allows admin to cancel a proposal even with different client_slug" 


  it "prompts the requester for a reason" 


  context "step completers" do
    it "allows actionable step completer to cancel" 


    it "allows actionable step delegate to cancel" 


    it "disallows non-actionable step completer to cancel" 

  end

  context "email", :email do
    context "proposal without approver" do
      it "sends cancelation email to requester" 

    end

    context "proposal with pending status" do
      it "does not send cancelation email to approver" 

    end

    context "proposal with approver" do
      it "sends cancelation emails to requester and approver" 

    end

    context "proposal with observer" do
      it "sends cancelation email to observer" 

    end
  end

  context "entering in a reason cancelation" do
    it "successfully saves comments, changes the request status" 


    it "displays an error if the reason is blank" 

  end

  context "Cancel landing page" do
    it "succesfully opens the page for a requester" 


    it "redirects for non-requesters" 

  end

  def cancel_proposal(proposal)
    visit proposal_path(proposal)
    click_on("Cancel this request")
    fill_in "reason_input", with: "This is a good reason for the cancelation."
    click_on("Yes, cancel this request")
  end

  def expect_one_email_sent_to(user)
    expect(deliveries.select do |email|
      email.to.first == user.email_address
    end.length).to eq 1
  end
end

