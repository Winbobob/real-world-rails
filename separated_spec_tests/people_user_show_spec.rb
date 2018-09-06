require 'spec_helper'

describe 'User profile', js: true do
  let!(:user) { create(:user, :admin) }
  let!(:junior_role) { create(:junior_role) }
  let!(:developer_role) { create(:dev_role) }
  let!(:position) { create(:position, user: user, role: junior_role, primary: false) }

  let!(:user_profile_page) { App.new.user_profile_page }

  before do
    log_in_as user
    user_profile_page.load user_id: user.id
  end

  describe 'setting primary role' do
    it 'sets role as primary using a slider' 

  end

  describe 'adding positions' do
    it 'adds a position to user' 

  end

  describe 'rendering timeline on profile' do
    let(:user) { create(:developer_in_project) }
    before { visit user_path(user.id) }
    it_behaves_like 'has timeline visible'
    it_behaves_like 'has timeline event visible'
  end

  describe 'label and checkbox are both clickable' do
    it 'checkbox sets value to true' 


    it 'label sets value to true' 

  end
end

