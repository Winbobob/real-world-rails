# frozen_string_literal: true

RSpec.describe RuboCop::Cop::VariableForce::VariableTable do
  include RuboCop::AST::Sexp

  subject(:variable_table) { described_class.new }

  describe '#push_scope' do
    it 'returns pushed scope object' 

  end

  describe '#pop_scope' do
    before do
      node = s(:def)
      variable_table.push_scope(node)
    end

    it 'returns popped scope object' 

  end

  describe '#current_scope_level' do
    before do
      variable_table.push_scope(s(:def))
    end

    it 'increases by pushing scope' 


    it 'decreases by popping scope' 

  end

  describe '#declare_variable' do
    before do
      2.times do
        node = s(:def)
        variable_table.push_scope(node)
      end
    end

    it 'adds variable to current scope with its name as key' 


    it 'returns the added variable' 

  end

  describe '#find_variable' do
    before do
      variable_table.push_scope(s(:class))
      variable_table.declare_variable(:baz, s(:lvasgn, :baz))

      variable_table.push_scope(s(:def))
      variable_table.declare_variable(:bar, s(:lvasgn, :bar))
    end

    context 'when current scope is block' do
      before do
        variable_table.push_scope(s(:block))
      end

      context 'when a variable with the target name exists ' \
              'in current scope' do
        before do
          variable_table.declare_variable(:foo, s(:lvasgn, :foo))
        end

        context 'and does not exist in outer scope' do
          it 'returns the current scope variable' 

        end

        context 'and also exists in outer scope' do
          before do
            variable_table.declare_variable(:bar, s(:lvasgn, :bar))
          end

          it 'returns the current scope variable' 

        end
      end

      context 'when a variable with the target name does not exist ' \
              'in current scope' do
        context 'but exists in the direct outer scope' do
          it 'returns the direct outer scope variable' 

        end

        context 'but exists in a indirect outer scope' do
          context 'when the direct outer scope is block' do
            before do
              variable_table.pop_scope
              variable_table.pop_scope

              variable_table.push_scope(s(:block))
              variable_table.push_scope(s(:block))
            end

            it 'returns the indirect outer scope variable' 

          end

          context 'when the direct outer scope is not block' do
            it 'returns nil' 

          end
        end

        context 'and does not exist in all outer scopes' do
          it 'returns nil' 

        end
      end
    end

    context 'when current scope is not block' do
      before do
        variable_table.push_scope(s(:def))
      end

      context 'when a variable with the target name exists ' \
              'in current scope' do
        before do
          variable_table.declare_variable(:foo, s(:lvasgn, :foo))
        end

        context 'and does not exist in outer scope' do
          it 'returns the current scope variable' 

        end

        context 'and also exists in outer scope' do
          it 'returns the current scope variable' 

        end
      end

      context 'when a variable with the target name does not exist ' \
              'in current scope' do
        context 'but exists in the direct outer scope' do
          it 'returns nil' 

        end

        context 'and does not exist in all outer scopes' do
          it 'returns nil' 

        end
      end
    end
  end

  describe '#find_variable with an empty scope stack' do
    it 'returns nil' 

  end

  describe '#accessible_variables' do
    let(:accessible_variable_names) do
      variable_table.accessible_variables.map(&:name)
    end

    before do
      variable_table.push_scope(s(:class))
    end

    context 'when there are no variables' do
      it 'returns empty array' 

    end

    context 'when the current scope has some variables' do
      before do
        variable_table.declare_variable(:foo, s(:lvasgn, :foo))
        variable_table.declare_variable(:bar, s(:lvasgn, :bar))
      end

      it 'returns all the variables' 

    end

    context 'when the direct outer scope has some variables' do
      before do
        variable_table.declare_variable(:foo, s(:lvasgn, :foo))
      end

      context 'and the current scope is block' do
        before do
          variable_table.push_scope(s(:block))
          variable_table.declare_variable(:bar, s(:lvasgn, :bar))
          variable_table.declare_variable(:baz, s(:lvasgn, :baz))
        end

        it 'returns the current and direct outer scope variables' 

      end

      context 'and the current scope is not block' do
        before do
          variable_table.push_scope(s(:def))
          variable_table.declare_variable(:bar, s(:lvasgn, :bar))
          variable_table.declare_variable(:baz, s(:lvasgn, :baz))
        end

        it 'returns only the current scope variables' 

      end
    end
  end
end

