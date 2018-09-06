require 'spec_helper'

describe EventService do
  let (:project) { FactoryGirl.create :project, name: "GitLab / gitlab-shell" }
  let (:user)   { double(username: "root", id: 1) }

  before do
    Event.destroy_all
  end
  
  describe '#remove_project' do
    it "creates event" 

  end

  describe '#create_project' do
    it "creates event" 

  end

  describe '#change_project_settings' do
    it "creates event" 

  end
end

