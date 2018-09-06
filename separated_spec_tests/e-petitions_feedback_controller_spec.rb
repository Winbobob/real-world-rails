require 'rails_helper'

RSpec.describe FeedbackController, type: :controller do
  describe "GET /feedback" do
    it "is successful" 

  end

  describe "POST /feedback" do
    def do_post(attributes = {})
      perform_enqueued_jobs do
        post :create, feedback: attributes
      end
    end

    context "with valid input" do
      it "is successful" 


      it "sends an email" 

    end

    context "with invalid input" do
      it "does not send an email" 


      it "returns the user to the form" 

    end
  end

  describe "GET /feedback/thanks" do
    it "is successful" 

  end
end

