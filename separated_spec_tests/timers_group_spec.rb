# frozen_string_literal: true

RSpec.describe Timers::Group do
  describe "#wait" do
    it "calls the wait block with nil" 


    it "calls the wait block with an interval" 

  end

  it "sleeps until the next timer" 


  it "fires instantly when next timer is in the past" 


  it "calculates the interval until the next timer should fire" 


  it "fires timers in the correct order" 


  it "raises TypeError if given an invalid time" 


  describe "recurring timers" do
    it "continues to fire the timers at each interval" 

  end

  it "calculates the proper interval to wait until firing" 


  describe "pause and continue timers" do
    before(:each) do
      @interval = TIMER_QUANTUM * 2

      @fired = false
      @timer = subject.after(@interval) { @fired = true }
      @fired2 = false
      @timer2 = subject.after(@interval) { @fired2 = true }
    end

    it "does not fire when paused" 


    it "fires when continued after pause" 


    it "can pause all timers at once" 


    it "can continue all timers at once" 


    it "can fire the timer directly" 

  end

  describe "delay timer" do
    it "adds appropriate amount of time to timer" 

  end

  describe "delay timer collection" do
    it "delay on set adds appropriate amount of time to all timers" 

  end

  describe "on delaying a timer" do
    it "fires timers in the correct order" 

  end

  describe "#inspect" do
    it "before firing" 


    it "after firing" 


    it "recurring firing" 

  end

  describe "#fires_in" do
    let(:interval) { TIMER_QUANTUM * 2 }

    it "calculates the interval until the next fire if it's recurring" 


    context "when timer is not recurring" do
      let!(:timer) { subject.after(interval) { true } }

      it "calculates the interval until the next fire if it hasn't already fired" 


      it "calculates the interval since last fire if already fired" 

    end
  end
end

