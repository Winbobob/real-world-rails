# frozen_string_literal: true

require "spec_helper"

describe EmailServices::Create do
  # let(:app) { team.apps.create!(name: "Test") }
  let(:app) { create(:app) }
  let(:create_email) do
    EmailServices::Create.call(
      from: "contact@cuttlefish.io",
      to: "matthew@openaustralia.org",
      cc: nil,
      subject: "Test",
      text_part: "Hello. How are you?",
      html_part: "<p>Hello. How are you?</p>",
      app_id: app.id
    )
  end

  it "should send a test email" 


  it "should create an email" 


  it "should return the service object" 


  it "should return an email" 


  it "should not be possible to write to the result" 

end

