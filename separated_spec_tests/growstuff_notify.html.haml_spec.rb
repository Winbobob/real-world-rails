require 'rails_helper'

describe 'notifier/notify.html.haml', type: "view" do
  before(:each) do
    @notification = FactoryBot.create(:notification)
    @reply_link = "http://example.com"
    @signed_message = "EncryptedMessage"
    assign(:reply_link, @reply_link)
    render
  end

  it 'should say that you have a message' 


  it 'should include notification metadata' 


  it 'should include a reply link' 


  it 'should contain a link to your inbox' 


  it 'should have fully qualified URLs' 

end

