# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserObserver do
  describe 'after_create' do
    let(:list) { create(:mail_marketing_list)}
    before do
      CatarseSettings[:sendgrid_newsletter_list_id] = list.list_id
      expect_any_instance_of(UserObserver).to receive(:after_create).and_call_original
    end

    let(:user) { build(:user, newsletter: false) }

    it 'send new user registration notification' 


    it 'when user in newsletter' 

  end

  context 'before_save' do
    subject { create(:user, twitter: '@should_be_change') }

    its(:twitter) { should == 'should_be_change' }
  end

  context 'after_save' do
    subject { create(:user, newsletter: false, facebook_link: '') }

    describe 'with common integration' do
      context 'and api key in place' do
        before do
          CatarseSettings[:common_api_key] = 'abc'
          expect_any_instance_of(CommonWrapper).to receive(:index_user).at_least(:once)
        end

        it 'should call index on common' 

      end

      context 'without api key' do
        before do
          CatarseSettings[:common_api_key] = nil
          expect_any_instance_of(CommonWrapper).to_not receive(:index_user).with(subject)
        end

        it 'should not update on index' 

      end
    end

    context 'when user not have marketing lists unsynced' do
      let(:list) { create(:mail_marketing_list) }
      before do
        expect(SendgridSyncWorker).not_to receive(:perform_async).with(subject.id)
        subject.mail_marketing_users.create(mail_marketing_list: list, last_sync_at: DateTime.now) 
      end

      it { subject.save! }
    end

    context 'when user has marketing lists unsynced' do
      let(:list) { create(:mail_marketing_list) }
      before do
        expect(SendgridSyncWorker).to receive(:perform_async).with(subject.id)
        subject.mail_marketing_users.create(mail_marketing_list: list)
      end

      it { subject.save! }
    end
  end
end

