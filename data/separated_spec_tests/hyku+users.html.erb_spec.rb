RSpec.describe 'admin/groups/users', type: :view do
  context 'groups index page' do
    let(:group) { FactoryBot.create(:group) }
    let(:user_1) { FactoryBot.create(:user) }
    let(:user_2) { FactoryBot.create(:user) }
    let(:users) { double('users') }
    let(:path_parameters) do
      {
        controller: 'admin/group_users',
        action: 'index',
        group_id: group.id
      }
    end

    before do
      allow(controller).to receive(:params).and_return(path_parameters)
      # Mocking methods required by UrlFor in order to pass in a :group_id
      allow(controller.request).to receive(:params).and_return(path_parameters)
      allow(controller.request).to receive(:path_parameters).and_return(path_parameters)
      # Mocking users collection to provide methods for kaminari
      allow(users).to receive(:each).and_yield(user_1).and_yield(user_2)
      allow(users).to receive(:total_pages).and_return(1)
      allow(users).to receive(:current_page).and_return(1)
      allow(users).to receive(:limit_value).and_return(10)
      assign(:users, users)
      assign(:group, group)
      render
    end

    it 'has the "users" tab in an active state' 


    it 'has tabs for other actions on the group' 


    it 'has a user search control' 


    it 'has an add user form' 


    it 'has a member search control' 


    it 'has a pagination select control' 


    it 'renders a list of members' 

  end
end

