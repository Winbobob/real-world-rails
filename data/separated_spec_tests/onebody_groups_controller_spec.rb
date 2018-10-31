require 'rails_helper'

describe Administration::Checkin::GroupsController, type: :controller do
  before(:all) { Setting.set(:features, :checkin, true) }
  after(:all)  { Setting.set(:features, :checkin, false) }

  context '#create' do
    let(:user)   { FactoryGirl.create(:person, :admin_manage_checkin) }
    let(:time)   { FactoryGirl.create(:checkin_time) }
    let(:folder) { FactoryGirl.create(:checkin_folder, checkin_time: time) }
    let(:group)  { FactoryGirl.create(:group) }

    context 'adding to a folder' do
      before do
        post :create,
             params: { ids: [group.id], checkin_folder_id: folder.id, time_id: time.id },
             session: { logged_in_id: user.id }
        @group_time = folder.group_times.first
      end

      it 'creates the group time' 


      it 'sets the group time sequence' 


      context 'given an existing group' do
        let(:group2) { FactoryGirl.create(:group) }

        it 'sets the sequence to 2' 

      end
    end
  end
end

