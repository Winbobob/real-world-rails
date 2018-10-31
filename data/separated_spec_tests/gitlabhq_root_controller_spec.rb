require 'spec_helper'

describe RootController do
  describe 'GET index' do
    context 'when user is not logged in' do
      it 'redirects to the sign-in page' 


      context 'when a custom home page URL is defined' do
        before do
          stub_application_setting(home_page_url: 'https://gitlab.com')
        end

        it 'redirects the user to the custom home page URL' 

      end
    end

    context 'with a user' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        allow(subject).to receive(:current_user).and_return(user)
      end

      context 'who has customized their dashboard setting for starred projects' do
        before do
          user.dashboard = 'stars'
        end

        it 'redirects to their specified dashboard' 

      end

      context 'who has customized their dashboard setting for project activities' do
        before do
          user.dashboard = 'project_activity'
        end

        it 'redirects to the activity list' 

      end

      context 'who has customized their dashboard setting for starred project activities' do
        before do
          user.dashboard = 'starred_project_activity'
        end

        it 'redirects to the activity list' 

      end

      context 'who has customized their dashboard setting for groups' do
        before do
          user.dashboard = 'groups'
        end

        it 'redirects to their group list' 

      end

      context 'who has customized their dashboard setting for todos' do
        before do
          user.dashboard = 'todos'
        end

        it 'redirects to their todo list' 

      end

      context 'who has customized their dashboard setting for assigned issues' do
        before do
          user.dashboard = 'issues'
        end

        it 'redirects to their assigned issues' 

      end

      context 'who has customized their dashboard setting for assigned merge requests' do
        before do
          user.dashboard = 'merge_requests'
        end

        it 'redirects to their assigned merge requests' 

      end

      context 'who uses the default dashboard setting' do
        it 'renders the default dashboard' 

      end
    end
  end
end

