describe ProposalsController do
  include ReturnToHelper
  let(:user) { create(:user, client_slug: "test") }

  describe '#index' do
    before do
      login_as(user)
    end

    it "sets data fields" 

  end

  describe '#archive' do
    it "redirects to query by status" 

  end

  describe '#show' do
    before do
      login_as(user)
    end

    context "visitors" do
      it "should allow the requester to see it" 


      it "treats non-subscriber users as un-authorized" 

    end

    context "admins" do
      let(:requester) { create(:user) }
      let(:proposal) { create(:proposal, requester_id: requester.id, client_data_type: "SomeCompany::SomethingApprovable") }

      before do
        allow(Proposal).to receive(:client_model_names).and_return(["SomeCompany::SomethingApprovable"])
        allow(Proposal).to receive(:client_slugs).and_return(%w(some_company some_other_company ncr))
      end

      it "allows admins to view requests of same client" 


      it "allows app admins to view requests outside of related client" 

    end
  end

  describe '#show + new details' do
    context "cookie triggered view" do
      it "should render the show_next view" 

    end
  end

  describe '#query', elasticsearch: true do
    let!(:proposal) { create(:proposal, requester: user) }
    before do
      login_as(user)
    end

    it "requires valid search params" 


    it "should filter results by date range" 


    it "filters results by proposal status" 


    it "ignores bad input" 


    context "#datespan_header" do
      render_views

      it "has a nice header for month spans" 


      it "has a generic header for other dates" 

    end

    context "search" do
      it "plays nicely with TabularData" 


      it "returns JSON for preview count" 


      it "returns valid JSON for preview count error" 

    end
  end

  describe "#download", elasticsearch: true do
    render_views

    it "downloads results as CSV" 

  end

  describe '#cancel_form' do
    let(:proposal) { create(:proposal) }

    it "should allow the requester to see it" 


    it "should redirect random users" 


    it "should redirect for canceled requests" 

  end

  describe "#cancel" do
    let!(:proposal) { create(:proposal, requester: user) }

    before do
      login_as(user)
    end

    it "sends a cancelation email" 

  end

  describe "#complete" do
    it "signs the user in via the token" 


    it "won't sign the user in via the token if delegated" 


    it "won't allow a missing token when using GET" 


    it "will allow action if the token is valid" 


    it "doesn't allow a token to be reused" 


    it "won't allow the approval to be completed twice through the web ui" 


    it "won't allow different delegates to approve" 


    it "allows a delegate to approve via the web UI" 

  end

  def setup_proposal_page
    login_as(user)
    user.add_role(ROLE_BETA_USER)
    user.add_role(ROLE_BETA_ACTIVE)
    @proposal = create(:proposal, requester: user)
    get :show, id: @proposal.id
  end
end

