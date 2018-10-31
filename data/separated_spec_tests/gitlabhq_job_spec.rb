require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Job do
  let(:entry) { described_class.new(config, name: :rspec) }

  describe '.nodes' do
    context 'when filtering all the entry/node names' do
      subject { described_class.nodes.keys }

      let(:result) do
        %i[before_script script stage type after_script cache
           image services only except variables artifacts
           environment coverage]
      end

      it { is_expected.to match_array result }
    end
  end

  describe 'validations' do
    before do
      entry.compose!
    end

    context 'when entry config value is correct' do
      let(:config) { { script: 'rspec' } }

      describe '#valid?' do
        it 'is valid' 

      end

      context 'when job name is empty' do
        let(:entry) { described_class.new(config, name: ''.to_sym) }

        it 'reports error' 

      end
    end

    context 'when entry value is not correct' do
      context 'incorrect config value type' do
        let(:config) { ['incorrect'] }

        describe '#errors' do
          it 'reports error about a config type' 

        end
      end

      context 'when config is empty' do
        let(:config) { {} }

        describe '#valid' do
          it 'is invalid' 

        end
      end

      context 'when unknown keys detected' do
        let(:config) { { unknown: true } }

        describe '#valid' do
          it 'is not valid' 

        end
      end

      context 'when script is not provided' do
        let(:config) { { stage: 'test' } }

        it 'returns error about missing script entry' 

      end

      context 'when retry value is not correct' do
        context 'when it is not a numeric value' do
          let(:config) { { retry: true } }

          it 'returns error about invalid type' 

        end

        context 'when it is lower than zero' do
          let(:config) { { retry: -1 } }

          it 'returns error about value too low' 

        end

        context 'when it is not an integer' do
          let(:config) { { retry: 1.5 } }

          it 'returns error about wrong value' 

        end

        context 'when the value is too high' do
          let(:config) { { retry: 10 } }

          it 'returns error about value too high' 

        end
      end
    end
  end

  describe '#relevant?' do
    it 'is a relevant entry' 

  end

  describe '#compose!' do
    let(:unspecified) { double('unspecified', 'specified?' => false) }

    let(:specified) do
      double('specified', 'specified?' => true, value: 'specified')
    end

    let(:deps) { double('deps', '[]' => unspecified) }

    context 'when job config overrides global config' do
      before do
        entry.compose!(deps)
      end

      let(:config) do
        { script: 'rspec', image: 'some_image', cache: { key: 'test' } }
      end

      it 'overrides global config' 

    end

    context 'when job config does not override global config' do
      before do
        allow(deps).to receive('[]').with(:image).and_return(specified)
        entry.compose!(deps)
      end

      let(:config) { { script: 'ls', cache: { key: 'test' } } }

      it 'uses config from global entry' 

    end
  end

  context 'when composed' do
    before do
      entry.compose!
    end

    describe '#value' do
      before do
        entry.compose!
      end

      context 'when entry is correct' do
        let(:config) do
          { before_script: %w[ls pwd],
            script: 'rspec',
            after_script: %w[cleanup] }
        end

        it 'returns correct value' 

      end
    end

    describe '#commands' do
      let(:config) do
        { before_script: %w[ls pwd], script: 'rspec' }
      end

      it 'returns a string of commands concatenated with new line character' 

    end
  end

  describe '#manual_action?' do
    context 'when job is a manual action' do
      let(:config) { { script: 'deploy', when: 'manual' } }

      it 'is a manual action' 

    end

    context 'when job is not a manual action' do
      let(:config) { { script: 'deploy' } }

      it 'is not a manual action' 

    end
  end

  describe '#ignored?' do
    context 'when job is a manual action' do
      context 'when it is not specified if job is allowed to fail' do
        let(:config) do
          { script: 'deploy', when: 'manual' }
        end

        it 'is an ignored job' 

      end

      context 'when job is allowed to fail' do
        let(:config) do
          { script: 'deploy', when: 'manual', allow_failure: true }
        end

        it 'is an ignored job' 

      end

      context 'when job is not allowed to fail' do
        let(:config) do
          { script: 'deploy', when: 'manual', allow_failure: false }
        end

        it 'is not an ignored job' 

      end
    end

    context 'when job is not a manual action' do
      context 'when it is not specified if job is allowed to fail' do
        let(:config) { { script: 'deploy' } }

        it 'is not an ignored job' 

      end

      context 'when job is allowed to fail' do
        let(:config) { { script: 'deploy', allow_failure: true } }

        it 'is an ignored job' 

      end

      context 'when job is not allowed to fail' do
        let(:config) { { script: 'deploy', allow_failure: false } }

        it 'is not an ignored job' 

      end
    end
  end
end

