RSpec.describe "expect(...).to be_predicate" do
  it "passes when actual returns true for :predicate?" 


  it 'allows composable aliases to be defined' 


  it 'composes gracefully' 


  it "passes when actual returns true for :predicates? (present tense)" 


  context "when actual returns false for :predicate?" do
    it "fails when actual returns false for :predicate?" 


    it "only calls :predicate? once" 

  end

  it "fails when actual returns nil for :predicate?" 


  it "fails when actual does not respond to :predicate?" 


  it "indicates when a predicate was attempted to be matched against an unexpected `nil`" 


  it 'falls back to a present-tense form of the predicate when needed' 


  it 'fails when :predicate? is private' 


  it 'does not call :private_methods when the object publicly responds to the message' 


  it "fails on error other than NameError" 


  it 'raises an error when :predicate? exists but raises NameError' 


  it "fails on error other than NameError (with the present tense predicate)" 


  it "does not support operator chaining like a basic `be` matcher does" 


  it "indicates `be true` or `be_truthy` when using `be_true`" 


  it "shows no message if actual responds to `true?` when using `be_true`" 


  it "indicates `be false` or `be_falsey` when using `be_false`" 


  it "shows no message if actual responds to `false?` when using `be_false`" 

end

RSpec.describe "expect(...).not_to be_predicate" do
  it "passes when actual returns false for :sym?" 


  it "passes when actual returns nil for :sym?" 


  it "fails when actual returns true for :sym?" 


  it "fails when actual does not respond to :sym?" 

end

RSpec.describe "expect(...).to be_predicate(*args)" do
  it "passes when actual returns true for :predicate?(*args)" 


  it "fails when actual returns false for :predicate?(*args)" 


  it "fails when actual does not respond to :predicate?" 

end

RSpec.describe "expect(...).not_to be_predicate(*args)" do
  it "passes when actual returns false for :predicate?(*args)" 


  it "fails when actual returns true for :predicate?(*args)" 


  it "fails when actual does not respond to :predicate?" 

end

RSpec.describe "expect(...).to be_predicate(&block)" do
  it "passes when actual returns true for :predicate?(&block)" 


  it "fails when actual returns false for :predicate?(&block)" 


  it "fails when actual does not respond to :predicate?" 


  it 'passes the block on to the present-tense predicate form' 


  it 'works with a do..end block for either predicate form' 


  it 'prefers a { ... } block to a do/end block because it binds more tightly' 

end

RSpec.describe "expect(...).not_to be_predicate(&block)" do
  it "passes when actual returns false for :predicate?(&block)" 


  it "fails when actual returns true for :predicate?(&block)" 


  it "fails when actual does not respond to :predicate?" 

end

RSpec.describe "expect(...).to be_predicate(*args, &block)" do
  it "passes when actual returns true for :predicate?(*args, &block)" 


  it "fails when actual returns false for :predicate?(*args, &block)" 


  it "fails when actual does not respond to :predicate?" 

end

RSpec.describe "expect(...).not_to be_predicate(*args, &block)" do
  it "passes when actual returns false for :predicate?(*args, &block)" 


  it "fails when actual returns true for :predicate?(*args, &block)" 


  it "fails when actual does not respond to :predicate?" 

end

RSpec.describe "expect(...).to be_truthy" do
  it "passes when actual equal?(true)" 


  it "passes when actual is 1" 


  it "fails when actual equal?(false)" 

end

RSpec.describe "expect(...).to be_falsey" do
  it "passes when actual equal?(false)" 


  it "passes when actual equal?(nil)" 


  it "fails when actual equal?(true)" 

end

RSpec.describe "expect(...).to be_falsy" do
  it "passes when actual equal?(false)" 


  it "passes when actual equal?(nil)" 


  it "fails when actual equal?(true)" 

end

RSpec.describe "expect(...).to be_nil" do
  it "passes when actual is nil" 


  it "fails when actual is not nil" 

end

RSpec.describe "expect(...).not_to be_nil" do
  it "passes when actual is not nil" 


  it "fails when actual is nil" 

end

RSpec.describe "expect(...).to be <" do
  it "passes when < operator returns true" 


  it "fails when < operator returns false" 


  it "fails when < operator raises ArgumentError" 


  it 'fails when < operator is not defined' 


  it "describes itself" 


  it 'does not lie and say that it is equal to a number' 

end

RSpec.describe "expect(...).to be <=" do
  it "passes when <= operator returns true" 


  it "fails when <= operator returns false" 


  it "fails when <= operator raises ArgumentError" 


  it 'fails when <= operator is not defined' 

end

RSpec.describe "expect(...).to be >=" do
  it "passes when >= operator returns true" 


  it "fails when >= operator returns false" 


  it "fails when >= operator raises ArgumentError" 


  it 'fails when >= operator is not defined' 

end

RSpec.describe "expect(...).to be >" do
  it "passes when > operator returns true" 


  it "fails when > operator returns false" 


  it "fails when > operator raises ArgumentError" 


  it 'fails when > operator is not defined' 

end

RSpec.describe "expect(...).to be ==" do
  it "passes when == operator returns true" 


  it "fails when == operator returns false" 


  it "fails when == operator raises ArgumentError" 


  it 'works when the target overrides `#send`' 

end

RSpec.describe "expect(...).to be =~" do
  it "passes when =~ operator returns true" 


  it "fails when =~ operator returns false" 

end

RSpec.describe "should be =~", :uses_should do
  it "passes when =~ operator returns true" 


  it "fails when =~ operator returns false" 

end

RSpec.describe "expect(...).to be ===" do
  it "passes when === operator returns true" 


  it "fails when === operator returns false" 

end

RSpec.describe "expect(...).not_to with comparison operators" do
  it "coaches user to stop using operators with expect().not_to with numerical comparison operators" 


  it "coaches users to stop using negation with string comparison operators" 

end

RSpec.describe "expect(...).not_to with equality operators" do
  it "raises normal error with expect().not_to with equality operators" 

end

RSpec.describe "expect(...).to be" do
  it "passes if actual is truthy" 


  it "fails if actual is false" 


  it "fails if actual is nil" 


  it "describes itself" 

end

RSpec.describe "expect(...).not_to be" do
  it "passes if actual is falsy" 


  it "fails on true" 

end

RSpec.describe "expect(...).to be(value)" do
  it "delegates to equal" 

end

RSpec.describe "expect(...).not_to be(value)" do
  it "delegates to equal" 

end

RSpec.describe "'expect(...).to be' with operator" do
  it "includes 'be' in the description" 

end


RSpec.describe "arbitrary predicate with DelegateClass" do
  it "accesses methods defined in the delegating class (LH[#48])" 

end

RSpec.describe "be_a, be_an" do
  it "passes when class matches" 


  it "fails when class does not match" 

end

RSpec.describe "be_an_instance_of" do
  it "passes when direct class matches" 


  it "fails when class is higher up hierarchy" 

end

