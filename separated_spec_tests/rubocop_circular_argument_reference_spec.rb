# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::CircularArgumentReference do
  subject(:cop) { described_class.new }

  describe 'circular argument references in ordinal arguments' do
    before do
      inspect_source(source)
    end

    context 'when the method contains a circular argument reference' do
      let(:source) do
        <<-RUBY.strip_indent
          def omg_wow(msg = msg)
            puts msg
          end
        RUBY
      end

      it 'registers an offense' 

    end

    context 'when the method does not contain a circular argument reference' do
      let(:source) do
        <<-RUBY.strip_indent
          def omg_wow(msg)
            puts msg
          end
        RUBY
      end

      it 'does not register an offense' 

    end

    context 'when the seemingly-circular default value is a method call' do
      let(:source) do
        <<-RUBY.strip_indent
          def omg_wow(msg = self.msg)
            puts msg
          end
        RUBY
      end

      it 'does not register an offense' 

    end
  end

  describe 'circular argument references in keyword arguments' do
    before do
      inspect_source(source)
    end

    context 'when the keyword argument is not circular' do
      let(:source) do
        <<-RUBY.strip_indent
          def some_method(some_arg: nil)
            puts some_arg
          end
        RUBY
      end

      it 'does not register an offense' 

    end

    context 'when the keyword argument is not circular, and calls a method' do
      let(:source) do
        <<-RUBY.strip_indent
          def some_method(some_arg: some_method)
            puts some_arg
          end
        RUBY
      end

      it 'does not register an offense' 

    end

    context 'when there is one circular argument reference' do
      let(:source) do
        <<-RUBY.strip_indent
          def some_method(some_arg: some_arg)
            puts some_arg
          end
        RUBY
      end

      it 'registers an offense' 

    end

    context 'when the keyword argument is not circular, but calls a method ' \
            'of its own class with a self specification' do
      let(:source) do
        <<-RUBY.strip_indent
          def puts_value(value: self.class.value, smile: self.smile)
            puts value
          end
        RUBY
      end

      it 'does not register an offense' 

    end

    context 'when the keyword argument is not circular, but calls a method ' \
            'of some other object with the same name' do
      let(:source) do
        <<-RUBY.strip_indent
          def puts_length(length: mystring.length)
            puts length
          end
        RUBY
      end

      it 'does not register an offense' 

    end

    context 'when there are multiple offensive keyword arguments' do
      let(:source) do
        <<-RUBY.strip_indent
          def some_method(some_arg: some_arg, other_arg: other_arg)
            puts [some_arg, other_arg]
          end
        RUBY
      end

      it 'registers two offenses' 

    end
  end
end
