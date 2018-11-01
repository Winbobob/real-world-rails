require 'rails_helper'

describe GroupsController, type: :request do
  before do
    @user = FactoryGirl.create(:person)
    @group = FactoryGirl.create(:group, name: 'Small Group', category: 'Small Groups')
    @other_group = FactoryGirl.create(:group, name: 'Other Group', category: 'Volunteer Groups')
  end

  context 'user is a group admin' do
    before do
      @user.update_attribute(:admin, Admin.create!(manage_groups: true))
      sign_in_as @user
      @group.approved = false
      @group.save!
    end

    it 'should show groups pending approval' 


    it 'should show hidden groups matching by category' 


    it 'should show allow user to Approve group' 

  end

  it 'should not show pending groups' 


  context 'enable/disable email' do
    before do
      Membership.create!(person: @user, group: @group)
    end

    context 'with code' do
      it 'should disable email' 


      it 'should enable email' 

    end

    context 'while signed in' do
      before do
        sign_in_as @user
      end

      it 'should disable email' 


      it 'should enable email' 

    end
  end
end

