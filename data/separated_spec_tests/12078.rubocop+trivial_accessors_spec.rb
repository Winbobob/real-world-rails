# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::TrivialAccessors, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { {} }

  it 'registers an offense on instance reader' 


  it 'registers an offense on instance writer' 


  it 'registers an offense on class reader' 


  it 'registers an offense on class writer' 


  it 'registers an offense on reader with braces' 


  it 'registers an offense on writer without braces' 


  it 'registers an offense on one-liner reader' 


  it 'registers an offense on one-liner writer' 


  it 'registers an offense on DSL-style trivial writer' 


  it 'registers an offense on reader with `private`' 


  it 'accepts non-trivial reader' 


  it 'accepts non-trivial writer' 


  it 'accepts splats' 


  it 'accepts blocks' 


  it 'accepts expressions within reader' 


  it 'accepts expressions within writer' 


  it 'accepts an initialize method looking like a writer' 


  it 'accepts reader with different ivar name' 


  it 'accepts writer with different ivar name' 


  it 'accepts writer in a module' 


  it 'accepts writer nested within a module' 


  it 'accepts reader nested within a module' 


  it 'accepts writer nested within an instance_eval call' 


  it 'accepts reader nested within an instance_eval calll' 


  it 'flags a reader inside a class, inside an instance_eval call' 

  context 'exact name match disabled' do
    let(:cop_config) { { 'ExactNameMatch' => false } }

    it 'registers an offense when names mismatch in writer' 


    it 'registers an offense when names mismatch in reader' 

  end

  context 'disallow predicates' do
    let(:cop_config) { { 'AllowPredicates' => false } }

    it 'does not accept predicate-like reader' 

  end

  context 'allow predicates' do
    let(:cop_config) { { 'AllowPredicates' => true } }

    it 'accepts predicate-like reader' 

  end

  context 'with whitelist' do
    let(:cop_config) { { 'Whitelist' => ['to_foo', 'bar='] } }

    it 'accepts whitelisted reader' 


    it 'accepts whitelisted writer' 


    context 'with AllowPredicates: false' do
      let(:cop_config) do
        { 'AllowPredicates' => false,
          'Whitelist' => ['foo?'] }
      end

      it 'accepts whitelisted predicate' 

    end
  end

  context 'with DSL allowed' do
    let(:cop_config) { { 'AllowDSLWriters' => true } }

    it 'accepts DSL-style writer' 

  end

  context 'ignore class methods' do
    let(:cop_config) { { 'IgnoreClassMethods' => true } }

    it 'accepts class reader' 


    it 'accepts class writer' 

  end

  describe '#autocorrect' do
    context 'trivial reader' do
      let(:source) { <<-RUBY.strip_indent }
        def foo
          @foo
        end
      RUBY

      let(:corrected_source) { "attr_reader :foo\n" }

      it 'autocorrects' 

    end

    context 'with `private`' do
      let(:source) { <<-RUBY.strip_indent }
        private def foo
          @foo
        end
      RUBY

      it 'does not autocorrect' 

    end

    context 'non-matching reader' do
      let(:cop_config) { { 'ExactNameMatch' => false } }

      let(:source) do
        <<-RUBY.strip_indent
          def foo
            @bar
          end
        RUBY
      end

      it 'does not autocorrect' 

    end

    context 'predicate reader, with AllowPredicates: false' do
      let(:cop_config) { { 'AllowPredicates' => false } }
      let(:source) do
        <<-RUBY.strip_indent
          def foo?
            @foo
          end
        RUBY
      end

      it 'does not autocorrect' 

    end

    context 'trivial writer' do
      let(:source) { <<-RUBY.strip_indent }
        def foo=(val)
          @foo = val
        end
      RUBY

      let(:corrected_source) { "attr_writer :foo\n" }

      it 'autocorrects' 

    end

    context 'matching DSL-style writer' do
      let(:source) do
        <<-RUBY.strip_indent
          def foo(f)
            @foo=f
          end
        RUBY
      end

      it 'does not autocorrect' 

    end

    context 'explicit receiver writer' do
      let(:source) do
        <<-RUBY.strip_indent
          def derp.foo=(f)
            @foo=f
          end
        RUBY
      end

      it 'does not autocorrect' 

    end

    context 'class receiver reader' do
      let(:source) do
        <<-RUBY.strip_indent
          class Foo
            def self.foo
              @foo
            end
          end
        RUBY
      end

      let(:corrected_source) do
        <<-RUBY.strip_indent
          class Foo
            class << self
              attr_reader :foo
            end
          end
        RUBY
      end

      it 'autocorrects with class-level attr_reader' 

    end

    context 'class receiver writer' do
      let(:source) do
        <<-RUBY.strip_indent
          class Foo
            def self.foo=(f)
              @foo = f
            end
          end
        RUBY
      end

      let(:corrected_source) do
        <<-RUBY.strip_indent
          class Foo
            class << self
              attr_writer :foo
            end
          end
        RUBY
      end

      it 'autocorrects with class-level attr_writer' 

    end
  end
end

