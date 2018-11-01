describe ProposalPolicy::Scope do
  let(:proposal) { create(:proposal, :with_parallel_approvers, :with_observers) }

  it "allows the requester to see" 


  it "allows an requester to see, when there are no observers/approvers" 


  it "allows an approver to see" 


  it "does not allow a pending approver to see" 


  it "allows a delegate to see" 


  it "allows an observer to see" 


  it "does not allow anyone else to see" 


  context "client_admin role privileges" do
    let(:requester) { create(:user) }
    let(:proposal1) { create(:proposal, :with_parallel_approvers, :with_observers, requester_id: requester.id) }
    let(:user) { create(:user, client_slug: "abc_company", email_address: "admin@example.com") }
    let(:proposals) { ProposalPolicy::Scope.new(user, Proposal).resolve }

    before do
      allow(Proposal).to receive(:client_slugs).and_return(%w(abc_company ncr))
    end

    it "allows them to see unassociated requests that are inside its client scope" 


    context "outside of their client scope" do
      before do
        expect(Proposal).to receive(:client_model_names).and_return(["CdfCompany::SomethingApprovable"])
      end

      it "allows them to see Proposals they are involved with" 


      it "prevents them from seeing outside requests" 

    end

    it "prevents a non-admin from seeing unrelated requests" 

  end

  context "admin role privileges" do
    let(:requester) { create(:user) }
    let(:proposal1) { create(:proposal, :with_parallel_approvers, :with_observers, requester_id: requester.id) }
    let(:user) { create(:user, client_slug: "abc_company") }
    let(:proposals) { ProposalPolicy::Scope.new(user, Proposal).resolve }

    before do
      allow(Proposal).to receive(:client_slugs).and_return(%w(abc_company ncr))
    end

    it "allows an app admin to see requests inside and outside its client scope" 

  end
end

