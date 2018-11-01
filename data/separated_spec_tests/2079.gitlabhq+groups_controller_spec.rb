require 'spec_helper'

describe GroupsController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:group) { create(:group, :public) }
  let(:project) { create(:project, namespace: group) }
  let!(:group_member) { create(:group_member, group: group, user: user) }
  let!(:owner) { group.add_owner(create(:user)).user }
  let!(:maintainer) { group.add_maintainer(create(:user)).user }
  let!(:developer) { group.add_developer(create(:user)).user }
  let!(:guest) { group.add_guest(create(:user)).user }

  shared_examples 'member with ability to create subgroups' do
    it 'renders the new page' 

  end

  shared_examples 'member without ability to create subgroups' do
    it 'renders the 404 page' 

  end

  describe 'GET #show' do
    before do
      sign_in(user)
      project
    end

    context 'as atom' do
      it 'assigns events for all the projects in the group' 

    end
  end

  describe 'GET edit' do
    it 'sets the badge API endpoint' 

  end

  describe 'GET #new' do
    context 'when creating subgroups', :nested_groups do
      [true, false].each do |can_create_group_status|
        context "and can_create_group is #{can_create_group_status}" do
          before do
            User.where(id: [admin, owner, maintainer, developer, guest]).update_all(can_create_group: can_create_group_status)
          end

          [:admin, :owner].each do |member_type|
            context "and logged in as #{member_type.capitalize}" do
              it_behaves_like 'member with ability to create subgroups' do
                let(:member) { send(member_type) }
              end
            end
          end

          [:guest, :developer, :maintainer].each do |member_type|
            context "and logged in as #{member_type.capitalize}" do
              it_behaves_like 'member without ability to create subgroups' do
                let(:member) { send(member_type) }
              end
            end
          end
        end
      end
    end
  end

  describe 'GET #activity' do
    render_views

    before do
      sign_in(user)
      project
    end

    context 'as json' do
      it 'includes all projects in event feed' 

    end
  end

  describe 'POST #create' do
    context 'when creating subgroups', :nested_groups do
      [true, false].each do |can_create_group_status|
        context "and can_create_group is #{can_create_group_status}" do
          context 'and logged in as Owner' do
            it 'creates the subgroup' 

          end

          context 'and logged in as Developer' do
            it 'renders the new template' 

          end
        end
      end
    end

    context 'when creating a top level group' do
      before do
        sign_in(developer)
      end

      context 'and can_create_group is enabled' do
        before do
          developer.update_attribute(:can_create_group, true)
        end

        it 'creates the Group' 

      end

      context 'and can_create_group is disabled' do
        before do
          developer.update_attribute(:can_create_group, false)
        end

        it 'does not create the Group' 

      end
    end
  end

  describe 'GET #index' do
    context 'as a user' do
      it 'redirects to Groups Dashboard' 

    end

    context 'as a guest' do
      it 'redirects to Explore Groups' 

    end
  end

  describe 'GET #issues' do
    let(:issue_1) { create(:issue, project: project, title: 'foo') }
    let(:issue_2) { create(:issue, project: project, title: 'bar') }

    before do
      create_list(:award_emoji, 3, awardable: issue_2)
      create_list(:award_emoji, 2, awardable: issue_1)
      create_list(:award_emoji, 2, :downvote, awardable: issue_2)

      sign_in(user)
    end

    context 'sorting by votes' do
      it 'sorts most popular issues' 


      it 'sorts least popular issues' 

    end

    context 'searching' do
      # Remove as part of https://gitlab.com/gitlab-org/gitlab-ce/issues/52271
      before do
        stub_feature_flags(use_cte_for_group_issues_search: false)
      end

      it 'works with popularity sort' 


      it 'works with priority sort' 


      it 'works with label priority sort' 

    end
  end

  describe 'GET #merge_requests' do
    let(:merge_request_1) { create(:merge_request, source_project: project) }
    let(:merge_request_2) { create(:merge_request, :simple, source_project: project) }

    before do
      create_list(:award_emoji, 3, awardable: merge_request_2)
      create_list(:award_emoji, 2, awardable: merge_request_1)
      create_list(:award_emoji, 2, :downvote, awardable: merge_request_2)

      sign_in(user)
    end

    context 'sorting by votes' do
      it 'sorts most popular merge requests' 


      it 'sorts least popular merge requests' 

    end
  end

  describe 'DELETE #destroy' do
    context 'as another user' do
      it 'returns 404' 

    end

    context 'as the group owner' do
      before do
        sign_in(user)
      end

      it 'schedules a group destroy' 


      it 'redirects to the root path' 

    end
  end

  describe 'PUT update' do
    before do
      sign_in(user)
    end

    it 'updates the path successfully' 


    it 'does not update the path on error' 

  end

  describe '#ensure_canonical_path' do
    before do
      sign_in(user)
    end

    context 'for a GET request' do
      context 'when requesting groups at the root path' do
        before do
          allow(request).to receive(:original_fullpath).and_return("/#{group_full_path}")
          get :show, id: group_full_path
        end

        context 'when requesting the canonical path with different casing' do
          let(:group_full_path) { group.to_param.upcase }

          it 'redirects to the correct casing' 

        end

        context 'when requesting a redirected path' do
          let(:redirect_route) { group.redirect_routes.create(path: 'old-path') }
          let(:group_full_path) { redirect_route.path }

          it 'redirects to the canonical path' 


          context 'when the old group path is a substring of the scheme or host' do
            let(:redirect_route) { group.redirect_routes.create(path: 'http') }

            it 'does not modify the requested host' 

          end

          context 'when the old group path is substring of groups' do
            # I.e. /groups/oups should not become /grfoo/oups
            let(:redirect_route) { group.redirect_routes.create(path: 'oups') }

            it 'does not modify the /groups part of the path' 

          end
        end
      end

      context 'when requesting groups under the /groups path' do
        context 'when requesting the canonical path' do
          context 'non-show path' do
            context 'with exactly matching casing' do
              it 'does not redirect' 

            end

            context 'with different casing' do
              it 'redirects to the correct casing' 

            end
          end

          context 'show path' do
            context 'with exactly matching casing' do
              it 'does not redirect' 

            end

            context 'with different casing' do
              it 'redirects to the correct casing at the root path' 

            end
          end
        end

        context 'when requesting a redirected path' do
          let(:redirect_route) { group.redirect_routes.create(path: 'old-path') }

          it 'redirects to the canonical path' 


          context 'when the old group path is a substring of the scheme or host' do
            let(:redirect_route) { group.redirect_routes.create(path: 'http') }

            it 'does not modify the requested host' 

          end

          context 'when the old group path is substring of groups' do
            # I.e. /groups/oups should not become /grfoo/oups
            let(:redirect_route) { group.redirect_routes.create(path: 'oups') }

            it 'does not modify the /groups part of the path' 

          end

          context 'when the old group path is substring of groups plus the new path' do
            # I.e. /groups/oups/oup should not become /grfoos
            let(:redirect_route) { group.redirect_routes.create(path: 'oups/oup') }

            it 'does not modify the /groups part of the path' 

          end
        end
      end

      context 'for a POST request' do
        context 'when requesting the canonical path with different casing' do
          it 'does not 404' 


          it 'does not redirect to the correct casing' 

        end

        context 'when requesting a redirected path' do
          let(:redirect_route) { group.redirect_routes.create(path: 'old-path') }

          it 'returns not found' 

        end
      end

      context 'for a DELETE request' do
        context 'when requesting the canonical path with different casing' do
          it 'does not 404' 


          it 'does not redirect to the correct casing' 

        end

        context 'when requesting a redirected path' do
          let(:redirect_route) { group.redirect_routes.create(path: 'old-path') }

          it 'returns not found' 

        end
      end
    end

    def group_moved_message(redirect_route, group)
      "Group '#{redirect_route.path}' was moved to '#{group.full_path}'. Please update any links and bookmarks that may still have the old path."
    end
  end

  describe 'PUT transfer', :postgresql do
    before do
      sign_in(user)
    end

    context 'when transfering to a subgroup goes right' do
      let(:new_parent_group) { create(:group, :public) }
      let!(:group_member) { create(:group_member, :owner, group: group, user: user) }
      let!(:new_parent_group_member) { create(:group_member, :owner, group: new_parent_group, user: user) }

      before do
        put :transfer,
          id: group.to_param,
          new_parent_group_id: new_parent_group.id
      end

      it 'should return a notice' 


      it 'should redirect to the new path' 

    end

    context 'when converting to a root group goes right' do
      let(:group) { create(:group, :public, :nested) }
      let!(:group_member) { create(:group_member, :owner, group: group, user: user) }

      before do
        put :transfer,
          id: group.to_param,
          new_parent_group_id: ''
      end

      it 'should return a notice' 


      it 'should redirect to the new path' 

    end

    context 'When the transfer goes wrong' do
      let(:new_parent_group) { create(:group, :public) }
      let!(:group_member) { create(:group_member, :owner, group: group, user: user) }
      let!(:new_parent_group_member) { create(:group_member, :owner, group: new_parent_group, user: user) }

      before do
        allow_any_instance_of(::Groups::TransferService).to receive(:proceed_to_transfer).and_raise(Gitlab::UpdatePathError, 'namespace directory cannot be moved')

        put :transfer,
          id: group.to_param,
          new_parent_group_id: new_parent_group.id
      end

      it 'should return an alert' 


      it 'should redirect to the current path' 

    end

    context 'when the user is not allowed to transfer the group' do
      let(:new_parent_group) { create(:group, :public) }
      let!(:group_member) { create(:group_member, :guest, group: group, user: user) }
      let!(:new_parent_group_member) { create(:group_member, :guest, group: new_parent_group, user: user) }

      before do
        put :transfer,
          id: group.to_param,
          new_parent_group_id: new_parent_group.id
      end

      it 'should be denied' 

    end
  end
end

