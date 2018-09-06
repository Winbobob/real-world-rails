# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::RedundantException do
  subject(:cop) { described_class.new }

  shared_examples 'common behavior' do |keyword|
    it "reports an offense for a #{keyword} with RuntimeError" 


    it "reports an offense for a #{keyword} with RuntimeError.new" 


    it "accepts a #{keyword} with RuntimeError if it does not have 2 args" 


    it "auto-corrects a #{keyword} RuntimeError by removing RuntimeError" 


    it "auto-corrects a #{keyword} RuntimeError and leaves parentheses" 


    it "auto-corrects a #{keyword} RuntimeError.new with parentheses by " \
       'removing RuntimeError.new' do
      src = "#{keyword} RuntimeError.new(msg)"
      result_src = "#{keyword} msg"
      new_src = autocorrect_source(src)
      expect(new_src).to eq(result_src)
    end

    it "auto-corrects a #{keyword} RuntimeError.new without parentheses by " \
       'removing RuntimeError.new' do
      src = "#{keyword} RuntimeError.new msg"
      result_src = "#{keyword} msg"
      new_src = autocorrect_source(src)
      expect(new_src).to eq(result_src)
    end

    it "does not modify #{keyword} w/ RuntimeError if it does not have 2 " \
       'args' do
      src = "#{keyword} runtimeError, msg, caller"
      new_src = autocorrect_source(src)
      expect(new_src).to eq(src)
    end

    it 'does not modify rescue w/ non redundant error' 

  end

  include_examples 'common behavior', 'raise'
  include_examples 'common behavior', 'fail'
end

