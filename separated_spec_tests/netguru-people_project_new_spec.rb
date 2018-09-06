require 'spec_helper'

describe 'Adding new project', js: true do
  let!(:admin_user) { create :user, :admin }

  let!(:project_new_page) { App.new.project_new_page }

  before do
    log_in_as admin_user
    project_new_page.load
  end

  context 'when adding a valid project' do
    context 'with complete data' do
      it 'creates a new project' 

    end
  end

  context 'when adding invalid project' do
    context 'when name is not present' do
      it 'fails with error message' 

    end
  end

  context 'maintenance project' do
    it "displays additional date selector for 'Maintenance since'" 


    it "displays error when 'Maintenance since' is not filled" 

  end
end

