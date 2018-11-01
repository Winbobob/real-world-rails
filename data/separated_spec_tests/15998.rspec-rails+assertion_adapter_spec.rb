require "spec_helper"

describe RSpec::Rails::MinitestAssertionAdapter do
  include RSpec::Rails::MinitestAssertionAdapter

  RSpec::Rails::Assertions.public_instance_methods.select{|m| m.to_s =~ /^(assert|flunk|refute)/}.each do |m|
    if m.to_s == "assert_equal"
      it "exposes #{m} to host examples" 

    else
      it "exposes #{m} to host examples" 

    end
  end

  it "does not expose internal methods of Minitest" 


  it "does not expose Minitest's message method" 


  if ::Rails::VERSION::STRING >= '4.0.0'
    # In Ruby <= 1.8.7 Object#methods returns Strings instead of Symbols. They
    # are all converted to Symbols to ensure we always compare them correctly.
    it 'does not leak TestUnit specific methods into the AssertionDelegator' 

  else
    it 'includes methods required by TestUnit into the AssertionDelegator' 

  end
end

