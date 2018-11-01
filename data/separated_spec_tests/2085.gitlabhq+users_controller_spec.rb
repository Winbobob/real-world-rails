require 'spec_helper'

describe UsersController do
  let(:user) { create(:user) }
  let(:private_user) { create(:user, private_profile: true) }
  let(:public_user) { create(:user) }

  describe 'GET #show' do
    context 'with rendered views' do
      render_views

      describe 'when logged in' do
        before do
          sign_in(user)
        end

        it 'renders the show template' 

      end

      describe 'when logged out' do
        it 'renders the show template' 

      end
    end

    context 'when public visibility level is restricted' do
      before do
        stub_application_setting(restricted_visibility_levels: [Gitlab::VisibilityLevel::PUBLIC])
      end

      context 'when logged out' do
        it 'redirects to login page' 

      end

      context 'when logged in' do
        before do
          sign_in(user)
        end

        it 'renders show' 

      end
    end

    context 'when a user by that username does not exist' do
      context 'when logged out' do
        it 'redirects to login page' 

      end

      context 'when logged in' do
        before do
          sign_in(user)
        end

        it 'renders 404' 

      end
    end

    context 'json with events' do
      let(:project) { create(:project) }
      before do
        project.add_developer(user)
        Gitlab::DataBuilder::Push.build_sample(project, user)

        sign_in(user)
      end

      it 'loads events' 


      it 'hides events if the user cannot read cross project' 


      it 'hides events if the user has a private profile' 

    end
  end

  describe 'GET #calendar' do
    context 'for user' do
      let(:project) { create(:project) }

      before do
        sign_in(user)
        project.add_developer(user)
      end

      context 'with public profile' do
        it 'renders calendar' 

      end

      context 'with private profile' do
        it 'does not render calendar' 

      end
    end

    context 'forked project' do
      let(:project) { create(:project) }
      let(:forked_project) { Projects::ForkService.new(project, user).execute }

      before do
        sign_in(user)
        project.add_developer(user)

        push_data = Gitlab::DataBuilder::Push.build_sample(project, user)

        fork_push_data = Gitlab::DataBuilder::Push
          .build_sample(forked_project, user)

        EventCreateService.new.push(project, user, push_data)
        EventCreateService.new.push(forked_project, user, fork_push_data)
      end

      it 'includes forked projects' 

    end
  end

  describe 'GET #calendar_activities' do
    let!(:project) { create(:project) }
    let(:user) { create(:user) }

    before do
      allow_any_instance_of(User).to receive(:contributed_projects_ids).and_return([project.id])

      sign_in(user)
      project.add_developer(user)
    end

    it 'assigns @calendar_date' 


    context 'for user' do
      context 'with public profile' do
        it 'renders calendar_activities' 

      end

      context 'with private profile' do
        it 'does not render calendar_activities' 

      end
    end
  end

  describe 'GET #snippets' do
    before do
      sign_in(user)
    end

    context 'format html' do
      it 'renders snippets page' 

    end

    context 'format json' do
      it 'response with snippets json data' 

    end
  end

  describe 'GET #exists' do
    before do
      sign_in(user)
    end

    context 'when user exists' do
      it 'returns JSON indicating the user exists' 


      context 'when the casing is different' do
        let(:user) { create(:user, username: 'CamelCaseUser') }

        it 'returns JSON indicating the user exists' 

      end
    end

    context 'when the user does not exist' do
      it 'returns JSON indicating the user does not exist' 


      context 'when a user changed their username' do
        let(:redirect_route) { user.namespace.redirect_routes.create(path: 'old-username') }

        it 'returns JSON indicating a user by that username does not exist' 

      end
    end
  end

  describe '#ensure_canonical_path' do
    before do
      sign_in(user)
    end

    context 'for a GET request' do
      context 'when requesting users at the root path' do
        context 'when requesting the canonical path' do
          let(:user) { create(:user, username: 'CamelCaseUser') }

          context 'with exactly matching casing' do
            it 'responds with success' 

          end

          context 'with different casing' do
            it 'redirects to the correct casing' 

          end
        end

        context 'when requesting a redirected path' do
          let(:redirect_route) { user.namespace.redirect_routes.create(path: 'old-path') }

          it 'redirects to the canonical path' 


          context 'when the old path is a substring of the scheme or host' do
            let(:redirect_route) { user.namespace.redirect_routes.create(path: 'http') }

            it 'does not modify the requested host' 

          end

          context 'when the old path is substring of users' do
            let(:redirect_route) { user.namespace.redirect_routes.create(path: 'ser') }

            it 'redirects to the canonical path' 

          end
        end
      end

      context 'when requesting users under the /users path' do
        context 'when requesting the canonical path' do
          let(:user) { create(:user, username: 'CamelCaseUser') }

          context 'with exactly matching casing' do
            it 'responds with success' 

          end

          context 'with different casing' do
            it 'redirects to the correct casing' 

          end
        end

        context 'when requesting a redirected path' do
          let(:redirect_route) { user.namespace.redirect_routes.create(path: 'old-path') }

          it 'redirects to the canonical path' 


          context 'when the old path is a substring of the scheme or host' do
            let(:redirect_route) { user.namespace.redirect_routes.create(path: 'http') }

            it 'does not modify the requested host' 

          end

          context 'when the old path is substring of users' do
            let(:redirect_route) { user.namespace.redirect_routes.create(path: 'ser') }

            # I.e. /users/ser should not become /ufoos/ser
            it 'does not modify the /users part of the path' 

          end
        end
      end
    end
  end

  def user_moved_message(redirect_route, user)
    "User '#{redirect_route.path}' was moved to '#{user.full_path}'. Please update any links and bookmarks that may still have the old path."
  end
end

