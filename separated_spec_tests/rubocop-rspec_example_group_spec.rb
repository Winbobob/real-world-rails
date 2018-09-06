# frozen_string_literal: true

RSpec.describe RuboCop::RSpec::ExampleGroup do
  include RuboCop::AST::Sexp

  subject(:group) { described_class.new(parse_source(source).ast) }

  let(:source) do
    <<-RUBY
      RSpec.describe Foo do
        it 'does x' 


        it 'does y' 


        context 'nested' do
          it 'does z' 

        end
      end
    RUBY
  end

  let(:example_nodes) do
    [
      s(:block,
        s(:send, nil, :it,
          s(:str, 'does x')),
        s(:args), s(:send, nil, :x)),
      s(:block,
        s(:send, nil, :it,
          s(:str, 'does y')),
        s(:args), s(:send, nil, :y))
    ].map { |node| RuboCop::RSpec::Example.new(node) }
  end

  it 'exposes examples in scope' 

end

