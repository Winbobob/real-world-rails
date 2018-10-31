# frozen_string_literal: true

RSpec.describe "bundle command names" do
  it "work when given fully" 


  it "work when not ambiguous" 


  it "print a friendly error when ambiguous" 


  context "when cache_command_is_package is set" do
    before { bundle! "config cache_command_is_package true" }

    it "dispatches `bundle cache` to the package command" 

  end
end

