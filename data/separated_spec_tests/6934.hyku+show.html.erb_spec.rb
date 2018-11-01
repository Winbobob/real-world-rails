RSpec.describe "proprietor/accounts/show", type: :view do
  let(:account) { FactoryBot.create(:account) }
  let(:admin1) { build(:user) }
  let(:admin2) { build(:user) }

  before do
    allow(Apartment::Tenant).to receive(:switch).with(account.tenant) do |&block|
      block.call
    end
    @account = assign(:account, account)
  end

  it "renders account admin management form" 


  it 'has a button to edit account' 


  context 'with no admin users' do
    before do
      allow(account).to receive(:admin_emails).and_return([])
      render
    end

    it 'displays "No administrators exist"' 

  end

  context 'with admin users' do
    before do
      allow(account).to receive(:admin_emails).and_return([admin1.email, admin2.email])
      render
    end

    it 'displays each user email and a remove button' 

  end
end

