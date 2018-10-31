require "spec_helper"

describe NotificationsMailer do
  before :each do
    NotificationsMailer.default to: "test@dsd.io"
    @form_params = {
      :feedback => {
        "rating" => 5,
        "text" => "what a beautiful site",
        "email" => "hermajesty@imperialawesomeness.com"
      },
      "browser" => "Chrome",
      "service" => "Court finder",
      "referrer" => "some-page-on-the-site"
    }
    @feedback_email = NotificationsMailer.new_message(@form_params)
  end

  it "feedback notification email contains user-submitted feedback rating" 


  it "feedback notification email contains user-submitted feedback text" 


  it "feedback notification email contains user-submitted feedback email" 


  it "feedback notification email contains user browser" 


  it "feedback notification email contains service name" 


  it "feedback notification email contains referrer" 


  it "feedback notification email subject contains referrer" 

end

