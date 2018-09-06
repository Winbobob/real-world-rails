require 'spec_helper'

RSpec.describe 'Dashboard Active Tab', :js do
  before do
    sign_in(create(:user))
  end

  shared_examples 'page has active tab' do |title|
    it "#{title} tab" 

  end

  context 'on dashboard projects' do
    before do
      visit dashboard_projects_path
    end

    it_behaves_like 'page has active tab', 'Projects'
  end

  context 'on dashboard groups' do
    before do
      visit dashboard_groups_path
    end

    it_behaves_like 'page has active tab', 'Groups'
  end

  context 'on activity projects' do
    before do
      visit activity_dashboard_path
    end

    it_behaves_like 'page has active tab', 'Activity'
  end
end

