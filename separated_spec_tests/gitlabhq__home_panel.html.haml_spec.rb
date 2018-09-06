require 'spec_helper'

describe 'projects/_home_panel' do
  let(:group) { create(:group) }
  let(:project) { create(:project, :public, namespace: group) }

  let(:notification_settings) do
    user&.notification_settings_for(project)
  end

  before do
    assign(:project, project)
    assign(:notification_setting, notification_settings)

    allow(view).to receive(:current_user).and_return(user)
    allow(view).to receive(:can?).and_return(false)
  end

  context 'when user is signed in' do
    let(:user) { create(:user) }

    it 'makes it possible to set notification level' 

  end

  context 'when user is signed out' do
    let(:user) { nil }

    it 'is not possible to set notification level' 

  end

  context 'when project' do
    let!(:user) { create(:user) }
    let(:badges) { project.badges }

    context 'has no badges' do
      it 'should not render any badge' 

    end

    shared_examples 'show badges' do
      it 'should render the all badges' 

    end

    context 'only has group badges' do
      before do
        create(:group_badge, group: project.group)
      end

      it_behaves_like 'show badges'
    end

    context 'only has project badges' do
      before do
        create(:project_badge, project: project)
      end

      it_behaves_like 'show badges'
    end

    context 'has both group and project badges' do
      before do
        create(:project_badge, project: project)
        create(:group_badge, group: project.group)
      end

      it_behaves_like 'show badges'
    end
  end
end

