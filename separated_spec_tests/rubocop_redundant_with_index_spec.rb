# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::RedundantWithIndex do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense when using `ary.each_with_index { |v| v }`' 


  it 'registers an offense when using `ary.each.with_index { |v| v }`' 


  it 'registers an offense when using `ary.each.with_index(1) { |v| v }`' 


  it 'registers an offense when using `ary.each_with_object([]).with_index ' \
     '{ |v| v }`' do
    expect_offense(<<-RUBY.strip_indent)
      ary.each_with_object([]).with_index { |v| v }
                               ^^^^^^^^^^ Remove redundant `with_index`.
    RUBY
  end

  it 'autocorrects to ary.each from ary.each_with_index' 


  it 'autocorrects to ary.each from ary.each.with_index' 


  it 'autocorrects to ary.each from ary.each.with_index(1)' 


  it 'autocorrects to ary.each from ary.each_with_object([]).with_index' 


  it 'an index is used as a block argument' 

end

