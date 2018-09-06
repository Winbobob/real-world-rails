require 'spec_helper'

describe PQState::Validator do
  def t(from, to)
    PQState::Transition.new(from, to, proc { |_| true })
  end

  describe "#check_consistent_state_graph!" do
    # Invalid Graph with dead-end c
    #
    # a -> b -> c
    #      b -> d -> e
    #
    context "when the transition graph has dead ends" do
      it "raises an InconsistentStateGraph error" 

    end

    context "when the transition graph moves backward without dead ends" do
      # Valid Graph resambling the one of PQ Tracker
      #
      #                                                -> x
      # a -> b -> c -> d -> e -> f -> g -> h -> i -> l -> m -> x
      #      b <- c         e      -> g    h      -> l
      #
      it "raises no error" 

    end
  end
end

