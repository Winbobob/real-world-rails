require 'rails_helper'

describe "notifications/show" do
  before(:each) do
    @member = FactoryBot.create(:member)
    @notification = FactoryBot.create(:notification, recipient: @member)
    assign(:notification, @notification)
    @reply_link = assign(:reply_link, new_notification_path)
    controller.stub(:current_user) { @member }
    render
  end

  it "renders attributes" 


  it "includes a delete button" 


  it "includes a reply button" 

end

