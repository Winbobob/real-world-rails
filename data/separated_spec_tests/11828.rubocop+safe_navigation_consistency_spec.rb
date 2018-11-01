# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::SafeNavigationConsistency, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'Whitelist' => %w[present? blank? try presence] }
  end

  context 'target_ruby_version >= 2.3', :ruby23 do
    it 'allows && without safe navigation' 


    it 'allows || without safe navigation' 


    it 'allows safe navigation when different variables are used' 


    it 'allows calls to methods that nil responds to' 


    it 'registers an offense when using safe navigation on the left of &&' 


    it 'registers an offense when using safe navigation on the right of &&' 


    it 'registers an offense when using safe navigation on the left of ||' 


    it 'registers an offense when using safe navigation on the right of ||' 


    it 'registers an offense when there is code before or after ' \
      'the condition' do
      expect_offense(<<-RUBY.strip_indent)
        foo = nil
        foo&.bar || foo.baz
        ^^^^^^^^^^^^^^^^^^^ Ensure that safe navigation is used consistently inside of `&&` and `||`.
        something
      RUBY
    end

    it 'registers an offense for non dot method calls' 


    it 'registers an offense for assignment' 


    it 'registers an offense when using safe navigation ' \
      'inside of separated conditions' do
      expect_offense(<<-RUBY.strip_indent)
        foo&.bar && foobar.baz && foo.qux
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Ensure that safe navigation is used consistently inside of `&&` and `||`.
      RUBY
    end

    it 'registers an offense when using safe navigation ' \
      'in conditions on the right hand side' do
      expect_offense(<<-RUBY.strip_indent)
        foobar.baz && foo&.bar && foo.qux
                      ^^^^^^^^^^^^^^^^^^^ Ensure that safe navigation is used consistently inside of `&&` and `||`.
      RUBY
    end

    it 'registers multiple offenses' 


    it 'registers an offense when using unsafe navigation ' \
      'with both && and ||' do
      expect_offense(<<-RUBY.strip_indent)
        foo&.bar && foo.baz || foo.qux
        ^^^^^^^^^^^^^^^^^^^ Ensure that safe navigation is used consistently inside of `&&` and `||`.
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Ensure that safe navigation is used consistently inside of `&&` and `||`.
      RUBY
    end

    it 'registers an offense when using unsafe navigation with ' \
      'grouped conditions' do
      expect_offense(<<-RUBY.strip_indent)
        foo&.bar && (foo.baz || foo.qux)
        ^^^^^^^^^^^^^^^^^^^^ Ensure that safe navigation is used consistently inside of `&&` and `||`.
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Ensure that safe navigation is used consistently inside of `&&` and `||`.
      RUBY
    end

    it 'registers an offense when unsafe navigation appears before ' \
      'safe navigation' do
      expect_offense(<<-RUBY.strip_indent)
        foo.bar && foo.baz || foo&.qux
                   ^^^^^^^^^^^^^^^^^^^ Ensure that safe navigation is used consistently inside of `&&` and `||`.
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Ensure that safe navigation is used consistently inside of `&&` and `||`.
      RUBY
    end

    it 'registers an offense when using unsafe navigation and ' \
      'the safe navigation appears in a group' do
      expect_offense(<<-RUBY.strip_indent)
        (foo&.bar && foo.baz) || foo.qux
         ^^^^^^^^^^^^^^^^^^^ Ensure that safe navigation is used consistently inside of `&&` and `||`.
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Ensure that safe navigation is used consistently inside of `&&` and `||`.
      RUBY
    end

    it 'registers a single offense when safe navigation is ' \
      'used multiple times' do
      expect_offense(<<-RUBY.strip_indent)
        foo&.bar && foo&.baz || foo.qux
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Ensure that safe navigation is used consistently inside of `&&` and `||`.
      RUBY
    end

    context 'auto-correct' do
      it 'does not correct non dot methods' 


      it 'corrects unsafe navigation on the rhs of &&' 


      it 'corrects unsafe navigation on the lhs of &&' 


      it 'corrects unsafe navigation on the rhs of ||' 


      it 'corrects unsafe navigation on the lhs of ||' 


      it 'corrects unsafe navigation inside of separated conditions' 


      it 'corrects unsafe navigation in conditions on the right hand side' 


      it 'corrects unsafe assignment' 


      it 'corrects multiple offenses' 


      it 'corrects using unsafe navigation with both && and ||' 


      it 'corrects using unsafe navigation with grouped conditions' 


      it 'corrects unsafe navigation appears before safe navigation' 


      it 'corrects unsafe navigation when the safe navigation ' \
        'appears in a group' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          (foo&.bar && foo.baz) || foo.qux
        RUBY

        expect(new_source).to eq(<<-RUBY.strip_indent)
          (foo&.bar && foo&.baz) || foo&.qux
        RUBY
      end

      it 'correct unsafe navigation on a method chain' 

    end
  end
end

