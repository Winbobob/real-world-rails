require 'spec_helper'

describe Projects::MoveNotificationSettingsService do
  let(:user) { create(:user) }
  let(:project_with_notifications) { create(:project, namespace: user.namespace) }
  let(:target_project) { create(:project, namespace: user.namespace) }

  subject { described_class.new(target_project, user) }

  describe '#execute' do
    context 'with notification settings' do
      before do
        create_list(:notification_setting, 2, source: project_with_notifications)
      end

      it 'moves the user\'s notification settings from one project to another' 


      it 'rollbacks changes if transaction fails' 

    end

    it 'does not move existent notification settings in the current project' 


    context 'when remove_remaining_elements is false' do
      let(:options) { { remove_remaining_elements: false } }

      it 'does not remove remaining notification settings' 

    end
  end
end

