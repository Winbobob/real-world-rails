require 'spec_helper'

describe PQState do
  let(:pq) { double('pq-stub') }

  let(:transitions) {
    pred = proc { true }

    [PQState::Transition.new('a', 'b', pred),
     PQState::Transition.new('b', 'c', pred),
     PQState::Transition.new('c', 'final_state', pred)]
  }

  let(:state_machine) {
    PQState::StateMachine.new(['final_state'], transitions)
  }

  describe "#next_state" do
    context "when the supplied state does not exist" do
      it "raises an ArgumentError" 

    end

    context "when the supplied state exists" do
      it "returns the next valid state" 

    end
  end
end

