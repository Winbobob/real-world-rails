require 'spec_helper'

Spork.class_eval do
  def self.reset!
    @state = nil
    @using_spork = false
    @already_ran = nil
    @each_run_procs = nil
  end
end

describe Spork do
  before(:each) do
    Spork.reset!
    @ran = []
  end
  
  def spec_helper_simulator
    Spork.prefork do
      @ran << :prefork
    end
    
    Spork.each_run do
      @ran << :each_run
    end
    @ran
  end
  
  it "only runs the preload block when preforking" 

  
  it "only runs the each_run block when running" 

  
  it "runs both blocks when Spork not activated" 

  
  it "prevents blocks from being ran twice" 

  
  it "runs multiple prefork and each_run blocks at different locations" 

  
  it "expands a caller line, preserving the line number" 

  
  describe "#using_spork?" do
    it "returns true if Spork is being used" 

  end

  describe "#trap_method" do
    before(:each) do
      Spork.exec_prefork { }
      
      Object.class_eval do
        class TrapTest
          def self.output
            @output ||= []
          end
          
          def hello
            TrapTest.output << 'hello'
          end
          
          def goodbye
            TrapTest.output << 'goodbye'
          end
          
          def say_something!
            TrapTest.output << 'something'
          end
        end
      end
      @trap_test = TrapTest.new
    end
    
    after(:each) do
      Object.send(:remove_const, :TrapTest)
    end
    
    it "delays execution of a method until after Spork.exec_each_run is called" 

    
    it "works with methods that have punctuation" 

  end
  
  describe "#trap_class_method" do
    before(:each) do
      Object.class_eval do
        class TrapTest
          def self.output
            @output ||= []
          end
          
          def self.hello
            output << 'hello'
          end
          
          def self.goodbye
            output << 'goodbye'
          end
        end
      end
    end
    
    after(:each) do
      Object.send(:remove_const, :TrapTest)
    end
    
    it "delays execution of a method until after Spork.exec_each_run is called" 

  end
end

