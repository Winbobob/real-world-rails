require 'spec_helper'

describe 'Scheduling page', js: true do
  let(:admin_user) { create(:user, :admin, :developer) }
  let!(:dev_without_skills) { create(:user, :developer) }
  let(:dev_with_two_skills) { create(:user, :developer) }
  let(:ember_dev) { create(:user, :developer) }
  let(:angular_skill) { create(:skill, name: 'AngularJS') }
  let!(:user_skill_rate1) do
    create(:user_skill_rate, user: dev_with_two_skills, skill: angular_skill, rate: 1)
  end
  let(:ember_skill) { create(:skill, name: 'EmberJS') }
  let!(:user_skill_rate2) do
    create(:user_skill_rate, user: dev_with_two_skills, skill: ember_skill, rate: 1)
  end
  let!(:user_skill_rate3) do
    create(:user_skill_rate, user: ember_dev, skill: ember_skill, rate: 1)
  end
  let!(:another_dev) { create(:user, :developer) }
  let!(:developer) { create(:developer_in_project, :with_project_scheduled_with_due_date) }
  let!(:pm) { create(:pm_user) }
  let!(:next_project) { create(:project, starts_at: DateTime.now, end_at: nil) }
  let!(:next_membership_for_developer) do
    create(:membership, {
             starts_at: DateTime.current + 2.months,
             ends_at: nil,
             user: developer,
             project: next_project
           })
  end
  let!(:scheduling_page) { App.new.scheduling_page }

  before do
    log_in_as admin_user
    scheduling_page.load
  end

  describe 'filters' do
    it 'allows to filter by skills' 

  end

  describe 'table with users' do
    it 'displays users' 


    it 'displays only technical users' 

  end

  describe 'next project same as current' do
    it 'displays project twice for a specific user' 

  end
end

