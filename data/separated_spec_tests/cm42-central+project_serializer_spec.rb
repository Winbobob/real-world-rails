require 'rails_helper'

describe ProjectSerializer do
  let(:user) { create :user, :with_team, email: 'foobar@example.com' }

  before { create :project, name: 'Test Project Foobar', users: [user] }

  let(:project) { ProjectPresenter.new(user.projects.first) }
  let(:serialized_project) { ProjectSerializer.new(project) }

  it 'should have a name that matches' 


  it 'should have a slug that matches' 


  it 'should have a path_to that matches' 


  it 'should have a archived_at that matches' 


  it 'should have a users_avatar that matches' 

end

