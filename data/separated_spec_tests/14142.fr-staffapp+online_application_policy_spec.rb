require 'rails_helper'

RSpec.describe OnlineApplicationPolicy, type: :policy do
  subject(:policy) { described_class.new(user, online_application) }

  let(:online_application) { build_stubbed(:online_application) }

  context 'for staff' do
    let(:user) { build_stubbed(:staff) }

    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:complete) }
  end

  context 'for manager' do
    let(:user) { build_stubbed(:manager) }

    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:complete) }
  end

  context 'for admin' do
    let(:user) { build_stubbed(:admin) }

    it { is_expected.not_to permit_action(:edit) }
    it { is_expected.not_to permit_action(:update) }
    it { is_expected.not_to permit_action(:show) }
    it { is_expected.not_to permit_action(:complete) }
  end
end

