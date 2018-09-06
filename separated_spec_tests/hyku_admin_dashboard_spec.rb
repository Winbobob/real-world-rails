RSpec.describe 'Admin Dashboard', type: :feature do
  context 'as an administrator' do
    let(:user) { FactoryGirl.create(:admin) }
    let(:group) { FactoryGirl.create(:group) }

    before do
      login_as(user, scope: :user)
    end

    it 'shows the admin page' 


    it 'shows the status page' 


    it 'displays the add-users-to-groups page without the hidden form field', js: true do
      visit admin_group_users_path(group)
      expect(page).to have_content('Add User to Group')
      expect(page).to have_selector('.js-group-user-add', visible: false)
    end
  end
end

