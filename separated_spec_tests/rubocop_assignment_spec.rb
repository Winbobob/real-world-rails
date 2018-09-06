# frozen_string_literal: true

RSpec.describe RuboCop::Cop::VariableForce::Assignment do
  include RuboCop::AST::Sexp

  let(:ast) do
    RuboCop::ProcessedSource.new(source, ruby_version).ast
  end

  let(:source) do
    <<-RUBY
      class SomeClass
        def some_method(flag)
          puts 'Hello World!'

          if flag > 0
            foo = 1
          end
        end
      end
    RUBY
  end

  let(:def_node) { ast.each_node.find(&:def_type?) }

  let(:lvasgn_node) { ast.each_node.find(&:lvasgn_type?) }

  let(:name) { lvasgn_node.children.first }
  let(:scope) { RuboCop::Cop::VariableForce::Scope.new(def_node) }
  let(:variable) do
    RuboCop::Cop::VariableForce::Variable.new(name, lvasgn_node, scope)
  end
  let(:assignment) { described_class.new(lvasgn_node, variable) }

  describe '.new' do
    let(:variable) { double('variable') }

    context 'when an assignment node is passed' do
      it 'does not raise error' 

    end

    context 'when an argument declaration node is passed' do
      it 'raises error' 

    end

    context 'when any other type node is passed' do
      it 'raises error' 

    end
  end

  describe '#name' do
    it 'returns the variable name' 

  end

  describe '#meta_assignment_node' do
    context 'when it is += operator assignment' do
      let(:source) do
        <<-RUBY
          def some_method
            foo += 1
          end
        RUBY
      end

      it 'returns op_asgn node' 

    end

    context 'when it is ||= operator assignment' do
      let(:source) do
        <<-RUBY
          def some_method
            foo ||= 1
          end
        RUBY
      end

      it 'returns or_asgn node' 

    end

    context 'when it is &&= operator assignment' do
      let(:source) do
        <<-RUBY
          def some_method
            foo &&= 1
          end
        RUBY
      end

      it 'returns and_asgn node' 

    end

    context 'when it is multiple assignment' do
      let(:source) do
        <<-RUBY
          def some_method
            foo, bar = [1, 2]
          end
        RUBY
      end

      it 'returns masgn node' 

    end
  end

  describe '#operator' do
    context 'when it is normal assignment' do
      let(:source) do
        <<-RUBY
          def some_method
            foo = 1
          end
        RUBY
      end

      it 'returns =' 

    end

    context 'when it is += operator assignment' do
      let(:source) do
        <<-RUBY
          def some_method
            foo += 1
          end
        RUBY
      end

      it 'returns +=' 

    end

    context 'when it is ||= operator assignment' do
      let(:source) do
        <<-RUBY
          def some_method
            foo ||= 1
          end
        RUBY
      end

      it 'returns ||=' 

    end

    context 'when it is &&= operator assignment' do
      let(:source) do
        <<-RUBY
          def some_method
            foo &&= 1
          end
        RUBY
      end

      it 'returns &&=' 

    end

    context 'when it is multiple assignment' do
      let(:source) do
        <<-RUBY
          def some_method
            foo, bar = [1, 2]
          end
        RUBY
      end

      it 'returns =' 

    end
  end
end

