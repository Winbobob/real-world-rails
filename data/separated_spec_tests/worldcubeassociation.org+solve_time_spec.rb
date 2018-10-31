# frozen_string_literal: true

require 'solve_time'

def solve_time(centis)
  SolveTime.new('333', :single, centis)
end

RSpec.describe "SolveTime" do
  it "DNF" 


  it "DNS" 


  it "skipped?" 


  context "333mbf" do
    it "set number attempted" 

  end

  describe "ordering" do
    it "orders regular solves" 


    it "treats skipped as worst" 


    it "treats DNS as worse than DNF" 


    it "treats DNS as worse than a finished solve" 

  end

  describe "clock_format" do
    it "prefixes with 0 for times less than 1 second" 


    it "does not prefix with 0 for times between 1 and 10 seconds" 


    it "formats just seconds" 


    it "formats minutes" 


    it "formats hours" 


    describe "333fm" do
      it "formats best" 


      it "formats average" 

    end

    describe "333mbf" do
      it "formats best" 


      it "formats with time less than 60 seconds" 

    end

    describe "333mbo" do
      it "formats best" 


      it "handles missing times" 

    end
  end
end

