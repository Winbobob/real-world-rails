require 'rails_helper'

describe TasksController, type: :controller do
  before do
    @person, @other_person = FactoryGirl.create_list(:person, 2)
    @group, @other_group = FactoryGirl.create_list(:group, 2)
    @group.memberships.create(person_id: @person.id)
    @group.update_attribute(:has_tasks, true)
    @task = FactoryGirl.create(:task, group: @group, person: @person)
    @other_task = FactoryGirl.create(:task, group: @other_group, person: @other_person)
  end

  it 'should list all the groups tasks' 


  it 'should create a task' 


  describe 'group_scope' do
    it 'should create a task, intended for the entire group' 

    it 'should create a task, assigned to a person' 

  end
end

