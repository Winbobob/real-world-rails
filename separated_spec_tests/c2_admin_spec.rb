describe "admin" do
  it "does not allow Delete of Users" 


  it "does not allow editing of user delegates" 


  it "does not allow delete of proposals" 


  it "does not allow edit of proposals" 


  it "shows user.display_name when viewing User records" 


  it "contains reindex button link" 


  it "creates new User" 


  it "uses compatible timezone strings for User profile editing" 


  it "triggers actions on Complete button click", :email do
    login_as_admin_user
    proposal = create(:proposal, :with_serial_approvers)

    deliveries.clear
    visit admin_proposal_path(proposal)
    click_link "Complete"

    expect(deliveries.count).to eq(3)
    proposal.reload
    expect(proposal).to be_completed
  end

  it "does not trigger actions on Complete Without Notifications button click" 


  it "triggers actions, no email notifications, on Step edit" 


  def login_as_admin_user
    user = create(:user, :admin)
    login_as(user)
    user
  end
end

