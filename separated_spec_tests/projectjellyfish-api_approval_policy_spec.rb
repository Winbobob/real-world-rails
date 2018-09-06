describe ApprovalPolicy do
  it_should_behave_like 'a project policy subclass', :approval
  subject { ApprovalPolicy }

  permissions :index? do
    it 'allows access for a user' 

    it 'allows access for an admin' 

  end

  permissions :create? do
    it 'prevents creation if not an admin' 

    it 'allows an admin to create approvals' 

  end
end

