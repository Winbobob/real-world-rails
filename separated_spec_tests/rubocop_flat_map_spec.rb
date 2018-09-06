# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::FlatMap, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'map_and_collect' do |method, flatten|
    it "registers an offense when calling #{method}...#{flatten}(1)" 


    it "does not register an offense when calling #{method}...#{flatten} " \
      'with a number greater than 1' do
      inspect_source("[1, 2, 3, 4].#{method} { |e| [e, e] }.#{flatten}(3)")

      expect(cop.messages.empty?).to be(true)
    end

    it "does not register an offense when calling #{method}!...#{flatten}" 


    it "corrects #{method}..#{flatten}(1) to flat_map" 

  end

  describe 'configured to only warn when flattening one level' do
    let(:config) do
      RuboCop::Config.new('Performance/FlatMap' => {
                            'Enabled' => true,
                            'EnabledForFlattenWithoutParams' => false
                          })
    end

    shared_examples 'flatten_with_params_disabled' do |method, flatten|
      it "does not register an offense when calling #{method}...#{flatten}" 

    end

    it_behaves_like('map_and_collect', 'map', 'flatten')
    it_behaves_like('map_and_collect', 'map', 'flatten!')
    it_behaves_like('map_and_collect', 'collect', 'flatten')
    it_behaves_like('map_and_collect', 'collect', 'flatten!')

    it_behaves_like('flatten_with_params_disabled', 'map', 'flatten')
    it_behaves_like('flatten_with_params_disabled', 'collect', 'flatten')
    it_behaves_like('flatten_with_params_disabled', 'map', 'flatten!')
    it_behaves_like('flatten_with_params_disabled', 'collect', 'flatten!')
  end

  describe 'configured to warn when flatten is not called with parameters' do
    let(:config) do
      RuboCop::Config.new('Performance/FlatMap' => {
                            'Enabled' => true,
                            'EnabledForFlattenWithoutParams' => true
                          })
    end

    shared_examples 'flatten_with_params_enabled' do |method, flatten|
      it "registers an offense when calling #{method}...#{flatten}" 


      it "will not correct #{method}..#{flatten} to flat_map" 

    end

    it_behaves_like('map_and_collect', 'map', 'flatten')
    it_behaves_like('map_and_collect', 'map', 'flatten!')
    it_behaves_like('map_and_collect', 'collect', 'flatten')
    it_behaves_like('map_and_collect', 'collect', 'flatten!')

    it_behaves_like('flatten_with_params_enabled', 'map', 'flatten')
    it_behaves_like('flatten_with_params_enabled', 'collect', 'flatten')
    it_behaves_like('flatten_with_params_enabled', 'map', 'flatten!')
    it_behaves_like('flatten_with_params_enabled', 'collect', 'flatten!')
  end
end

