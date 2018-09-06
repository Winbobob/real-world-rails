# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UnderscorePrefixedVariableName do
  subject(:cop) { described_class.new }

  context 'when an underscore-prefixed variable is used' do
    let(:source) { <<-RUBY }
      def some_method
        _foo = 1
        puts _foo
      end
    RUBY

    it 'registers an offense' 

  end

  context 'when non-underscore-prefixed variable is used' do
    it 'accepts' 

  end

  context 'when an underscore-prefixed variable is reassigned' do
    it 'accepts' 

  end

  context 'when an underscore-prefixed method argument is used' do
    let(:source) { <<-RUBY }
      def some_method(_foo)
        puts _foo
      end
    RUBY

    it 'registers an offense' 

  end

  context 'when an underscore-prefixed block argument is used' do
    let(:source) { <<-RUBY }
      1.times do |_foo|
        puts _foo
      end
    RUBY

    it 'registers an offense' 

  end

  context 'when an underscore-prefixed variable in top-level scope is used' do
    let(:source) { <<-RUBY }
      _foo = 1
      puts _foo
    RUBY

    it 'registers an offense' 

  end

  context 'when an underscore-prefixed variable is captured by a block' do
    it 'accepts' 

  end

  context 'when an underscore-prefixed named capture variable is used' do
    let(:source) { <<-RUBY }
      /(?<_foo>\\w+)/ =~ 'FOO'
      puts _foo
    RUBY

    it 'registers an offense' 

  end

  %w[super binding].each do |keyword|
    context "in a method calling `#{keyword}` without arguments" do
      context 'when an underscore-prefixed argument is not used explicitly' do
        let(:source) { <<-RUBY }
          def some_method(*_)
            #{keyword}
          end
        RUBY

        it 'accepts' 

      end

      context 'when an underscore-prefixed argument is used explicitly' do
        let(:source) { <<-RUBY }
          def some_method(*_)
            #{keyword}
            puts _
          end
        RUBY

        it 'registers an offense' 

      end
    end

    context "in a method calling `#{keyword}` with arguments" do
      context 'when an underscore-prefixed argument is not used' do
        let(:source) { <<-RUBY }
          def some_method(*_)
            #{keyword}(:something)
          end
        RUBY

        it 'accepts' 

      end

      context 'when an underscore-prefixed argument is used explicitly' do
        let(:source) { <<-RUBY }
          def some_method(*_)
            #{keyword}(*_)
          end
        RUBY

        it 'registers an offense' 

      end
    end
  end
end

