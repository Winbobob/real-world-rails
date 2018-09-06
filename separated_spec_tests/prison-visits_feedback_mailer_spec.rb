require 'rails_helper'

RSpec.describe FeedbackMailer do
  let :subject do
    FeedbackMailer
  end

  let :feedback do
    Feedback.new(referrer: "ref")
  end

  it "responds with a referrer in a subject" 

end

