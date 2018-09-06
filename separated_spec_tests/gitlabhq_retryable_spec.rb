require 'spec_helper'

describe Gitlab::Ci::Status::Build::Retryable do
  let(:status) { double('core status') }
  let(:user) { double('user') }

  subject do
    described_class.new(status)
  end

  describe '#text' do
    it 'does not override status text' 

  end

  describe '#icon' do
    it 'does not override status icon' 

  end

  describe '#label' do
    it 'does not override status label' 

  end

  describe '#group' do
    it 'does not override status group' 

  end

  describe '#status_tooltip' do
    it 'does not override status status_tooltip' 

  end

  describe '#badge_tooltip' do
    let(:user) { create(:user) }
    let(:build) { create(:ci_build) }
    let(:status) { Gitlab::Ci::Status::Core.new(build, user) }

    it 'does return status' 

  end

  describe 'action details' do
    let(:user) { create(:user) }
    let(:build) { create(:ci_build) }
    let(:status) { Gitlab::Ci::Status::Core.new(build, user) }

    describe '#has_action?' do
      context 'when user is allowed to update build' do
        before do
          stub_not_protect_default_branch

          build.project.add_developer(user)
        end

        it { is_expected.to have_action }
      end

      context 'when user is not allowed to update build' do
        it { is_expected.not_to have_action }
      end
    end

    describe '#action_path' do
      it { expect(subject.action_path).to include "#{build.id}/retry" }
    end

    describe '#action_icon' do
      it { expect(subject.action_icon).to eq 'retry' }
    end

    describe '#action_title' do
      it { expect(subject.action_title).to eq 'Retry' }
    end

    describe '#action_button_title' do
      it { expect(subject.action_button_title).to eq 'Retry this job' }
    end
  end

  describe '.matches?' do
    subject { described_class.matches?(build, user) }

    context 'when build is retryable' do
      let(:build) do
        create(:ci_build, :success)
      end

      it 'is a correct match' 

    end

    context 'when build is not retryable' do
      let(:build) { create(:ci_build, :running) }

      it 'does not match' 

    end
  end
end

