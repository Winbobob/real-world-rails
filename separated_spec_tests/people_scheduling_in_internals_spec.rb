require 'spec_helper'

describe 'Scheduling in internals page', js: true do
  let(:admin_user) { create(:user, :admin) }
  let!(:developer) { create(:user, :developer) }
  let!(:project) { create(:project, :internal, starts_at: DateTime.now) }
  let!(:dev_membership) { create(:membership, user: developer, project: project) }
  let!(:scheduling_in_internals_page) { App.new.scheduling_in_internals_page }
  let(:user_row) { scheduling_in_internals_page.user_rows.first }

  before do
    log_in_as admin_user
    scheduling_in_internals_page.load
  end

  it 'displays technical users in internals' 


  it 'displays an internal label in the project column' 

end

