# frozen_string_literal: true

RSpec.describe RuboCop::Cop::InternalAffairs::RedundantMessageArgument do
  subject(:cop) { described_class.new }

  context 'when `MSG` is passed' do
    it 'registers an offense' 


    it 'auto-corrects' 

  end

  it 'does not register an offense when formatted `MSG` is passed' 


  context 'when `#message` is passed' do
    it 'registers an offense' 


    it 'auto-corrects' 

  end

  context 'when `#message` with offending node is passed' do
    context 'when message is the only keyword argument' do
      it 'registers an offense' 


      it 'auto-corrects' 

    end

    context 'when there are others keyword arguments' do
      it 'registers an offense' 


      it 'auto-corrects' 

    end
  end

  it 'does not register an offense when `#message` with another node ' \
     ' is passed' do
    expect_no_offenses(<<-RUBY.strip_indent, 'example_cop.rb')
      add_offense(node, message: message(other_node))
    RUBY
  end
end

