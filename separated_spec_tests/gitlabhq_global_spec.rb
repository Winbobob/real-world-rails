require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Global do
  let(:global) { described_class.new(hash) }

  describe '.nodes' do
    it 'returns a hash' 


    context 'when filtering all the entry/node names' do
      it 'contains the expected node names' 

    end
  end

  context 'when configuration is valid' do
    context 'when some entries defined' do
      let(:hash) do
        { before_script: %w(ls pwd),
          image: 'ruby:2.2',
          services: ['postgres:9.1', 'mysql:5.5'],
          variables: { VAR: 'value' },
          after_script: ['make clean'],
          stages: %w(build pages),
          cache: { key: 'k', untracked: true, paths: ['public/'] },
          rspec: { script: %w[rspec ls] },
          spinach: { before_script: [], variables: {}, script: 'spinach' } }
      end

      describe '#compose!' do
        before do
          global.compose!
        end

        it 'creates nodes hash' 


        it 'creates node object for each entry' 


        it 'creates node object using valid class' 


        it 'sets correct description for nodes' 


        describe '#leaf?' do
          it 'is not leaf' 

        end
      end

      context 'when not composed' do
        describe '#before_script_value' do
          it 'returns nil' 

        end

        describe '#leaf?' do
          it 'is leaf' 

        end
      end

      context 'when composed' do
        before do
          global.compose!
        end

        describe '#errors' do
          it 'has no errors' 

        end

        describe '#before_script_value' do
          it 'returns correct script' 

        end

        describe '#image_value' do
          it 'returns valid image' 

        end

        describe '#services_value' do
          it 'returns array of services' 

        end

        describe '#after_script_value' do
          it 'returns after script' 

        end

        describe '#variables_value' do
          it 'returns variables' 

        end

        describe '#stages_value' do
          context 'when stages key defined' do
            it 'returns array of stages' 

          end

          context 'when deprecated types key defined' do
            let(:hash) do
              { types: %w(test deploy),
                rspec: { script: 'rspec' } }
            end

            it 'returns array of types as stages' 

          end
        end

        describe '#cache_value' do
          it 'returns cache configuration' 

        end

        describe '#jobs_value' do
          it 'returns jobs configuration' 

        end
      end
    end

    context 'when most of entires not defined' do
      before do
        global.compose!
      end

      let(:hash) do
        { cache: { key: 'a' }, rspec: { script: %w[ls] } }
      end

      describe '#nodes' do
        it 'instantizes all nodes' 


        it 'contains unspecified nodes' 

      end

      describe '#variables_value' do
        it 'returns default value for variables' 

      end

      describe '#stages_value' do
        it 'returns an array of default stages' 

      end

      describe '#cache_value' do
        it 'returns correct cache definition' 

      end
    end

    ##
    # When nodes are specified but not defined, we assume that
    # configuration is valid, and we asume that entry is simply undefined,
    # despite the fact, that key is present. See issue #18775 for more
    # details.
    #
    context 'when entires specified but not defined' do
      before do
        global.compose!
      end

      let(:hash) do
        { variables: nil, rspec: { script: 'rspec' } }
      end

      describe '#variables_value' do
        it 'undefined entry returns a default value' 

      end
    end
  end

  context 'when configuration is not valid' do
    before do
      global.compose!
    end

    context 'when before script is not an array' do
      let(:hash) do
        { before_script: 'ls' }
      end

      describe '#valid?' do
        it 'is not valid' 

      end

      describe '#errors' do
        it 'reports errors from child nodes' 

      end

      describe '#before_script_value' do
        it 'returns nil' 

      end
    end

    context 'when job does not have commands' do
      let(:hash) do
        { before_script: ['echo 123'], rspec: { stage: 'test' } }
      end

      describe '#errors' do
        it 'reports errors about missing script' 

      end
    end
  end

  context 'when value is not a hash' do
    let(:hash) { [] }

    describe '#valid?' do
      it 'is not valid' 

    end

    describe '#errors' do
      it 'returns error about invalid type' 

    end
  end

  describe '#specified?' do
    it 'is concrete entry that is defined' 

  end

  describe '#[]' do
    before do
      global.compose!
    end

    let(:hash) do
      { cache: { key: 'a' }, rspec: { script: 'ls' } }
    end

    context 'when entry exists' do
      it 'returns correct entry' 

    end

    context 'when entry does not exist' do
      it 'always return unspecified node' 

    end
  end
end

