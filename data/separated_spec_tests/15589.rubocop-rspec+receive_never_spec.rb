# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::ReceiveNever do
  subject(:cop) { described_class.new }

  it 'flags usage of `never`' 


  it 'flags usage of `never` after `with`' 


  it 'flags usage of `never` with `is_expected`' 


  it 'flags usage of `never` with `expect_any_instance_of`' 


  it 'allows method called `never`' 


  include_examples 'autocorrect',
                   'expect(foo).to receive(:bar).with(0).never',
                   'expect(foo).not_to receive(:bar).with(0)'
end

