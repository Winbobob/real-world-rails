RSpec.describe "expect { ... }.to raise_error" do
  it_behaves_like("an RSpec matcher", :valid_value => lambda { raise "boom" },
                                      :invalid_value => lambda { }) do
    let(:matcher) { raise_error Exception }
  end

  it "passes if anything is raised" 


  it "issues a warning when used without an error class or message" 


  it 'issues a warning that includes the current error when used without an error class or message' 


  it "issues a warning that does not include current error when it's not present" 


  it "raises an exception when configured to do so" 


  it "can supresses the warning when configured to do so", :warn_about_potential_false_positives do
    RSpec::Expectations.configuration.warn_about_potential_false_positives = false
    expect_no_warnings
    expect { raise }.to raise_error
  end

  it "can supresses the warning when configured to do so", :warn_about_potential_false_positives do
    RSpec::Expectations.configuration.on_potential_false_positives = :nothing
    expect_no_warnings
    expect { raise }.to raise_error
  end

  it 'does not issue a warning when an exception class is specified (even if it is just `Exception`)' 


  it 'does not issue a warning when a message is specified' 


  it 'does not issue a warning when a block is passed' 


  it "passes if an error instance is expected" 


  it 'passes if an error instance with a non string message is raised' 


  it "fails if a different error instance is thrown from the one that is expected" 


  it "passes if an error class is expected and an instance of that class is thrown" 


  it "fails if nothing is raised" 

end

RSpec.describe "raise_exception aliased to raise_error" do
  it "passes if anything is raised" 

end

RSpec.describe "expect { ... }.to raise_error {|err| ... }" do
  it "passes if there is an error" 


  it "passes the error to the block" 

end

RSpec.describe "expect { ... }.to raise_error do |err| ... end" do
  it "passes the error to the block" 

end

RSpec.describe "expect { ... }.to(raise_error { |err| ... }) do |err| ... end" do
  it "passes the error only to the block taken directly by #raise_error" 

end

RSpec.describe "expect { ... }.not_to raise_error" do

  context "with a specific error class" do
    it "issues a warning" 


    it "can supresses the warning when configured to do so", :warn_about_potential_false_positives do
      RSpec::Expectations.configuration.warn_about_potential_false_positives = false
      expect_no_warnings
      expect {"bees"}.not_to raise_error(RuntimeError)
    end
  end

  context "with no specific error class" do
    it "passes if nothing is raised" 


    it "fails if anything is raised" 


    it 'includes the backtrace of the error that was raised in the error message' 


    it 'formats the backtrace using the configured backtrace formatter' 

  end
end

RSpec.describe "expect { ... }.to raise_error(message)" do
  it "passes if RuntimeError is raised with the right message" 


  it "passes if RuntimeError is raised with a matching message" 


  it "passes if any other error is raised with the right message" 


  it "fails if RuntimeError error is raised with the wrong message" 


  it "fails if any other error is raised with the wrong message" 


  it 'includes the backtrace of any other error in the failure message' 

end

RSpec.describe "expect { ... }.to raise_error.with_message(message)" do
  it "raises an argument error if raise_error itself expects a message" 


  it "passes if RuntimeError is raised with the right message" 


  it "passes if RuntimeError is raised with a matching message" 


  it "passes if any other error is raised with the right message" 


  it "fails if RuntimeError error is raised with the wrong message" 


  it "fails if any other error is raised with the wrong message" 

end

RSpec.describe "expect { ... }.not_to raise_error(message)" do
  it "issues a warning" 


  it "can supresses the warning when configured to do so", :warn_about_potential_false_positives do
    RSpec::Expectations.configuration.warn_about_potential_false_positives = false
    expect_no_warnings
    expect {raise 'blarg'}.not_to raise_error(/blah/)
  end
end

RSpec.describe "expect { ... }.to raise_error(NamedError)" do
  it "passes if named error is raised" 


  it "fails if nothing is raised" 


  it "fails if another error is raised (NameError)" 


  it "fails if another error is raised (NameError)" 

end

RSpec.describe "expect { ... }.not_to raise_error(NamedError)" do
  it "issues a warning" 


  it "can supresses the warning when configured to do so", :warn_about_potential_false_positives do
    RSpec::Expectations.configuration.warn_about_potential_false_positives = false
    expect_no_warnings
    expect { }.not_to raise_error(NameError)
  end
end

RSpec.describe "expect { ... }.to raise_error(NamedError, error_message) with String" do
  it "passes if named error is raised with same message" 


  it "fails if nothing is raised" 


  it "fails if incorrect error is raised" 


  it "fails if correct error is raised with incorrect message" 

end

RSpec.describe "expect { ... }.not_to raise_error(NamedError, error_message) with String" do
  it "issues a warning" 


  it "can supresses the warning when configured to do so", :warn_about_potential_false_positives do
    RSpec::Expectations.configuration.warn_about_potential_false_positives = false
    expect_no_warnings
    expect {}.not_to raise_error(RuntimeError, "example message")
  end
end

RSpec.describe "expect { ... }.to raise_error(NamedError, error_message) with Regexp" do
  it "passes if named error is raised with matching message" 


  it "fails if nothing is raised" 


  it "fails if incorrect error is raised" 


  it "fails if correct error is raised with incorrect message" 

end

RSpec.describe "expect { ... }.not_to raise_error(NamedError, error_message) with Regexp" do
  it "issues a warning" 


  it "can supresses the warning when configured to do so", :warn_about_potential_false_positives do
    RSpec::Expectations.configuration.warn_about_potential_false_positives = false
    expect_no_warnings
    expect {}.not_to raise_error(RuntimeError, /ample mess/)
  end
end

RSpec.describe "expect { ... }.to raise_error(NamedError, error_message) { |err| ... }" do
  it "yields exception if named error is raised with same message" 


  it "yielded block fails on it's own right" 


  it "does NOT yield exception if no error was thrown" 


  it "does not yield exception if error class is not matched" 


  it "does NOT yield exception if error message is not matched" 

end

RSpec.describe "expect { ... }.not_to raise_error(NamedError, error_message) { |err| ... }" do
  it "issues a warning" 


  it "can supresses the warning when configured to do so", :warn_about_potential_false_positives do
    RSpec::Expectations.configuration.warn_about_potential_false_positives = false
    expect_no_warnings
    expect {}.not_to raise_error(RuntimeError, "example message") { |err| }
  end
end

RSpec.describe "Composing matchers with `raise_error`" do
  matcher :an_attribute do |attr|
    chain :equal_to do |value|
      @expected_value = value
    end

    match do |error|
      return false unless error.respond_to?(attr)
      error.__send__(attr) == @expected_value
    end
  end

  class FooError < StandardError
    def foo; :bar; end
  end

  describe "expect { }.to raise_error(matcher)" do
    it 'passes when the matcher matches the raised error' 


    it 'passes when the matcher matches the exception message' 


    it 'fails with a clear message when the matcher does not match the raised error' 


    it 'fails with a clear message when the matcher does not match the exception message' 


    it 'provides a description' 

  end

  describe "expect { }.to raise_error(ErrorClass, matcher)" do
    it 'passes when the class and matcher match the raised error' 


    it 'fails with a clear message when the matcher does not match the raised error' 


    it 'provides a description' 

  end

  describe "expect { }.to raise_error(ErrorClass).with_message(matcher)" do
    it 'passes when the class and matcher match the raised error' 


    it 'fails with a clear message when the matcher does not match the raised error' 


    it 'provides a description' 

  end
end

