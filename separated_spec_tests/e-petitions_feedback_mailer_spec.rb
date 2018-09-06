require 'rails_helper'

RSpec.describe FeedbackMailer, type: :mailer do
  describe "send_feedback" do
    let(:feedback) { Feedback.new(:email => "foo@example.com", :comment => "I love your site!") }
    let(:mail) { FeedbackMailer.send_feedback(feedback) }

    it "renders the headers" 


    it "renders the body" 


    it "sets the reply-to to be the email address" 

  end
end

