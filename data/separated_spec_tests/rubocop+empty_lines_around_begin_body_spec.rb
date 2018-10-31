# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::EmptyLinesAroundBeginBody do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  shared_examples 'offense' do |name, message, code, correction|
    it "registers an offense for #{name} with a blank" 


    it "autocorrects for #{name} with a blank" 

  end

  shared_examples 'accepts' do |name, code|
    it "accepts #{name}" 

  end

  include_examples 'offense', 'begin body starting', 'beginning',
                   <<-CODE, <<-CORRECTION
    begin

      foo
    end
  CODE
    begin
      foo
    end
  CORRECTION
  include_examples 'offense', 'begin body ending', 'end', <<-CODE, <<-CORRECTION
    begin
      foo

    end
  CODE
    begin
      foo
    end
  CORRECTION
  include_examples 'offense',
                   'begin body starting in method', 'beginning',
                   <<-CODE, <<-CORRECTION
    def bar
      begin

        foo
      end
    end
  CODE
    def bar
      begin
        foo
      end
    end
  CORRECTION
  include_examples 'offense',
                   'begin body ending in method', 'end', <<-CODE, <<-CORRECTION
    def bar
      begin
        foo

      end
    end
  CODE
    def bar
      begin
        foo
      end
    end
  CORRECTION

  include_examples 'offense',
                   'begin body starting with rescue', 'beginning',
                   <<-CODE, <<-CORRECTION
    begin

      foo
    rescue
      bar
    end
  CODE
    begin
      foo
    rescue
      bar
    end
  CORRECTION
  include_examples 'offense',
                   'rescue body ending', 'end',
                   <<-CODE, <<-CORRECTION
    begin
      foo
    rescue
      bar

    end
  CODE
    begin
      foo
    rescue
      bar
    end
  CORRECTION

  include_examples 'offense', 'else body ending', 'end', <<-CODE, <<-CORRECTION
    begin
      foo
    rescue
      bar
    else
      baz

    end
  CODE
    begin
      foo
    rescue
      bar
    else
      baz
    end
  CORRECTION
  include_examples 'offense',
                   'ensure body ending', 'end',
                   <<-CODE, <<-CORRECTION
    begin
      foo
    ensure
      bar

    end
  CODE
    begin
      foo
    ensure
      bar
    end
  CORRECTION

  context 'with complex begin-end' do
    let(:source) { <<-RUBY.strip_indent }
      begin

        do_something1
      rescue RuntimeError
        do_something2
      rescue ArgumentError => ex
        do_something3
      rescue
        do_something3
      else
        do_something4
      ensure
        do_something4

      end
    RUBY
    let(:correction) { <<-RUBY.strip_indent }
      begin
        do_something1
      rescue RuntimeError
        do_something2
      rescue ArgumentError => ex
        do_something3
      rescue
        do_something3
      else
        do_something4
      ensure
        do_something4
      end
    RUBY

    it 'registers many offenses' 


    it 'autocorrects' 

  end

  include_examples 'accepts', 'begin block without empty line', <<-RUBY
    begin
      foo
    end
  RUBY
  include_examples 'accepts',
                   'begin block without empty line in a method', <<-RUBY
    def foo
      begin
        bar
      end
    end
  RUBY
end

