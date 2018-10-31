# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::ReceiveCounts do
  subject(:cop) { described_class.new }

  it 'flags usage of `exactly(1).times`' 


  it 'flags usage of `exactly(2).times`' 


  it 'allows `exactly(3).times`' 


  it 'allows `exactly(n).times`' 


  it 'flags usage of `exactly(1).times` after `with`' 


  it 'flags usage of `exactly(1).times` with return value' 


  it 'flags usage of `exactly(1).times` with a block' 


  it 'flags usage of `at_least(1).times`' 


  it 'flags usage of `at_least(2).times`' 


  it 'flags usage of `at_most(1).times`' 


  it 'flags usage of `at_most(2).times`' 


  include_examples 'autocorrect',
                   'expect(foo).to receive(:bar).exactly(1).times { true }',
                   'expect(foo).to receive(:bar).once { true }'

  include_examples 'autocorrect',
                   'expect(foo).to receive(:bar).at_least(2).times { true }',
                   'expect(foo).to receive(:bar).at_least(:twice) { true }'
end

