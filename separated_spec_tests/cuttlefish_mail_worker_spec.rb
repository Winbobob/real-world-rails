require "spec_helper"
require "ostruct"

describe MailWorker, '#perform' do
  let(:team) { Team.create! }
  let(:app) { team.apps.create!(name: "test") }
  let(:mail) {
    Mail.new do
      subject "Hello!"
      from "Matthew Landauer <matthew@foo.com>"
      to "Some other place <foo@bar.com>"
      body "Let's say some stuff"
    end
  }


  it "should save the email information and forward it" 


  it "should forward the email information" 


  it "should not save the email information if the forwarding fails" 


  it "should discard the return path email and use the email contents as the from address" 

end

