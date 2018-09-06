# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::EmptyLineBetweenDefs, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'AllowAdjacentOneLineDefs' => false } }

  it 'finds offenses in inner classes' 


  context 'when there are only comments between defs' do
    let(:source) do
      <<-RUBY.strip_indent
        class J
          def n
          end # n-related
          # checks something o-related
          # and more
          def o
          end
        end
      RUBY
    end

    it 'registers an offense' 


    it 'auto-corrects' 

  end

  context 'conditional method definitions' do
    it 'accepts defs inside a conditional without blank lines in between' 


    it 'registers an offense for consecutive defs inside a conditional' 

  end

  context 'class methods' do
    context 'adjacent class methods' do
      let(:offending_source) do
        <<-RUBY.strip_indent
          class Test
            def self.foo
              true
            end
            def self.bar
              true
            end
          end
        RUBY
      end

      it 'registers an offense for missing blank line between methods' 


      it 'autocorrects it' 

    end

    context 'mixed instance and class methods' do
      let(:offending_source) do
        <<-RUBY.strip_indent
          class Test
            def foo
              true
            end
            def self.bar
              true
            end
          end
        RUBY
      end

      it 'registers an offense for missing blank line between methods' 


      it 'autocorrects it' 

    end
  end

  # Only one def, so rule about empty line *between* defs does not
  # apply.
  it 'accepts a def that follows a line with code' 


  # Only one def, so rule about empty line *between* defs does not
  # apply.
  it 'accepts a def that follows code and a comment' 


  it 'accepts the first def without leading empty line in a class' 


  it 'accepts a def that follows an empty line and then a comment' 


  it 'accepts a def that is the first of a module' 


  it 'accepts a nested def' 


  it 'registers an offense for adjacent one-liners by default' 


  it 'auto-corrects adjacent one-liners by default' 


  it 'auto-corrects when there are too many new lines' 


  it 'treats lines with whitespaces as blank' 


  it "doesn't allow more than the required number of newlines" 


  context 'when AllowAdjacentOneLineDefs is enabled' do
    let(:cop_config) { { 'AllowAdjacentOneLineDefs' => true } }

    it 'accepts adjacent one-liners' 


    it 'registers an offense for adjacent defs if some are multi-line' 

  end

  context 'when a maximum of empty lines is specified' do
    let(:cop_config) { { 'NumberOfEmptyLines' => [0, 1] } }

    it 'finds no offense for no empty line' 


    it 'finds no offense for one empty line' 


    it 'finds an  offense for two empty lines' 


    it 'auto-corrects' 

  end

  context 'when multiple lines between defs are allowed' do
    let(:cop_config) { { 'NumberOfEmptyLines' => 2 } }

    it 'treats lines with whitespaces as blank' 


    it 'auto-corrects when there are no new lines' 


    it 'auto-corrects when there are too few new lines' 


    it 'auto-corrects when there are too many new lines' 

  end
end

