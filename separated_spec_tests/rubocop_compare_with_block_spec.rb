# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::CompareWithBlock do
  subject(:cop) { described_class.new }

  shared_examples 'compare with block' do |method|
    it "registers an offense for #{method}" 


    it "registers an offense for #{method} with [:foo]" 


    it "registers an offense for #{method} with ['foo']" 


    it "registers an offense for #{method} with [1]" 


    it 'highlights compare method' 


    it "accepts valid #{method} usage" 


    it "accepts #{method}_by" 


    it "autocorrects array.#{method} { |a, b| a.foo <=> b.foo }" 


    it "autocorrects array.#{method} { |a, b| a.bar <=> b.bar }" 


    it "autocorrects array.#{method} { |x, y| x.foo <=> y.foo }" 


    it "autocorrects array.#{method} do |a, b| a.foo <=> b.foo end" 


    it "autocorrects array.#{method} { |a, b| a[:foo] <=> b[:foo] }" 


    it "autocorrects array.#{method} { |a, b| a['foo'] <=> b['foo'] }" 


    it "autocorrects array.#{method} { |a, b| a[1] <=> b[1] }" 


    it 'formats the error message correctly for ' \
      "array.#{method} { |a, b| a.foo <=> b.foo }" do
      inspect_source("array.#{method} { |a, b| a.foo <=> b.foo }")
      expect(cop.messages).to eq(["Use `#{method}_by(&:foo)` instead of " \
                                  "`#{method} { |a, b| a.foo <=> b.foo }`."])
    end

    it 'formats the error message correctly for ' \
      "array.#{method} { |a, b| a[:foo] <=> b[:foo] }" do
      inspect_source("array.#{method} { |a, b| a[:foo] <=> b[:foo] }")
      expected = ["Use `#{method}_by { |a| a[:foo] }` instead of " \
                  "`#{method} { |a, b| a[:foo] <=> b[:foo] }`."]
      expect(cop.messages).to eq(expected)
    end
  end

  include_examples 'compare with block', 'sort'
  include_examples 'compare with block', 'max'
  include_examples 'compare with block', 'min'
end

