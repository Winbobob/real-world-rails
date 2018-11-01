require 'rails_helper'

describe FamiliesController, type: :controller do
  before do
    @person, @other_person = FactoryGirl.create_list(:person, 2)
    @family = @person.family
    @child = FactoryGirl.create(:person, family: @family, birthday: 1.year.ago, gender: 'Female', child: nil)
    @admin = FactoryGirl.create(:person, admin: Admin.create(edit_profiles: true))
  end

  it 'should show a family' 


  it 'should not show hidden people in the family' 


  it 'should not show the family unless it is visible' 


  it 'should create a new family' 


  it 'should not create a new family unless user is admin' 


  it 'should edit a family' 


  it 'should not show xml unless user can export data' 


  it 'should show xml for admin who can export data' 

end

