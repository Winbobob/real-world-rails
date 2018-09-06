# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UnneededRequireStatement, :config do
  subject(:cop) { described_class.new(config) }

  context 'target ruby version < 2.2', :ruby21 do
    it "does not registers an offense when using `require 'enumerator'`" 

  end

  context 'target ruby version >= 2.2', :ruby22 do
    it "registers an offense when using `require 'enumerator'`" 


    it 'autocorrects remove unnecessary require statement' 

  end
end

