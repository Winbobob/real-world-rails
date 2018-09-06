require 'spec_helper'

feature 'Project remote mirror', :feature do
  let(:project) { create(:project, :repository, :remote_mirror) }
  let(:remote_mirror) { project.remote_mirrors.first }
  let(:user) { create(:user) }

  describe 'On a project', :js do
    before do
      project.add_master(user)
      sign_in user
    end

    context 'when last_error is present but last_update_at is not' do
      it 'renders error message without timstamp' 

    end

    context 'when last_error and last_update_at are present' do
      it 'renders error message with timestamp' 

    end
  end
end

