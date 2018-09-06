require 'rails_helper'

RSpec.describe BootstrapTimelineService, type: :service do
  subject { described_class.new }

  describe '#call' do
    let(:source_account) { Fabricate(:account) }

    context 'when setting is empty' do
      let!(:admin) { Fabricate(:user, admin: true) }

      before do
        Setting.bootstrap_timeline_accounts = nil
        subject.call(source_account)
      end

      it 'follows admin accounts from account' 

    end

    context 'when setting is set' do
      let!(:alice) { Fabricate(:account, username: 'alice') }
      let!(:bob)   { Fabricate(:account, username: 'bob') }

      before do
        Setting.bootstrap_timeline_accounts = 'alice, bob'
        subject.call(source_account)
      end

      it 'follows found accounts from account' 

    end
  end
end

