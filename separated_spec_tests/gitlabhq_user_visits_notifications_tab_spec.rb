require 'spec_helper'

feature 'User visits the notifications tab', :js do
  let(:project) { create(:project) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)
    visit(profile_notifications_path)
  end

  it 'changes the project notifications setting' 

end

