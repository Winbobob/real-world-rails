# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::ImplicitRuntimeError do
  subject(:cop) { described_class.new }

  %w[raise fail].each do |method|
    it "registers an offense for #{method} 'message'" 


    it "registers an offense for #{method} with a multiline string" 


    it "doesn't register an offense for #{method} StandardError, 'message'" 


    it "doesn't register an offense for #{method} with no arguments" 

  end
end

