require 'spec_helper'

RSpec.describe CreatePushNotificationsJob, type: :job do
  describe '#perform' do
    context 'with an Event that doesn\'t exist' do
      let(:event_id) { nil }

      it 'raises an error' 

    end

    context 'with an Event that does exist' do
      let(:post) { Fabricate(:post) }
      let(:event) { Fabricate(:event, post: post, action: :created) }
      let(:event_id) { event.id }

      it 'calls the PushNotification creator' 

    end
  end
end

