require 'spec_helper'

describe Projects::LabelsController do
  let(:group)   { create(:group) }
  let(:project) { create(:project, namespace: group) }
  let(:user)    { create(:user) }

  before do
    project.add_maintainer(user)

    sign_in(user)
  end

  describe 'GET #index' do
    let!(:label_1) { create(:label, project: project, priority: 1, title: 'Label 1') }
    let!(:label_2) { create(:label, project: project, priority: 3, title: 'Label 2') }
    let!(:label_3) { create(:label, project: project, priority: 1, title: 'Label 3') }
    let!(:label_4) { create(:label, project: project, title: 'Label 4') }
    let!(:label_5) { create(:label, project: project, title: 'Label 5') }

    let!(:group_label_1) { create(:group_label, group: group, title: 'Group Label 1') }
    let!(:group_label_2) { create(:group_label, group: group, title: 'Group Label 2') }
    let!(:group_label_3) { create(:group_label, group: group, title: 'Group Label 3') }
    let!(:group_label_4) { create(:group_label, group: group, title: 'Group Label 4') }

    before do
      create(:label_priority, project: project, label: group_label_1, priority: 3)
      create(:label_priority, project: project, label: group_label_2, priority: 1)
    end

    context '@prioritized_labels' do
      before do
        list_labels
      end

      it 'does not include labels without priority' 


      it 'is sorted by priority, then label title' 

    end

    context '@labels' do
      it 'is sorted by label title' 


      it 'does not include labels with priority' 


      it 'does not include group labels when project does not belong to a group' 

    end

    def list_labels
      get :index, namespace_id: project.namespace.to_param, project_id: project
    end
  end

  describe 'POST #generate' do
    context 'personal project' do
      let(:personal_project) { create(:project, namespace: user.namespace) }

      it 'creates labels' 

    end

    context 'project belonging to a group' do
      it 'creates labels' 

    end
  end

  describe 'POST #toggle_subscription' do
    it 'allows user to toggle subscription on project labels' 


    it 'allows user to toggle subscription on group labels' 


    def toggle_subscription(label)
      post :toggle_subscription, namespace_id: project.namespace.to_param, project_id: project, id: label.to_param
    end
  end

  describe 'POST #promote' do
    let!(:promoted_label_name) { "Promoted Label" }
    let!(:label_1) { create(:label, title: promoted_label_name, project: project) }

    context 'not group reporters' do
      it 'denies access' 

    end

    context 'group reporter' do
      before do
        group.add_reporter(user)
      end

      it 'gives access' 


      it 'promotes the label' 


      it 'renders label name without parsing it as HTML' 


      context 'service raising InvalidRecord' do
        before do
          expect_any_instance_of(Labels::PromoteService).to receive(:execute) do |label|
            raise ActiveRecord::RecordInvalid.new(label_1)
          end
        end

        it 'returns to label list' 

      end
    end
  end

  describe '#ensure_canonical_path' do
    before do
      sign_in(user)
    end

    context 'for a GET request' do
      context 'when requesting the canonical path' do
        context 'non-show path' do
          context 'with exactly matching casing' do
            it 'does not redirect' 

          end

          context 'with different casing' do
            it 'redirects to the correct casing' 

          end
        end
      end

      context 'when requesting a redirected path' do
        let!(:redirect_route) { project.redirect_routes.create(path: project.full_path + 'old') }

        it 'redirects to the canonical path' 

      end
    end
  end

  context 'for a non-GET request' do
    context 'when requesting the canonical path with different casing' do
      it 'does not 404' 


      it 'does not redirect to the correct casing' 

    end

    context 'when requesting a redirected path' do
      let!(:redirect_route) { project.redirect_routes.create(path: project.full_path + 'old') }

      it 'returns not found' 

    end
  end

  def project_moved_message(redirect_route, project)
    "Project '#{redirect_route.path}' was moved to '#{project.full_path}'. Please update any links and bookmarks that may still have the old path."
  end
end

