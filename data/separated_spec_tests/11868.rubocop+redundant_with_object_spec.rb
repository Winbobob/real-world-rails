# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::RedundantWithObject do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense when using `ary.each_with_object { |v| v }`' 


  it 'registers an offense when using `ary.each.with_object([]) { |v| v }`' 


  it 'autocorrects to ary.each from ary.each_with_object([])' 


  it 'autocorrects to ary.each from ary.each_with_object []' 


  it 'autocorrects to ary.each from ary.each_with_object([]) do-end block' 


  it 'autocorrects to ary.each from ary.each_with_object do-end block' 


  it 'autocorrects to ary.each from ary.each.with_object([]) { |v| v }' 


  it 'autocorrects to ary.each from ary.each.with_object [] { |v| v }' 


  it 'an object is used as a block argument' 


  context 'when missing argument to `each_with_object`' do
    it 'does not register an offense when block has 2 arguments' 


    it 'does not register an offense when block has 1 argument' 

  end
end

