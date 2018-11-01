# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Registry do
  subject(:registry) { described_class.new(cops) }

  let(:cops) do
    stub_const('RuboCop::Cop::Test', Module.new)
    stub_const('RuboCop::Cop::RSpec', Module.new)

    module RuboCop
      module Cop
        module Test
          # Create another cop with a different namespace
          class IndentArray < Cop
          end
        end

        module RSpec
          # Define a dummy rspec cop which has special namespace inflection
          class Foo < Cop
          end
        end
      end
    end

    [
      RuboCop::Cop::Lint::BooleanSymbol,
      RuboCop::Cop::Lint::DuplicateMethods,
      RuboCop::Cop::Layout::IndentArray,
      RuboCop::Cop::Metrics::MethodLength,
      RuboCop::Cop::RSpec::Foo,
      RuboCop::Cop::Test::IndentArray
    ]
  end

  # `RuboCop::Cop::Cop` mutates its `registry` when inherited from.
  # This can introduce nondeterministic failures in other parts of the
  # specs if this mutation occurs before code that depends on this global cop
  # store. The workaround is to replace the global cop store with a temporary
  # store during these tests
  around do |test|
    registry        = RuboCop::Cop::Cop.registry
    temporary_store = described_class.new(registry.cops)
    RuboCop::Cop::Cop.instance_variable_set(:@registry, temporary_store)

    test.run

    RuboCop::Cop::Cop.instance_variable_set(:@registry, registry)
  end

  it 'exposes cop departments' 


  it 'can filter down to one type' 


  it 'can filter down to all but one type' 


  context '#contains_cop_matching?' do
    it 'can find cops matching a given name' 


    it 'returns false for cops not included in the store' 

  end

  context '#qualified_cop_name' do
    let(:origin) { '/app/.rubocop.yml' }

    it 'gives back already properly qualified names' 


    it 'qualifies names without a namespace' 


    it 'qualifies names with the correct namespace' 


    it 'emits a warning when namespace is incorrect' 


    it 'raises an error when a cop name is ambiguous' 


    it 'returns the provided name if no namespace is found' 

  end

  it 'exposes a mapping of cop names to cop classes' 


  context '#cops' do
    it 'exposes a list of cops' 

  end

  it 'exposes the number of stored cops' 


  context '#enabled' do
    let(:config) do
      RuboCop::Config.new(
        'Test/IndentArray' => { 'Enabled' => false },
        'RSpec/Foo' => { 'Safe' => false }
      )
    end

    it 'selects cops which are enabled in the config' 


    it 'overrides config if :only includes the cop' 


    it 'selects only safe cops if :safe passed' 

  end

  it 'exposes a list of cop names' 

end

