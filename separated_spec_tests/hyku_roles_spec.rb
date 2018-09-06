RSpec.describe 'Site Roles' do
  context 'as an administrator' do
    let!(:user) { FactoryGirl.create(:admin) }
    let!(:another_user) { FactoryGirl.create(:user) }

    before do
      login_as(user, scope: :user)
    end

    it 'lists user roles' 


    it 'updates user roles' 

  end
end

