# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::EmptyComment, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'AllowBorderComment' => true, 'AllowMarginComment' => true }
  end

  it 'registers an offense when using single line empty comment' 


  it 'registers an offense when using multiline empty comments' 


  it 'registers an offense when using an empty comment next to code' 


  it 'does not register an offense when using comment text' 


  it 'does not register an offense when using comment text with ' \
     'leading and trailing blank lines' do
    expect_no_offenses(<<-RUBY.strip_indent)
      #
      # Description of `Foo` class.
      #
      class Foo
        #
        # Description of `hello` method.
        #
        def hello
        end
      end
    RUBY
  end

  context 'allow border comment (default)' do
    it 'does not register an offense when using border comment' 

  end

  context 'disallow border comment' do
    let(:cop_config) { { 'AllowBorderComment' => false } }

    it 'registers an offense when using single line empty comment' 


    it 'registers an offense when using border comment' 

  end

  context 'allow margin comment (default)' do
    it 'does not register an offense when using margin comment' 

  end

  context 'disallow margin comment' do
    let(:cop_config) { { 'AllowMarginComment' => false } }

    it 'registers an offense when using margin comment' 

  end

  it 'autocorrects empty comment' 


  it 'autocorrects an empty comment next to code' 


  it 'autocorrects an empty comment without space next to code' 


  it 'autocorrects multiple empty comments next to code' 


  it 'autocorrects multiple aligned empty comments next to code' 

end

