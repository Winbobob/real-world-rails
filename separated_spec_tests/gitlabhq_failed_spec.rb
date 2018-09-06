require 'spec_helper'

describe Gitlab::Ci::Status::Build::Failed do
  let(:build) { create(:ci_build, :script_failure) }
  let(:status) { double('core status') }
  let(:user) { double('user') }

  subject { described_class.new(status) }

  describe '#text' do
    it 'does not override status text' 

  end

  describe '#icon' do
    it 'does not override status icon' 

  end

  describe '#group' do
    it 'does not override status group' 

  end

  describe '#favicon' do
    it 'does not override status label' 

  end

  describe '#label' do
    it 'does not override label' 

  end

  describe '#badge_tooltip' do
    let(:user) { create(:user) }
    let(:status) { Gitlab::Ci::Status::Failed.new(build, user) }

    it 'does override badge_tooltip' 

  end

  describe '#status_tooltip' do
    let(:user) { create(:user) }
    let(:status) { Gitlab::Ci::Status::Failed.new(build, user) }

    it 'does override status_tooltip' 

  end

  describe '.matches?' do
    context 'with a failed build' do
      it 'returns true' 

    end

    context 'with any other type of build' do
      let(:build) { create(:ci_build, :success) }

      it 'returns false' 

    end
  end
end

