class SomethingExpected
  attr_accessor :some_value
end

value_pattern = /(?:result|`.+?`)/

RSpec.describe "expect { ... }.to change ..." do
  context "with a numeric value" do
    before(:example) do
      @instance = SomethingExpected.new
      @instance.some_value = 5
    end

    it "passes when actual is modified by the block" 


    it "fails when actual is not modified by the block" 


    it "provides a #description" 

  end

  it "can specify the change of a variable's class" 


  context "with boolean values" do
    before(:example) do
      @instance = SomethingExpected.new
      @instance.some_value = true
    end

    it "passes when actual is modified by the block" 


    it "fails when actual is not modified by the block" 

  end

  context "with set values" do
    it "passes when it should" 


    it "fails when it should" 

  end

  context "with an IO stream" do
    it "fails when the stream does not change" 

  end

  it 'correctly detects a change that both mutates and replaces an object' 


  context "with nil value" do
    before(:example) do
      @instance = SomethingExpected.new
      @instance.some_value = nil
    end

    it "passes when actual is modified by the block" 


    it "fails when actual is not modified by the block" 

  end

  context "with a deeply nested object graph" do
    it "passes when a leaf is changed" 


    it 'fails when no part of it is changed' 


    it "passes when correctly specifying the exact mutation of a leaf" 


    it "fails when wrongly specifying the `from` value" 


    it "fails when wrongly specifying the `to` value" 


    def regexp_inspect(object)
      Regexp.escape(object.inspect)
    end
  end

  context "with an array" do
    before(:example) do
      @instance = SomethingExpected.new
      @instance.some_value = []
    end

    it "passes when actual is modified by the block" 


    it "fails when a predicate on the actual fails" 


    it "passes when a predicate on the actual passes" 


    it "fails when actual is not modified by the block" 

  end

  context "with a hash" do
    before(:example) do
      @instance = SomethingExpected.new
      @instance.some_value = {:a => 'a'}
    end

    it "passes when actual is modified by the block" 


    it "fails when actual is not modified by the block" 

  end

  context "with a string" do
    it "passes when actual is modified by the block" 


    it 'fails when actual is not modified by the block' 

  end

  context "with an arbitrary enumerable" do
    before(:example) do
      @instance = SomethingExpected.new
      @instance.some_value = Class.new do
        include Enumerable

        attr_reader :elements

        def initialize(*elements)
          @elements = elements.dup
        end

        def <<(element)
          elements << element
        end

        def dup
          self.class.new(*elements)
        end

        def ==(other)
          elements == other.elements
        end

        def hash
          elements.hash
        end
      end.new
    end

    it "passes when actual is modified by the block" 


    it "fails when actual is not modified by the block" 

  end
end

RSpec.describe "expect { ... }.to change(actual, message)" do
  it 'provides a #description with `SomeClass#some_message` notation' 


  context "when the receiver is an instance of anonymous class" do
    let(:klass) do
      Class.new(SomethingExpected)
    end

    it "can handle it" 

  end

  context 'when the receiver is an object that does not respond to #class such as BasicObject' do
    let(:basic_object) do
      basic_object_class.new
    end

    let(:basic_object_class) do
      defined?(BasicObject) ? BasicObject : fake_basic_object_class
    end

    let(:fake_basic_object_class) do
      Class.new do
        def self.to_s
          'BasicObject'
        end

        undef class, inspect, respond_to?
      end
    end

    it 'can properly extract the class name' 

  end

  context "when the receiver is a Module" do
    it "provides a #description with `SomeModule.some_message` notation" 

  end

  context "with a missing message" do
    it "fails with an ArgumentError" 

  end
end

RSpec.describe "expect { ... }.not_to change(actual, message)" do
  before(:example) do
    @instance = SomethingExpected.new
    @instance.some_value = 5
  end

  it "passes when actual is not modified by the block" 


  it "fails when actual is not modified by the block" 

end

RSpec.describe "expect { ... }.to change { block }" do
  before(:example) do
    @instance = SomethingExpected.new
    @instance.some_value = 5
  end

  it "passes when actual is modified by the block" 


  it "fails when actual is not modified by the block" 


  it "warns if passed a block using do/end instead of {}" 


  context 'in Ripper supported environment', :if => RSpec::Support::RubyFeatures.ripper_supported? do
    context 'when the block body fits into a single line' do
      it "provides a #description with the block snippet" 

    end

    context 'when the block body spans multiple lines' do
      before do
        def @instance.reload
        end
      end

      let(:matcher) do
        change {
          @instance.reload
          @instance.some_value
        }
      end

      it "provides a #description with the block snippet" 

    end

    context 'when used with an alias name' do
      alias_matcher :modify, :change

      it 'can extract the block snippet' 

    end
  end

  context 'in Ripper unsupported environment', :unless => RSpec::Support::RubyFeatures.ripper_supported? do
    it "provides a #description without the block snippet" 

  end
end

