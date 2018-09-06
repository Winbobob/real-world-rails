require 'spec_helper'

describe "PQState#progress_changer" do
  def stub_pq(overrides={})
    double('test-pq',
      {
        no_response?: true,
        rejected?: false,
        action_officers_pqs: double('ao-pqs', any?: true, all_rejected?: false),
        action_officer_accepted: nil,
        transfer_out_ogd_id: nil
      }.merge(overrides)
    )
  end

  subject {
    PQState.progress_changer
  }

  describe "#validate_transition_graph!" do
    it "should not raise errors" 

  end

  describe "#next_state" do
    context "when moving from the initial, to an intermediate state of the graph" do
      it "returns the intermediate state" 

    end

    context "moving from an intermediate state to a possible final state" do
      it "returns the final state" 

    end

    context "moving from the initialial to the final state" do
      it "returns the final state" 

    end
  end
end

