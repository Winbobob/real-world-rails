require 'spec_helper'

##
# Dummy class, so that we can mix in the Logging module and test it.
#
class TestLogging
  include Logging
end

describe Logging do

  before :all do
    @object = TestLogging.new
  end

  after(:all) do
    Logging.silent = true
    Logging.debug  = false
    Logging.trace  = false
  end

  describe "when setting a custom logger" do

    it "should not accept a logger object that is not sane" 


    it "should accept a legit custom logger object" 


  end

  describe "logging routines (with a custom logger)" do

    before :each do
      @readpipe, @writepipe = IO.pipe
      @custom_logger = Logger.new(@writepipe)
      Logging.logger = @custom_logger
      Logging.level  = Logger::INFO
    end

    after :each do
      [@readpipe, @writepipe].each do |pipe|
        pipe.close if pipe
      end
    end

    #
    #
    it "at log level DEBUG should output logs at debug level" 


    #
    #
    it "at log level NOT DEBUG should NOT output logs at debug level" 


    #
    #
    it "should be usable (at the module level) for logging" 


    # These should be the last test we run for the 'log' functionality
    #
    it "should not log messages if silenced via module method" 


    it "should not log anything if silenced via module methods" 


    it "should not log anything if silenced via instance methods" 


  end # Logging tests (with custom logger)

  describe "logging routines (with NO custom logger)" do

    it "should log at debug level if debug logging is enabled " 


    it "should be usable (at the module level) for logging" 


  end

  describe "trace routines (with custom trace logger)" do

    before :each do
      @custom_tracer = Logger.new(STDERR)
      Logging.trace_logger = @custom_tracer
    end

    it "should NOT emit trace messages if tracing is disabled" 


    it "should emit trace messages when tracing is enabled" 


  end # Tracer tests (with custom tracer)

  describe "tracing routines (with NO custom logger)" do

    it "should emit trace messages if tracing is enabled " 


    it "should be usable (at the module level) for logging" 


  end # tracer tests (no custom logger)

end

