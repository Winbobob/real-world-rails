# frozen_string_literal: true

require 'spec_helper'

describe Allyships::AllianceNotifier do
  describe '#perform' do
    subject { described_class.perform }
    let(:instantiated_object) { described_class.new }

    it 'calls .perform' 

  end

  describe '.perform' do
    subject { described_class.perform(params) }

    let(:params) do
      {
        ally_id: ally.id,
        current_user: user,
        pusher_type: pusher_type
      }
    end
    let(:user) { create :user }
    let(:ally) { create :user }
    let(:pusher_type) do
      'new_ally_request'
    end
    let(:notifications) do
      {
        notifications: Notification.where(user_id: ally.id).order(:created_at)
      }
    end

    it 'creates the notification' 


    it 'triggers Pusher' 

  end
end

