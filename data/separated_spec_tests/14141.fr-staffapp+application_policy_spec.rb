require 'rails_helper'

RSpec.describe ApplicationPolicy, type: :policy do
  subject(:policy) { described_class.new(user, application) }

  let(:office) { build_stubbed(:office) }
  let(:application) { build_stubbed(:application, office: office) }

  context 'for staff' do
    let(:user) { build_stubbed(:user) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:new) }

    context 'when the application belongs to their office' do
      let(:user) { build_stubbed(:user, office: office) }

      it { is_expected.to permit_action(:create) }
      it { is_expected.to permit_action(:show) }
      it { is_expected.to permit_action(:update) }
    end

    context 'when the application does not belong to their office' do
      it { is_expected.not_to permit_action(:create) }
      it { is_expected.not_to permit_action(:show) }
      it { is_expected.not_to permit_action(:update) }
    end
  end

  context 'for a manager' do
    let(:user) { build_stubbed(:manager) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:new) }

    context 'when the application belongs to their office' do
      let(:user) { build_stubbed(:manager, office: office) }

      it { is_expected.to permit_action(:create) }
      it { is_expected.to permit_action(:show) }
      it { is_expected.to permit_action(:update) }
    end

    context 'when the application does not belong to their office' do
      it { is_expected.not_to permit_action(:create) }
      it { is_expected.not_to permit_action(:show) }
      it { is_expected.not_to permit_action(:update) }
    end
  end

  context 'for an admin' do
    let(:user) { build_stubbed(:admin_user) }

    it { is_expected.not_to permit_action(:new) }
    it { is_expected.not_to permit_action(:create) }
    it { is_expected.not_to permit_action(:index) }
    it { is_expected.not_to permit_action(:show) }
    it { is_expected.not_to permit_action(:update) }
  end

  context 'for an mi' do
    let(:user) { build_stubbed(:mi) }

    it { is_expected.not_to permit_action(:new) }
    it { is_expected.not_to permit_action(:create) }
    it { is_expected.not_to permit_action(:index) }
    it { is_expected.not_to permit_action(:show) }
    it { is_expected.not_to permit_action(:update) }
  end

  describe ApplicationPolicy::Scope do
    describe '#resolve' do
      subject { described_class.new(user, Application).resolve }

      let(:office) { create :office }
      let(:application1) { create :application }
      let!(:application2) { create :application, office: office }

      context 'for a regular user' do
        let(:user) { create(:user, office: office) }

        it 'returns only applications which belong to the same office' 

      end

      context 'for a manager' do
        let(:user) { create(:manager, office: office) }

        it 'returns only applications which belong to the same office' 

      end

      context 'for an admin' do
        let(:user) { create(:admin_user) }

        it { is_expected.to be_empty }
      end

      context 'for an mi' do
        let(:user) { create(:mi) }

        it { is_expected.to be_empty }
      end
    end
  end
end

