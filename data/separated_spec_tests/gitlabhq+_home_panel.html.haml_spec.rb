require 'spec_helper'

describe 'projects/_home_panel' do
  context 'notifications' do
    let(:project) { create(:project) }

    before do
      assign(:project, project)

      allow(view).to receive(:current_user).and_return(user)
      allow(view).to receive(:can?).with(user, :read_project, project).and_return(false)
      allow(project).to receive(:license_anchor_data).and_return(false)
    end

    context 'when user is signed in' do
      let(:user) { create(:user) }

      before do
        notification_settings = user.notification_settings_for(project)
        assign(:notification_setting, notification_settings)
      end

      it 'makes it possible to set notification level' 

    end

    context 'when user is signed out' do
      let(:user) { nil }

      before do
        assign(:notification_setting, nil)
      end

      it 'is not possible to set notification level' 

    end
  end

  context 'badges' do
    shared_examples 'show badges' do
      it 'should render the all badges' 

    end

    let(:user) { create(:user) }
    let(:badges) { project.badges }

    before do
      assign(:project, project)

      allow(view).to receive(:current_user).and_return(user)
      allow(view).to receive(:can?).with(user, :read_project, project).and_return(false)
      allow(project).to receive(:license_anchor_data).and_return(false)
    end

    context 'has no badges' do
      let(:project) { create(:project) }

      it 'should not render any badge' 

    end

    context 'only has group badges' do
      let(:group) { create(:group) }
      let(:project) { create(:project, namespace: group) }

      before do
        create(:group_badge, group: project.group)
      end

      it_behaves_like 'show badges'
    end

    context 'only has project badges' do
      let(:project) { create(:project) }

      before do
        create(:project_badge, project: project)
      end

      it_behaves_like 'show badges'
    end

    context 'has both group and project badges' do
      let(:group) { create(:group) }
      let(:project) { create(:project, namespace: group) }

      before do
        create(:project_badge, project: project)
        create(:group_badge, group: project.group)
      end

      it_behaves_like 'show badges'
    end
  end

  context 'project id' do
    let(:project) { create(:project) }
    let(:user) { create(:user) }

    before do
      assign(:project, project)

      allow(view).to receive(:current_user).and_return(user)
      allow(project).to receive(:license_anchor_data).and_return(false)
    end

    context 'user can read project' do
      it 'is shown' 

    end

    context 'user cannot read project' do
      it 'is not shown' 

    end
  end
end

