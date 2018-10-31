require 'open_food_network/subscription_summarizer'

module OpenFoodNetwork
  describe SubscriptionSummarizer do
    let(:order) { create(:order) }
    let(:summarizer) { OpenFoodNetwork::SubscriptionSummarizer.new }

    describe "#summary_for" do
      let(:order) { double(:order, distributor_id: 123) }

      context "when a summary for the order's distributor doesn't already exist" do
        it "initializes a new summary object, and returns it" 

      end

      context "when a summary for the order's distributor already exists" do
        let(:summary) { double(:summary) }

        before do
          summarizer.instance_variable_set(:@summaries, { 123 => summary })
        end

        it "returns the existing summary object" 

      end
    end

    describe "recording events" do
      let(:order) { double(:order) }
      let(:summary) { double(:summary) }
      before { allow(summarizer).to receive(:summary_for).with(order) { summary } }

      describe "#record_order" do
        it "requests a summary for the order and calls #record_order on it" 

      end

      describe "#record_success" do
        it "requests a summary for the order and calls #record_success on it" 

      end

      describe "#record_issue" do
        it "requests a summary for the order and calls #record_issue on it" 

      end

      describe "#record_and_log_error" do
        before do
          allow(order).to receive(:number) { "123" }
        end

        context "when errors exist on the order" do
          before do
            allow(order).to receive(:errors) { double(:errors, any?: true, full_messages: ["Some error"]) }
          end

          it "sends error info to the rails logger and calls #record_issue on itself with an error message" 

        end

        context "when no errors exist on the order" do
          before do
            allow(order).to receive(:errors) { double(:errors, any?: false) }
          end

          it "falls back to calling record_issue" 

        end
      end
    end

    describe "#send_placement_summary_emails" do
      let(:summary1) { double(:summary) }
      let(:summary2) { double(:summary) }
      let(:summaries) { { 1 => summary1, 2 => summary2 } }
      let(:mail_mock) { double(:mail, deliver: true) }

      before do
        summarizer.instance_variable_set(:@summaries, summaries)
      end

      it "sends a placement summary email for each summary" 

    end

    describe "#send_placement_summary_emails" do
      let(:summary1) { double(:summary) }
      let(:summary2) { double(:summary) }
      let(:summaries) { { 1 => summary1, 2 => summary2 } }
      let(:mail_mock) { double(:mail, deliver: true) }

      before do
        summarizer.instance_variable_set(:@summaries, summaries)
      end

      it "sends a placement summary email for each summary" 

    end
  end
end

