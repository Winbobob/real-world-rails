require 'fast_spec_helper'
require_dependency 'active_model'

describe Gitlab::Ci::Config::Entry::Policy do
  let(:entry) { described_class.new(config) }

  context 'when using simplified policy' do
    describe 'validations' do
      context 'when entry config value is valid' do
        context 'when config is a branch or tag name' do
          let(:config) { %w[master feature/branch] }

          describe '#valid?' do
            it 'is valid' 

          end

          describe '#value' do
            it 'returns refs hash' 

          end
        end

        context 'when config is a regexp' do
          let(:config) { ['/^issue-.*$/'] }

          describe '#valid?' do
            it 'is valid' 

          end
        end

        context 'when config is a special keyword' do
          let(:config) { %w[tags triggers branches] }

          describe '#valid?' do
            it 'is valid' 

          end
        end
      end

      context 'when entry value is not valid' do
        let(:config) { [1] }

        describe '#errors' do
          it 'saves errors' 

        end
      end
    end
  end

  context 'when using complex policy' do
    context 'when specifiying refs policy' do
      let(:config) { { refs: ['master'] } }

      it 'is a correct configuraton' 

    end

    context 'when specifying kubernetes policy' do
      let(:config) { { kubernetes: 'active' } }

      it 'is a correct configuraton' 

    end

    context 'when specifying invalid kubernetes policy' do
      let(:config) { { kubernetes: 'something' } }

      it 'reports an error about invalid policy' 

    end

    context 'when specifying valid variables expressions policy' do
      let(:config) { { variables: ['$VAR == null'] } }

      it 'is a correct configuraton' 

    end

    context 'when specifying variables expressions in invalid format' do
      let(:config) { { variables: '$MY_VAR' } }

      it 'reports an error about invalid format' 

    end

    context 'when specifying invalid variables expressions statement' do
      let(:config) { { variables: ['$MY_VAR =='] } }

      it 'reports an error about invalid statement' 

    end

    context 'when specifying invalid variables expressions token' do
      let(:config) { { variables: ['$MY_VAR == 123'] } }

      it 'reports an error about invalid expression' 

    end

    context 'when using invalid variables expressions regexp' do
      let(:config) { { variables: ['$MY_VAR =~ /some ( thing/'] } }

      it 'reports an error about invalid expression' 

    end

    context 'when specifying a valid changes policy' do
      let(:config) { { changes: %w[some/* paths/**/*.rb] } }

      it 'is a correct configuraton' 

    end

    context 'when changes policy is invalid' do
      let(:config) { { changes: [1, 2] } }

      it 'returns errors' 

    end

    context 'when specifying unknown policy' do
      let(:config) { { refs: ['master'], invalid: :something } }

      it 'returns error about invalid key' 

    end

    context 'when policy is empty' do
      let(:config) { {} }

      it 'is not a valid configuration' 

    end
  end

  context 'when policy strategy does not match' do
    let(:config) { 'string strategy' }

    it 'returns information about errors' 

  end

  describe '.default' do
    it 'does not have a default value' 

  end
end

