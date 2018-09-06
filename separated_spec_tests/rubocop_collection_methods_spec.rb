# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::CollectionMethods, :config do
  cop_config = {
    'PreferredMethods' => {
      'collect' => 'map',
      'inject' => 'reduce',
      'detect' => 'find',
      'find_all' => 'select'
    }
  }

  subject(:cop) { described_class.new(config) }

  let(:cop_config) { cop_config }

  cop_config['PreferredMethods'].each do |method, preferred_method|
    it "registers an offense for #{method} with block" 


    it "registers an offense for #{method} with proc param" 


    it "accepts #{method} with more than 1 param" 


    it "accepts #{method} without a block" 


    it 'auto-corrects to preferred method' 

  end
end

