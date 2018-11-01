RSpec.describe "proprietor/accounts/index", type: :view do
  let(:account_a) { FactoryBot.create(:account) }
  let(:account_b) { FactoryBot.create(:account) }

  before do
    assign(:accounts, [account_a, account_b])
  end

  it "renders a list of accounts" 

end

