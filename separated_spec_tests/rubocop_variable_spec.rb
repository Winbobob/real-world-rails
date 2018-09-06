# frozen_string_literal: true

require 'rubocop/ast/sexp'

RSpec.describe RuboCop::Cop::VariableForce::Variable do
  include RuboCop::AST::Sexp

  describe '.new' do
    context 'when non variable declaration node is passed' do
      it 'raises error' 

    end
  end

  describe '#referenced?' do
    subject { variable.referenced? }

    let(:name) { :foo }
    let(:declaration_node) { s(:arg, name) }
    let(:scope) { double('scope').as_null_object }
    let(:variable) { described_class.new(name, declaration_node, scope) }

    context 'when the variable is not assigned' do
      it { is_expected.to be_falsey }

      context 'and the variable is referenced' do
        before do
          variable.reference!(s(:lvar, name))
        end

        it { is_expected.to be_truthy }
      end
    end

    context 'when the variable has an assignment' do
      before do
        variable.assign(s(:lvasgn, name))
      end

      context 'and the variable is not yet referenced' do
        it { is_expected.to be_falsey }
      end

      context 'and the variable is referenced' do
        before do
          variable.reference!(s(:lvar, name))
        end

        it { is_expected.to be_truthy }
      end
    end
  end
end

