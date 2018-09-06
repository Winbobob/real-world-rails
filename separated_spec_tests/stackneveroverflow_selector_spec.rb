# frozen_string_literal: true

require "spec_helper"
require "timeout"

# Timeouts should be at least this precise (in seconds) to pass the tests
# Typical precision should be better than this, but if it's worse it will fail
# the tests
TIMEOUT_PRECISION = 0.1

RSpec.describe NIO::Selector do
  let(:pair)   { IO.pipe }
  let(:reader) { pair.first }
  let(:writer) { pair.last }

  context "backend" do
    it "knows its backend" 

  end

  context "register" do
    it "registers IO objects" 


    it "raises TypeError if asked to register non-IO objects" 


    it "raises when asked to register after closing" 

  end

  it "knows which IO objects are registered" 


  it "deregisters IO objects" 


  it "reports if it is empty" 


  # This spec might seem a bit silly, but this actually something the
  # Java NIO API specifically precludes that we need to work around
  it "allows reregistration of the same IO object across select calls" 


  context "timeouts" do
    it "waits for a timeout when selecting" 


    it "raises ArgumentError if given a negative timeout" 

  end

  context "wakeup" do
    it "wakes up if signaled to from another thread" 


    it "raises IOError if asked to wake up a closed selector" 

  end

  context "select" do
    it "does not block on super small precision intervals" 


    it "selects IO objects" 


    it "selects closed IO objects" 


    it "iterates across selected objects with a block" 


    it "raises IOError if asked to select on a closed selector" 

  end

  it "closes" 

end

