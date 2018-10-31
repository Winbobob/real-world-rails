RSpec.describe "proprietor/accounts/edit", type: :view do
  before do
    assign(:account, account)
    render
  end

  context "with connections" do
    let(:account) { create(:account) }

    it "renders the edit account form" 

  end

  context "without connections" do
    let(:account) { create(:account, solr_endpoint: nil, fcrepo_endpoint: nil) }

    it "renders the edit account form" 

  end
end

