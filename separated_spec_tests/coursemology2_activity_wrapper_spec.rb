# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Notifier::Base::ActivityWrapper, type: :notifier do
  let!(:instance) { Instance.default }
  with_tenant(:instance) do
    describe '#notify' do
      let(:notifier) { Notifier::Base.new }
      let(:user) { create(:user) }
      let(:course) { create(:course) }
      let!(:course_users) { create(:course_user, course: course) }
      let(:activity) do
        Notifier::Base::ActivityWrapper.
          new(notifier, Activity.new(actor: user, object: user, event: :created,
                                     notifier_type: notifier.class.name))
      end
      let(:template) { 'activity_mailer/test_email' }

      context 'when recipient is User' do
        context 'when type is popup' do
          subject { activity.notify(user, :popup).save }

          it 'creates a popup notification' 

        end

        context 'when type is email' do
          before do
            allow(notifier).to receive(:notification_view_path).and_return(template)
          end

          subject { activity.notify(user, :email).save }

          it 'sends an email to user' 

        end

        context 'when type is invalid' do
          subject { activity.notify(user, :test).save }

          it 'raises an error' 

        end
      end

      context 'when recipient is Course' do
        context 'when type is feed' do
          subject { activity.notify(course, :feed).save }

          it 'creates a feed notification' 

        end

        context 'when type is email' do
          before do
            allow(notifier).to receive(:notification_view_path).and_return(template)
          end

          subject { activity.notify(course, :email).save }

          it 'sends emails to course users' 

        end

        context 'when type is invalid' do
          subject { activity.notify(course, :test).save }

          it 'raises an error' 

        end
      end

      context 'when recipient is invalid' do
        subject { activity.notify(:symbol, :popup).save }

        it 'raises an error' 

      end
    end
  end
end

