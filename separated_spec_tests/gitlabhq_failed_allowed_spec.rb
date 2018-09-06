require 'spec_helper'

describe Gitlab::Ci::Status::Build::FailedAllowed do
  let(:status) { double('core status') }
  let(:user) { double('user') }
  let(:build) { create(:ci_build, :failed, :allowed_to_fail) }

  subject do
    described_class.new(status)
  end

  describe '#text' do
    it 'does not override status text' 

  end

  describe '#icon' do
    it 'returns a warning icon' 

  end

  describe '#label' do
    it 'returns information about failed but allowed to fail status' 

  end

  describe '#group' do
    it 'returns status failed with warnings status group' 

  end

  describe 'action details' do
    describe '#has_action?' do
      it 'does not decorate action details' 

    end

    describe '#action_path' do
      it 'does not decorate action path' 

    end

    describe '#action_icon' do
      it 'does not decorate action icon' 

    end

    describe '#action_title' do
      it 'does not decorate action title' 

    end
  end

  describe '#badge_tooltip' do
    let(:user) { create(:user) }
    let(:failed_status) { Gitlab::Ci::Status::Failed.new(build, user) }
    let(:build_status) { Gitlab::Ci::Status::Build::Failed.new(failed_status) }
    let(:status) { described_class.new(build_status) }

    it 'does override badge_tooltip' 

  end

  describe '#status_tooltip' do
    let(:user) { create(:user) }
    let(:failed_status) { Gitlab::Ci::Status::Failed.new(build, user) }
    let(:build_status) { Gitlab::Ci::Status::Build::Failed.new(failed_status) }
    let(:status) { described_class.new(build_status) }

    it 'does override status_tooltip' 

  end

  describe '.matches?' do
    subject { described_class.matches?(build, user) }

    context 'when build is failed' do
      context 'when build is allowed to fail' do
        let(:build) { create(:ci_build, :failed, :allowed_to_fail) }

        it 'is a correct match' 

      end

      context 'when build is not allowed to fail' do
        let(:build) { create(:ci_build, :failed) }

        it 'is not a correct match' 

      end
    end

    context 'when build did not fail' do
      context 'when build is allowed to fail' do
        let(:build) { create(:ci_build, :success, :allowed_to_fail) }

        it 'is not a correct match' 

      end

      context 'when build is not allowed to fail' do
        let(:build) { create(:ci_build, :success) }

        it 'is not a correct match' 

      end
    end
  end
end

