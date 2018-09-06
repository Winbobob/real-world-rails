require 'spec_helper'

describe FeedbacksController do
  it "displays feedback form" 


  before :each do
    @feedback_params = FactoryGirl.attributes_for(:feedback, "rating" => 5, "text" => "what a beautiful site")
    NotificationsMailer.default to: "test@dsd.io", from: "test@dsd.io"
  end

  it "redirects to show page on successful feedback submission" 


  it "sends notification email on successful feedback submission" 

end

