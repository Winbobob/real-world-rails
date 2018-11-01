# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UselessAccessModifier do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  context 'when an access modifier has no effect' do
    it 'registers an offense' 

  end

  context 'when an access modifier has no methods' do
    it 'registers an offense' 

  end

  context 'when an access modifier is followed by attr_*' do
    it 'does not register an offense' 

  end

  context 'when an access modifier is followed by a ' \
    'class method defined on constant' do

    it 'registers an offense' 

  end

  context 'when there are consecutive access modifiers' do
    it 'registers an offense' 

  end

  context 'when passing method as symbol' do
    it 'does not register an offense' 

  end

  context 'when class is empty save modifier' do
    it 'registers an offense' 

  end

  context 'when multiple class definitions in file but only one has offense' do
    it 'registers an offense' 

  end

  context 'when using inline modifiers' do
    it 'does not register an offense' 

  end

  context 'when only a constant or local variable is defined after the ' \
    'modifier' do
    %w[CONSTANT some_var].each do |binding_name|
      it 'registers an offense' 

    end
  end

  context 'when a def is an argument to a method call' do
    it 'does not register an offense' 

  end

  context 'when private_class_method is used without arguments' do
    it 'registers an offense' 

  end

  context "when using ActiveSupport's `concerning` method" do
    let(:config) do
      RuboCop::Config.new(
        'Lint/UselessAccessModifier' => {
          'ContextCreatingMethods' => ['concerning']
        }
      )
    end

    it 'is aware that this creates a new scope' 


    it 'still points out redundant uses within the block' 

  end

  context 'when using ActiveSupport behavior when Rails is not eabled' do
    it 'reports offenses' 

  end

  context 'when using the class_methods method from ActiveSupport::Concern' do
    let(:config) do
      RuboCop::Config.new(
        'Lint/UselessAccessModifier' => {
          'ContextCreatingMethods' => ['class_methods']
        }
      )
    end

    it 'is aware that this creates a new scope' 

  end

  context 'when using a known method-creating method' do
    let(:config) do
      RuboCop::Config.new(
        'Lint/UselessAccessModifier' => {
          'MethodCreatingMethods' => ['delegate']
        }
      )
    end

    it 'is aware that this creates a new method' 


    it 'still points out redundant uses within the module' 

  end

  shared_examples 'at the top of the body' do |keyword|
    it 'registers an offense for `public`' 


    it "doesn't register an offense for `protected`" 


    it "doesn't register an offense for `private`" 

  end

  shared_examples 'repeated visibility modifiers' do |keyword, modifier|
    it "registers an offense when `#{modifier}` is repeated" 

  end

  shared_examples 'non-repeated visibility modifiers' do |keyword|
    it 'registers an offense even when `public` is not repeated' 


    it "doesn't register an offense when `protected` is not repeated" 


    it "doesn't register an offense when `private` is not repeated" 

  end

  shared_examples 'at the end of the body' do |keyword, modifier|
    it "registers an offense for trailing `#{modifier}`" 

  end

  shared_examples 'nested in a begin..end block' do |keyword, modifier|
    it "still flags repeated `#{modifier}`" 


    unless modifier == 'public'
      it "doesn't flag an access modifier from surrounding scope" 

    end
  end

  shared_examples 'unused visibility modifiers' do |keyword|
    it 'registers an error when visibility is immediately changed ' \
       'without any intervening defs' do
      expect_offense(<<-RUBY.strip_indent)
        #{keyword} A
          private
          def method1
          end
          public
          ^^^^^^ Useless `public` access modifier.
          private
          def method2
          end
        end
      RUBY
    end
  end

  shared_examples 'conditionally defined method' do |keyword, modifier|
    %w[if unless].each do |conditional_type|
      it "doesn't register an offense for #{conditional_type}" 

    end
  end

  shared_examples 'methods defined in an iteration' do |keyword, modifier|
    %w[each map].each do |iteration_method|
      it "doesn't register an offense for #{iteration_method}" 

    end
  end

  shared_examples 'method defined with define_method' do |keyword, modifier|
    it "doesn't register an offense if a block is passed" 


    %w[lambda proc ->].each do |proc_type|
      it "doesn't register an offense if a #{proc_type} is passed" 

    end
  end

  shared_examples 'method defined on a singleton class' do |keyword, modifier|
    context 'inside a class' do
      it "doesn't register an offense if a method is defined" 


      it "doesn't register an offense if the modifier is the same as " \
        'outside the meta-class' do
        expect_no_offenses(<<-RUBY.strip_indent)
          #{keyword} A
            #{modifier}
            def method1
            end
            class << self
              #{modifier}
              def method2
              end
            end
          end
        RUBY
      end

      it 'registers an offense if no method is defined' 


      it 'registers an offense if no method is defined after the modifier' 


      it 'registers an offense even if a non-singleton-class method is ' \
        'defined' do
        src = <<-RUBY.strip_indent
          #{keyword} A
            def method1
            end
            class << self
              #{modifier}
            end
          end
        RUBY
        inspect_source(src)
        expect(cop.offenses.size).to eq(1)
      end
    end

    context 'outside a class' do
      it "doesn't register an offense if a method is defined" 


      it 'registers an offense if no method is defined' 


      it 'registers an offense if no method is defined after the modifier' 

    end
  end

  shared_examples 'method defined using class_eval' do |modifier|
    it "doesn't register an offense if a method is defined" 


    it 'registers an offense if no method is defined' 


    context 'inside a class' do
      it 'registers an offense when a modifier is ouside the block and a ' \
        'method is defined only inside the block' do
        src = <<-RUBY.strip_indent
          class A
            #{modifier}
            A.class_eval do
              def method1
              end
            end
          end
        RUBY
        inspect_source(src)
        expect(cop.offenses.size).to eq(1)
      end

      it 'registers two offenses when a modifier is inside and outside the ' \
        ' block and no method is defined' do
        src = <<-RUBY.strip_indent
          class A
            #{modifier}
            A.class_eval do
              #{modifier}
            end
          end
        RUBY
        inspect_source(src)
        expect(cop.offenses.size).to eq(2)
      end
    end
  end

  shared_examples 'def in new block' do |klass, modifier|
    it "doesn't register an offense if a method is defined in #{klass}.new" 


    it "registers an offense if no method is defined in #{klass}.new" 

  end

  shared_examples 'method defined using instance_eval' do |modifier|
    it "doesn't register an offense if a method is defined" 


    it 'registers an offense if no method is defined' 


    context 'inside a class' do
      it 'registers an offense when a modifier is ouside the block and a ' \
        'method is defined only inside the block' do
        src = <<-RUBY.strip_indent
          class A
            #{modifier}
            self.instance_eval do
              def method1
              end
            end
          end
        RUBY
        inspect_source(src)
        expect(cop.offenses.size).to eq(1)
      end

      it 'registers two offenses when a modifier is inside and outside the ' \
        ' and no method is defined' do
        src = <<-RUBY.strip_indent
          class A
            #{modifier}
            self.instance_eval do
              #{modifier}
            end
          end
        RUBY
        inspect_source(src)
        expect(cop.offenses.size).to eq(2)
      end
    end
  end

  shared_examples 'nested modules' do |keyword, modifier|
    it "doesn't register an offense for nested #{keyword}s" 


    context 'unused modifiers' do
      it "registers an offense with a nested #{keyword}" 


      it "registers an offense when outside a nested #{keyword}" 


      it "registers an offense when inside a nested #{keyword}" 

    end
  end

  %w[protected private].each do |modifier|
    it_behaves_like('method defined using class_eval', modifier)
    it_behaves_like('method defined using instance_eval', modifier)
  end

  %w[Class Module Struct].each do |klass|
    %w[protected private].each do |modifier|
      it_behaves_like('def in new block', klass, modifier)
    end
  end

  %w[module class].each do |keyword|
    it_behaves_like('at the top of the body', keyword)
    it_behaves_like('non-repeated visibility modifiers', keyword)
    it_behaves_like('unused visibility modifiers', keyword)

    %w[public protected private].each do |modifier|
      it_behaves_like('repeated visibility modifiers', keyword, modifier)
      it_behaves_like('at the end of the body', keyword, modifier)
      it_behaves_like('nested in a begin..end block', keyword, modifier)

      next if modifier == 'public'

      it_behaves_like('conditionally defined method', keyword, modifier)
      it_behaves_like('methods defined in an iteration', keyword, modifier)
      it_behaves_like('method defined with define_method', keyword, modifier)
      it_behaves_like('method defined on a singleton class', keyword, modifier)
      it_behaves_like('nested modules', keyword, modifier)
    end
  end
end

