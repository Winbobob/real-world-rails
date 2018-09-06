# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::UnlessElse do
  subject(:cop) { described_class.new }

  context 'unless with else' do
    let(:source) do
      <<-RUBY.strip_indent
        unless x # negative 1
          a = 1 # negative 2
        else # positive 1
          a = 0 # positive 2
        end
      RUBY
    end

    it 'registers an offense' 


    it 'auto-corrects' 

  end

  context 'unless with nested if-else' do
    let(:source) do
      <<-RUBY.strip_indent
        unless(x)
          if(y == 0)
            a = 0
          elsif(z == 0)
            a = 1
          else
            a = 2
          end
        else
          a = 3
        end
      RUBY
    end

    it 'registers an offense' 


    it 'auto-corrects' 

  end

  context 'unless without else' do
    it 'does not register an offense' 

  end
end

