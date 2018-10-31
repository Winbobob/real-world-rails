# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Metrics::PerceivedComplexity, :config do
  subject(:cop) { described_class.new(config) }

  context 'when Max is 1' do
    let(:cop_config) { { 'Max' => 1 } }

    it 'accepts a method with no decision points' 


    it 'accepts an empty method' 


    it 'accepts an empty `define_method`' 


    it 'accepts complex code outside of methods' 


    it 'registers an offense for an if modifier' 


    it 'registers an offense for an unless modifier' 


    it 'registers an offense for elsif and else blocks' 


    it 'registers an offense for a ternary operator' 


    it 'registers an offense for a while block' 


    it 'registers an offense for an until block' 


    it 'registers an offense for a for block' 


    it 'registers an offense for a rescue block' 


    it 'registers an offense for a case/when block' 


    it 'registers an offense for a case/when block without an expression ' \
       'after case' do
      inspect_source(<<-RUBY.strip_indent)
        def method_name
          case
          when value == 1
            call_foo
          when value == 2
            call_bar
          end
        end
      RUBY
      # Here, the `case` node doesn't count, but each when scores one
      # complexity point.
      expect(cop.messages)
        .to eq(['Perceived complexity for method_name is too high. [3/1]'])
    end

    it 'registers an offense for &&' 


    it 'registers an offense for and' 


    it 'registers an offense for ||' 


    it 'registers an offense for or' 


    it 'deals with nested if blocks containing && and ||' 


    it 'counts only a single method' 


    it 'registers an offense for a `define_method`' 

  end

  context 'when Max is 2' do
    let(:cop_config) { { 'Max' => 2 } }

    it 'counts stupid nested if and else blocks' 

  end
end

