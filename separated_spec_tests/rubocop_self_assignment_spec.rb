# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::SelfAssignment do
  subject(:cop) { described_class.new }

  %i[+ - * ** / | & || &&].product(['x', '@x', '@@x']).each do |op, var|
    it "registers an offense for non-shorthand assignment #{op} and #{var}" 


    it "accepts shorthand assignment for #{op} and #{var}" 


    it "auto-corrects a non-shorthand assignment #{op} and #{var}" 

  end
end

