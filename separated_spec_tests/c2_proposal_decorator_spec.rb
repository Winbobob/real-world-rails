describe ProposalDecorator do
  describe "#detailed_status" do
    context "pending" do
      it "returns 'pending [next step type]'" 

    end

    context "canceled or completed" do
      it "returns regular status" 

    end
  end
  describe "#total_price" do
    context "client data present" do
      it "returns total price from client data" 

    end

    context "no client data" do
      it "returns an empty string" 

    end
  end
  describe "#waiting_text_for_status_in_table" do
    context "when the proposal has an actionable step" do
      it "returns the correct text" 

    end
    context "when the proposal does not have an actionable step" do
      it "returns the correct default text" 

    end
  end

  describe "#step_text_for_user" do
    context "when the active step is an approval" do
      it "fetches approval text" 

    end

    context "when the active step is a purchase" do
      it "fetches purchase text" 

    end
  end

  describe "#final_completed_date and #total_completion_days" do
    include ProposalSpecHelper

    context "when the proposal is complete" do
      it "returns completed_at date of last step" 


      it "returns empty string when no steps are defined" 

    end

    context "when the proposal is not complete" do
      it "returns empty string for final_completed_date and total_completion_days" 

    end
  end

  describe "#final_step_label" do
    context "purchase step" do
      it "looks like a Purchase" 

    end

    context "approval step" do
      it "looks like an Approval" 

    end

    context "no step" do
      it "uses generic label" 

    end
  end
end

