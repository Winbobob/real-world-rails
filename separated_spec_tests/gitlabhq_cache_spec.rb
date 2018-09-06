require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Cache do
  subject(:entry) { described_class.new(config) }

  describe 'validations' do
    before do
      entry.compose!
    end

    context 'when entry config value is correct' do
      let(:policy) { nil }

      let(:config) do
        { key: 'some key',
          untracked: true,
          paths: ['some/path/'],
          policy: policy }
      end

      describe '#value' do
        it 'returns hash value' 

      end

      describe '#valid?' do
        it { is_expected.to be_valid }
      end

      context 'policy is pull-push' do
        let(:policy) { 'pull-push' }

        it { is_expected.to be_valid }
        it { expect(entry.value).to include(policy: 'pull-push') }
      end

      context 'policy is push' do
        let(:policy) { 'push' }

        it { is_expected.to be_valid }
        it { expect(entry.value).to include(policy: 'push') }
      end

      context 'policy is pull' do
        let(:policy) { 'pull' }

        it { is_expected.to be_valid }
        it { expect(entry.value).to include(policy: 'pull') }
      end

      context 'when key is missing' do
        let(:config) do
          { untracked: true,
            paths: ['some/path/'] }
        end

        describe '#value' do
          it 'sets key with the default' 

        end
      end
    end

    context 'when entry value is not correct' do
      describe '#errors' do
        subject { entry.errors }
        context 'when is not a hash' do
          let(:config) { 'ls' }

          it 'reports errors with config value' 

        end

        context 'when policy is unknown' do
          let(:config) { { policy: "unknown" } }

          it 'reports error' 

        end

        context 'when descendants are invalid' do
          let(:config) { { key: 1 } }

          it 'reports error with descendants' 

        end

        context 'when there is an unknown key present' do
          let(:config) { { invalid: true } }

          it 'reports error with descendants' 

        end
      end
    end
  end
end

