describe 'Linear approvals' do
  it 'allows the approver to approve' 


  it 'does not allow the approver to approve twice' 


  it "shows the approver role next to each approver" 


  def create_approvals_for(users)
    users.each_with_index.map do |user, index|
      create(:approval_step, user: user, position: index + 1)
    end
  end

  def create_serial_approval(proposal, child_steps)
    proposal.root_step = Steps::Serial.new(child_steps: child_steps)
  end

  def approve_approval_for(proposal, user)
    proposal.individual_steps.where(user: user).first.complete!
  end
end