RSpec.describe "expect { ... }.not_to change { block }" do
  before(:example) do
    @instance = SomethingExpected.new
    @instance.some_value = 5
  end

  it "passes when actual is modified by the block" 


  it "fails when actual is not modified by the block" 


  it "warns if passed a block using do/end instead of {}" 


  context "with an IO stream" do
    it "passes when the stream does not change" 

  end

  context "with a deeply nested object graph" do
    it "passes when the object is changed" 


    it 'fails when part of it is changed' 


    it "passes when correctly specifying the exact mutation of a leaf" 


    def regexp_inspect(object)
      Regexp.escape(object.inspect)
    end
  end
end

RSpec.describe "expect { ... }.not_to change { }.from" do
  context 'when the value starts at the from value' do
    it 'passes when the value does not change' 


    it 'fails when the value does change' 

  end

  context 'when the value starts at a different value' do
    it 'fails when the value does not change' 


    it 'fails when the value does change' 

  end
end

RSpec.describe "expect { ... }.not_to change { }.to" do
  it 'is not supported' 


  it 'is not supported when it comes after `from`' 

end

RSpec.describe "expect { ... }.not_to change { }.by" do
  it 'is not supported' 

end

RSpec.describe "expect { ... }.not_to change { }.by_at_least" do
  it 'is not supported' 

end

RSpec.describe "expect { ... }.not_to change { }.by_at_most" do
  it 'is not supported' 

end

RSpec.describe "expect { ... }.to change(actual, message).by(expected)" do
  before(:example) do
    @instance = SomethingExpected.new
    @instance.some_value = 5
  end

  it "passes when attribute is changed by expected amount" 


  it "passes when attribute is not changed and expected amount is 0" 


  it "fails when the attribute is changed by unexpected amount" 


  it "fails when the attribute is changed by unexpected amount in the opposite direction" 


  it "provides a #description" 

end

RSpec.describe "expect { ... }.to change { block }.by(expected)" do
  before(:example) do
    @instance = SomethingExpected.new
    @instance.some_value = 5
  end

  it "passes when attribute is changed by expected amount" 


  it "fails when the attribute is changed by unexpected amount" 


  it "fails when the attribute is changed by unexpected amount in the opposite direction" 


  context 'in Ripper supported environment', :if => RSpec::Support::RubyFeatures.ripper_supported? do
    it "provides a #description with the block snippet" 

  end

  context 'in Ripper unsupported environment', :unless => RSpec::Support::RubyFeatures.ripper_supported? do
    it "provides a #description without the block snippet" 

  end
end

RSpec.describe "expect { ... }.to change(actual, message).by_at_least(expected)" do
  before(:example) do
    @instance = SomethingExpected.new
    @instance.some_value = 5
  end

  it "passes when attribute is changed by greater than the expected amount" 


  it "passes when attribute is changed by the expected amount" 


  it "fails when the attribute is changed by less than the expected amount" 


  it "provides a #description" 

end

RSpec.describe "expect { ... }.to change { block }.by_at_least(expected)" do
  before(:example) do
    @instance = SomethingExpected.new
    @instance.some_value = 5
  end

  it "passes when attribute is changed by greater than expected amount" 


  it "passes when attribute is changed by the expected amount" 


  it "fails when the attribute is changed by less than the unexpected amount" 


  context 'in Ripper supported environment', :if => RSpec::Support::RubyFeatures.ripper_supported? do
    it "provides a #description with the block snippet" 

  end

  context 'in Ripper unsupported environment', :unless => RSpec::Support::RubyFeatures.ripper_supported? do
    it "provides a #description without the block snippet" 

  end
end

RSpec.describe "expect { ... }.to change(actual, message).by_at_most(expected)" do
  before(:example) do
    @instance = SomethingExpected.new
    @instance.some_value = 5
  end

  it "passes when attribute is changed by less than the expected amount" 


  it "passes when attribute is changed by the expected amount" 


  it "fails when the attribute is changed by greater than the expected amount" 


  it "provides a #description" 

end

RSpec.describe "expect { ... }.to change { block }.by_at_most(expected)" do
  before(:example) do
    @instance = SomethingExpected.new
    @instance.some_value = 5
  end

  it "passes when attribute is changed by less than expected amount" 


  it "passes when attribute is changed by the expected amount" 


  it "fails when the attribute is changed by greater than the unexpected amount" 


  context 'in Ripper supported environment', :if => RSpec::Support::RubyFeatures.ripper_supported? do
    it "provides a #description with the block snippet" 

  end

  context 'in Ripper unsupported environment', :unless => RSpec::Support::RubyFeatures.ripper_supported? do
    it "provides a #description without the block snippet" 

  end
end

RSpec.describe "expect { ... }.to change(actual, message).from(old)" do
  context "with boolean values" do
    before(:example) do
      @instance = SomethingExpected.new
      @instance.some_value = true
    end

    it "passes when attribute is == to expected value before executing block" 


    it "fails when attribute is not == to expected value before executing block" 

  end

  context "with non-boolean values" do
    before(:example) do
      @instance = SomethingExpected.new
      @instance.some_value = 'string'
    end

    it "passes when attribute matches expected value before executing block" 


    it "fails when attribute does not match expected value before executing block" 


    it "provides a #description" 

  end
