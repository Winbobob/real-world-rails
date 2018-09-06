require 'spec_helper'

describe Gitlab::Ci::Status::Build::Pending do
  let(:user) { create(:user) }

  subject do
    described_class.new(double('subject'))
  end

  describe '#illustration' do
    it { expect(subject.illustration).to include(:image, :size, :title, :content) }
  end

  describe '.matches?' do
    subject {described_class.matches?(build, user) }

    context 'when build is pending' do
      let(:build) { create(:ci_build, :pending) }

      it 'is a correct match' 

    end

    context 'when build is not pending' do
      let(:build) { create(:ci_build, :success) }

      it 'does not match' 

    end
  end
end

