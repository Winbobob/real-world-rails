# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::DuplicateMethods do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  shared_examples 'in scope' do |type, opening_line|
    it "registers an offense for duplicate method in #{type}" 


    it "doesn't register an offense for non-duplicate method in #{type}" 


    it "registers an offense for duplicate class methods in #{type}" 


    it "doesn't register offense for non-duplicate class methods in #{type}" 


    it "recognizes difference between instance and class methods in #{type}" 


    it "registers an offense for duplicate private methods in #{type}" 


    it "registers an offense for duplicate private self methods in #{type}" 


    it "doesn't register an offense for different private methods in #{type}" 


    it "registers an offense for duplicate protected methods in #{type}" 


    it "registers 2 offenses for pair of duplicate methods in #{type}" 


    it 'registers an offense for a duplicate instance method in separate ' \
       "#{type} blocks" do
      expect_offense(<<-RUBY.strip_indent, 'dups.rb')
        #{opening_line}
          def some_method
            implement 1
          end
        end
        #{opening_line}
          def some_method
          ^^^^^^^^^^^^^^^ Method `A#some_method` is defined at both dups.rb:2 and dups.rb:7.
            implement 2
          end
        end
      RUBY
    end

    it 'registers an offense for a duplicate class method in separate ' \
       "#{type} blocks" do
      inspect_source(<<-RUBY.strip_indent)
        #{opening_line}
          def self.some_method
            implement 1
          end
        end
        #{opening_line}
          def self.some_method
            implement 2
          end
        end
      RUBY
      expect(cop.offenses.size).to eq(1)
    end

    it 'registers offense for a duplicate instance method in separate files' 


    it 'understands class << self' 


    it 'understands nested modules' 


    it 'registers an offense when class << exp is used' 


    it "registers an offense for duplicate alias in #{type}" 


    it "doesn't register an offense for non-duplicate alias in #{type}" 


    it "registers an offense for duplicate alias_method in #{type}" 


    it "accepts for non-duplicate alias_method in #{type}" 


    it "doesn't register an offense for alias for gvar in #{type}" 


    it "registers an offense for duplicate attr_reader in #{type}" 


    it "registers an offense for duplicate attr_writer in #{type}" 


    it "registers offenses for duplicate attr_accessor in #{type}" 


    it "registers an offense for duplicate attr in #{type}" 


    it "registers offenses for duplicate assignable attr in #{type}" 


    it "accepts for attr_reader and setter in #{type}" 


    it "accepts for attr_writer and getter in #{type}" 

  end

  include_examples('in scope', 'class', 'class A')
  include_examples('in scope', 'module', 'module A')
  include_examples('in scope', 'dynamic class', 'A = Class.new do')
  include_examples('in scope', 'dynamic module', 'A = Module.new do')
  include_examples('in scope', 'class_eval block', 'A.class_eval do')

  %w[class module].each do |type|
    it 'registers an offense for duplicate class methods with named receiver ' \
       "in #{type}" do
      expect_offense(<<-RUBY.strip_indent, 'src.rb')
        #{type} A
          def A.some_method
            implement 1
          end
          def A.some_method
          ^^^^^^^^^^^^^^^^^ Method `A.some_method` is defined at both src.rb:2 and src.rb:5.
            implement 2
          end
        end
      RUBY
    end

    it 'registers an offense for duplicate class methods with `self` and ' \
       "named receiver in #{type}" do
      expect_offense(<<-RUBY.strip_indent, 'src.rb')
        #{type} A
          def self.some_method
            implement 1
          end
          def A.some_method
          ^^^^^^^^^^^^^^^^^ Method `A.some_method` is defined at both src.rb:2 and src.rb:5.
            implement 2
          end
        end
      RUBY
    end

    it 'registers an offense for duplicate class methods with `<<` and named ' \
       "receiver in #{type}" do
      expect_offense(<<-RUBY.strip_indent, 'test.rb')
        #{type} A
          class << self
            def some_method
              implement 1
            end
          end
          def A.some_method
          ^^^^^^^^^^^^^^^^^ Method `A.some_method` is defined at both test.rb:3 and test.rb:7.
            implement 2
          end
        end
      RUBY
    end
  end

  it 'registers an offense for duplicate methods at top level' 


  it 'understands class << A' 


  it 'handles class_eval with implicit receiver' 


  it 'ignores method definitions in RSpec `describe` blocks' 


  it 'ignores Class.new blocks which are assigned to local variables' 


  context 'when path is in the project root' do
    before do
      allow(Dir).to receive(:pwd).and_return('/path/to/project/root')
      allow_any_instance_of(Parser::Source::Buffer).to receive(:name)
        .and_return('/path/to/project/root/lib/foo.rb')
    end

    it 'adds a message with relative path' 

  end

  context 'when path is not in the project root' do
    before do
      allow(Dir).to receive(:pwd).and_return('/path/to/project/root')
      allow_any_instance_of(Parser::Source::Buffer).to receive(:name)
        .and_return('/no/project/root/foo.rb')
    end

    it 'adds a message with absolute path' 

  end
end