end

RSpec.describe "expect { ... }.to change { block }.from(old)" do
  before(:example) do
    @instance = SomethingExpected.new
    @instance.some_value = 'string'
  end

  it "passes when attribute matches expected value before executing block" 


  it "fails when attribute does not match expected value before executing block" 


  it "fails when attribute does not change" 


  context 'in Ripper supported environment', :if => RSpec::Support::RubyFeatures.ripper_supported? do
    it "provides a #description with the block snippet" 

  end

  context 'in Ripper unsupported environment', :unless => RSpec::Support::RubyFeatures.ripper_supported? do
    it "provides a #description without the block snippet" 

  end

  it "provides a #description" 

end

RSpec.describe "expect { ... }.to change(actual, message).to(new)" do
  context "with boolean values" do
    before(:example) do
      @instance = SomethingExpected.new
      @instance.some_value = true
    end

    it "passes when attribute is == to expected value after executing block" 


    it "fails when attribute is not == to expected value after executing block" 

  end

  context "with non-boolean values" do
    before(:example) do
      @instance = SomethingExpected.new
      @instance.some_value = 'string'
    end

    it "passes when attribute matches expected value after executing block" 


    it "fails when attribute does not match expected value after executing block" 


    it "fails with a clear message when it ends with the right value but did not change" 

  end
end

RSpec.describe "expect { ... }.to change { block }.to(new)" do
  before(:example) do
    @instance = SomethingExpected.new
    @instance.some_value = 'string'
  end

  it "passes when attribute matches expected value after executing block" 


  it "fails when attribute does not match expected value after executing block" 


  it "provides a #description" 

end

RSpec.describe "expect { ... }.to change(actual, message).from(old).to(new)" do
  before(:example) do
    @instance = SomethingExpected.new
    @instance.some_value = 'string'
  end

  it "passes when #to comes before #from" 


  it "passes when #from comes before #to" 


  it "shows the correct messaging when #after and #to are different" 


  it "shows the correct messaging when #before and #from are different" 

end

RSpec.describe "expect { ... }.to change { block }.from(old).to(new)" do
  before(:example) do
    @instance = SomethingExpected.new
    @instance.some_value = 'string'
  end

  context "when #to comes before #from" do
    it "passes" 


    it "provides a #description" 

  end

  context "when #from comes before #to" do
    it "passes" 


    it "provides a #description" 

  end
end

RSpec.describe "Composing a matcher with `change`" do
  describe "expect { ... }.to change { ... }" do
    context ".from(matcher).to(matcher)" do
      it 'passes when the matchers match the from and to values' 


      it 'fails with a clear message when the `from` does not match' 


      it 'fails with a clear message when the `to` does not match' 


      it 'provides a description' 

    end

    context ".to(matcher).from(matcher)" do
      it 'passes when the matchers match the from and to values' 


      it 'fails with a clear message when the `from` does not match' 


      it 'fails with a clear message when the `to` does not match' 


      it 'provides a description' 

    end

    context ".by(matcher)" do
      it "passes when the matcher matches" 


      it 'fails with a clear message when the `by` does not match' 


      it 'provides a description' 

    end
  end

  describe "expect { ... }.not_to change { ... }.from(matcher).to(matcher)" do
    it 'passes when the matcher matches the `from` value and it does not change' 


    it 'fails with a clear message when the `from` matcher does not match' 

  end
end

RSpec.describe RSpec::Matchers::BuiltIn::Change do
  it "works when the receiver has implemented #send" 


  k = 1
  before { k = 1 }
  it_behaves_like "an RSpec matcher", :valid_value => lambda { k += 1 },
                                      :invalid_value => lambda { } do
    let(:matcher) { change { k } }
  end
end

RSpec.describe RSpec::Matchers::BuiltIn::ChangeRelatively do
  k = 0
  before { k = 0 }
  it_behaves_like "an RSpec matcher", :valid_value => lambda { k += 1 },
                                      :invalid_value => lambda { k += 2 },
                                      :disallows_negation => true do
    let(:matcher) { change { k }.by(1) }
  end
end

RSpec.describe RSpec::Matchers::BuiltIn::ChangeFromValue do
  k = 0
  before { k = 0 }
  it_behaves_like "an RSpec matcher", :valid_value => lambda { k += 1 },
                                      :invalid_value => lambda { } do
    let(:matcher) { change { k }.from(0) }
  end
end

RSpec.describe RSpec::Matchers::BuiltIn::ChangeToValue do
  k = 0
  before { k = 0 }
  it_behaves_like "an RSpec matcher", :valid_value => lambda { k = 2 },
                                      :invalid_value => lambda { k = 3 },
                                      :disallows_negation => true do
    let(:matcher) { change { k }.to(2) }
  end
end

