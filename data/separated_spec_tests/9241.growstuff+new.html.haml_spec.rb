require 'rails_helper'

describe "notifications/new" do
  before(:each) do
    @recipient = FactoryBot.create(:member)
    @sender = FactoryBot.create(:member)
    assign(:notification, FactoryBot.create(:notification, recipient_id: @recipient.id, sender_id: @sender.id))
    sign_in @sender
    controller.stub(:current_user) { @sender }
  end

  it "renders new message form" 


  it "tells you who the recipient is" 


  it "puts the recipient in a hidden field" 


  it "fills in the subject if provided" 


  it "leaves the subject empty if not provided" 


  it "Tells you to write your message here" 


  it 'shows markdown help' 

end

