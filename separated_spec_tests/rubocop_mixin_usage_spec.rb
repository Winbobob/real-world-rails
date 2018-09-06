# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MixinUsage do
  subject(:cop) { described_class.new }

  context 'include' do
    it 'registers an offense when using outside class (used above)' 


    it 'registers an offense when using outside class (used below)' 


    it 'registers an offense when using only `include` statement' 


    it 'registers an offense when using `include` in method definition ' \
       'outside class or module' do
      expect_offense(<<-RUBY.strip_indent)
        def foo
          include M
          ^^^^^^^^^ `include` is used at the top level. Use inside `class` or `module`.
        end
      RUBY
    end

    it 'does not register an offense when using outside class' 


    it 'does not register an offense when using inside class' 


    it 'does not register an offense when using inside block' 


    it "doesn't register an offense when `include` call is a method argument" 


    it 'does not register an offense when using `include` in method ' \
       'definition inside class' do
      expect_no_offenses(<<-RUBY.strip_indent)
        class X
          def foo
            include M
          end
        end
      RUBY
    end

    it 'does not register an offense when using `include` in method ' \
       'definition inside module' do
      expect_no_offenses(<<-RUBY.strip_indent)
        module X
          def foo
            include M
          end
        end
      RUBY
    end

    context 'Multiple definition classes in one' do
      it 'does not register an offense when using inside class' 

    end

    context 'Nested module' do
      it 'registers an offense when using outside class' 

    end
  end

  context 'extend' do
    it 'registers an offense when using outside class' 


    it 'does not register an offense when using inside class' 

  end

  context 'prepend' do
    it 'registers an offense when using outside class' 


    it 'does not register an offense when using inside class' 

  end

  it 'does not register an offense when using inside nested module' 

end

