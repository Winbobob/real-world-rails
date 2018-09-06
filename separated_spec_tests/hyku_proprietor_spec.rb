RSpec.describe 'Proprietor administration', multitenant: true do
  context 'as an superadmin' do
    let(:user) { FactoryGirl.create(:superadmin) }

    before do
      login_as(user, scope: :user)
      Capybara.default_host = "http://#{Account.admin_host}"
    end

    it 'has a navbar link to an account admin section' 


    it 'has a navbar link to logout' 

  end
end

