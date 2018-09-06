# frozen_string_literal: true

require 'rubocop/ast/sexp'

RSpec.describe RuboCop::Cop::VariableForce::Reference do
  include RuboCop::AST::Sexp

  describe '.new' do
    context 'when non variable reference node is passed' do
      it 'raises error' 

    end
  end
end

