# frozen_string_literal: true

require 'rails_helper'
require 'support/vcr'

describe ShareNotifyJob do
  let(:user) { create(:jill) }
  let(:work) { create(:share_file, depositor: user.login) }

  before { allow_any_instance_of(GenericWork).to receive(:share_notified?).and_return(false) }

  context 'with a shareable file' do
    before do
      allow_any_instance_of(GenericWorkToShareJSONService)
        .to receive(:email_for_name)
        .and_return('kermit@muppets.org')
      WebMock.enable!
    end

    after { WebMock.disable! }

    describe 'a successful outcome' do
      context 'when it has not been sent to SHARE Notify' do
        before { allow(ShareNotify).to receive(:config) { { 'token' => 'SECRET_TOKEN' } } }

        it 'sends a notification' 

      end

      context 'when it has already been sent to SHARE Notify' do
        before { allow_any_instance_of(GenericWork).to receive(:share_notified?).and_return(true) }
        subject { described_class.perform_now(work) }

        it { is_expected.to be_nil }
      end
    end

    describe 'an unsuccessful outcome' do
      let(:error_message) do
        "Posting file #{work.id} to SHARE Notify failed with 400. Response was {\"detail\"=>\"Invalid token.\"}"
      end

      before do
        allow(ShareNotify).to receive(:config) { { 'token' => 'BAD_TOKEN' } }
        allow_any_instance_of(ShareNotify::SearchResponse).to receive(:status).and_return(400)
      end

      it 'logs the error' 

    end
  end

  context 'with a file that cannot be shared' do
    subject { described_class.perform_now(work) }

    let(:work) { create(:private_work) }

    it { is_expected.to be_nil }
  end
end

