require 'rails_helper'

describe PrayerRequestsController, type: :controller do
  before do
    @person, @other_person = FactoryGirl.create_list(:person, 2)
    @group = FactoryGirl.create(:group)
    @group.memberships.create(person_id: @person.id)
    @prayer_request = FactoryGirl.create(:prayer_request, group: @group, person: @person)
  end

  it 'should list all prayer requests' 


  it 'should list all answered prayer requests' 


  it 'should show a prayer request' 


  it 'should not show a prayer request if the user is not a member of the group' 


  it 'should create a prayer request' 


  it 'should create a prayer request and send email to group members' 


  it 'should not create a prayer request if the user is not a member of the group' 


  it 'should edit a prayer request' 


  it 'should not edit a prayer request if the user is not a member of the group' 


  it 'should delete a prayer request' 


  it 'should not delete a prayer request if the user is not a member of the group' 

end

