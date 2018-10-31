require 'rails_helper'
describe API::GroupsController do

  let(:user) { create :user }
  let(:group) { create :formal_group, creator: user }
  let(:guest_group) { create :guest_group, creator: user }
  let(:subgroup) { create :formal_group, parent: group }
  let(:discussion) { create :discussion, group: group }
  let(:another_group) { create :guest_group }

  before do
    group.admins << user
    sign_in user
  end

  describe 'export' do
    it 'gives access denied if you dont belong' 


    it 'sends an email' 

  end

  describe 'show' do
    it 'returns the group json' 


    it 'returns the parent group information' 


    it 'does not load guest groups' 


    context 'logged out' do
      before { @controller.stub(:current_user).and_return(LoggedOutUser.new) }
      let(:private_group) { create(:formal_group, is_visible_to_public: false) }

      it 'returns public groups if the user is logged out' 


      it 'returns unauthorized if the user is logged out and the group is private' 

    end

  end

  describe 'update' do
    it 'can update the group privacy to "open"' 


    it 'can update the group privacy to "open" join on request' 


    it 'can update the group privacy to "closed"' 


    it 'can update the group privacy to "secret"' 

  end

  describe 'count_explore_results' do
    it 'returns the number of explore group results matching the search term' 

  end

end

