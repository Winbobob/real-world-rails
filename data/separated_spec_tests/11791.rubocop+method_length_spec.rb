# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Metrics::MethodLength, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'Max' => 5, 'CountComments' => false } }

  context 'when method is an instance method' do
    it 'registers an offense' 

  end

  context 'when method is defined with `define_method`' do
    it 'registers an offense' 

  end

  context 'when method is a class method' do
    it 'registers an offense' 

  end

  context 'when method is defined on a singleton class' do
    it 'registers an offense' 

  end

  it 'accepts a method with less than 5 lines' 


  it 'accepts a method with multiline arguments ' \
     'and less than 5 lines of body' do
    expect_no_offenses(<<-RUBY.strip_indent)
      def m(x,
            y,
            z)
        a = 1
        a = 2
        a = 3
        a = 4
      end
    RUBY
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

  context 'when method is defined in `ExcludedMethods`' do
    before { cop_config['ExcludedMethods'] = ['foo'] }

    it 'still rejects other methods with more than 5 lines' 


    it 'accepts the foo method with more than 5 lines' 

  end
end

