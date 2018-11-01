require 'rails_helper'

describe StoryChangesNotificationsChecker do
  let(:user) { double :user }
  let(:responsible) { double :responsible, email_delivery?: true }

  let(:story) do
    double(
      :story,
      state_changed?: true,
      suppress_notifications: false,
      acting_user: user,
      state: 'started',
      requested_by: responsible
    )
  end

  subject { described_class.new(story) }

  describe '#can_notify?' do
    context 'when state has changed' do
      it 'should notify' 

    end

    context 'when state has not changed' do
      it 'should not notify' 

    end

    context 'when notifications are disabled' do
      it 'should not notify' 

    end

    context 'when changes were not did by an user' do
      it 'should not notify' 

    end

    context 'when story has no responsible' do
      it 'should not notify' 

    end

    context 'when story has changed by its responsible' do
      it 'should not notify' 

    end

    context 'when responsible has email notification disabled' do
      it 'should not notify' 

    end
  end
end

