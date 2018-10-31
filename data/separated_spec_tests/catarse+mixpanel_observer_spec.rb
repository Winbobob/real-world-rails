# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MixpanelObserver do
  let(:contribution) { create(:confirmed_contribution) }
  let(:payment) { contribution.payments.first }
  let(:people) { double('mixpanel-ruby people', { set: nil }) }
  let(:tracker) { double('mixpanel-ruby tracker', { track: nil, people: people }) }
  let(:properties) do
    contribution.user.to_analytics.merge(
      contribution.project.to_analytics.merge(
        {
          payment_method: payment.try(:gateway),
          payment_choice: payment.payment_method,
          referral: contribution.referral_link,
          anonymous: contribution.anonymous,
          value: contribution.value,
          reward_id: contribution.reward_id,
          reward_value: contribution.reward.try(:minimum_value)
        }
      )
    )
  end

  let(:project) { create(:project, state: 'online') }
  let(:project_owner_properties) do
    project.user.to_analytics
  end

  before do
    allow_any_instance_of(MixpanelObserver).to receive(:tracker).and_call_original
    allow_any_instance_of(MixpanelObserver).to receive_messages(tracker: tracker)
  end

  describe '#from_pending_to_paid' do
    it 'should send tracker a track call with the user id of the contribution' 

  end

  describe '#after_save' do
    context 'when we change a projecte state to online' do
      let(:project) { create(:project, state: 'draft') }
      let(:user) { project.user }

      it 'should set user has_online_project in mixpanel' 

    end

    context 'when we create a Reward' do
      it 'should send tracker a track call with the change' 

    end
  end

  describe '#after_create' do
    context 'when we create a ProjectPost' do
      it 'should send tracker a track call with the change' 

    end
  end

  describe '#after_update' do
    context "when we update a project's uploaded_image" do
      it 'should send tracker a track call with the change' 

    end
    %i[video_url about_html headline].each do |attribute|
      context "when we update a project's #{attribute}" do
        it 'should send tracker a track call with the change' 

      end
    end

    context 'when we update a project owner profile' do
      let(:user) { project.user }
      it 'should send tracker a track call with the change' 

    end
  end
end

