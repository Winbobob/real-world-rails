require "rails_helper"

RSpec.describe StatusController, type: :controller do
  describe "GET index" do
    it "returns 200 status code" 


    context "HTML request" do
      it "returns OK in body" 

    end

    context "JSON request" do
      it "returns a JSON status :ok" 

    end

    context "XML request" do
      let(:xml) { "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Response>\n  <Status>OK</Status>\n</Response>" }
      it "returns a XML status :ok" 

    end

    context "other MIME type" do
      it "returns OK in body" 

    end
  end

  describe "GET /ping" do
    context "with a failing request" do
      it "returns 500 status codes for situations where an error occurs" 

    end

    context "with a valid config setup" do
      let(:fake_response) { { irrelevant_data: "irrelevant_response" }.with_indifferent_access }

      before :each do
        allow_any_instance_of(PingResponse).to receive(:ok?).and_return(true)
        allow_any_instance_of(PingResponse).to receive(:data).and_return(fake_response)
      end

      it "returns an :ok status code for json requests" 


      it "returns the expected JSON result" 


      it "returns an :ok status code for non-json requests" 

    end
  end
end

