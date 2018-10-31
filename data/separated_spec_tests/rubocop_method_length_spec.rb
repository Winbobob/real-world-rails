# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Metrics::MethodLength, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'Max' => 5, 'CountComments' => false } }

  shared_examples 'reports violation' do |first_line, last_line|
    it 'rejects a method with more than 5 lines' 


    it 'reports the correct beginning and end lines' 

  end

  context 'when method is an instance method' do
    before do
      inspect_source(<<-RUBY.strip_indent)
        def m()
          a = 1
          a = 2
          a = 3
          a = 4
          a = 5
          a = 6
        end
      RUBY
    end

    include_examples 'reports violation', 1, 8
  end

  context 'when method is defined with `define_method`' do
    before do
      inspect_source(<<-RUBY.strip_indent)
        define_method(:m) do
          a = 1
          a = 2
          a = 3
          a = 4
          a = 5
          a = 6
        end
      RUBY
    end

    include_examples 'reports violation', 1, 8
  end

  context 'when method is a class method' do
    before do
      inspect_source(<<-RUBY.strip_indent)
        def self.m()
          a = 1
          a = 2
          a = 3
          a = 4
          a = 5
          a = 6
        end
      RUBY
    end

    include_examples 'reports violation', 1, 8
  end

  context 'when method is defined on a singleton class' do
    before do
      inspect_source(<<-RUBY.strip_indent)
        class K
          class << self
            def m()
              a = 1
              a = 2
              a = 3
              a = 4
              a = 5
              a = 6
            end
          end
        end
      RUBY
    end

    include_examples 'reports violation', 3, 10
  end

  it 'accepts a method with less than 5 lines' 


  it 'accepts a method with multiline arguments ' \
     'and less than 5 lines of body' do
    inspect_source(<<-RUBY.strip_indent)
      def m(x,
            y,
            z)
        a = 1
        a = 2
        a = 3
        a = 4
      end
    RUBY
    expect(cop.offenses.empty?).to be(true)
  end

  it 'does not count blank lines' 


  it 'accepts empty methods' 


  it 'is not fooled by one-liner methods, syntax #1' 


  it 'is not fooled by one-liner methods, syntax #2' 


  it 'properly counts lines when method ends with block' 


  it 'does not count commented lines by default' 


  context 'when CountComments is enabled' do
    before { cop_config['CountComments'] = true }

    it 'also counts commented lines' 

  end
end

