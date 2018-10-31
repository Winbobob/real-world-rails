require 'rails_helper'

describe "notifications/index" do
  before(:each) do
    @member = FactoryBot.create(:member)
    controller.stub(:current_user) { @member }
  end

  context "ordinary notifications" do
    before(:each) do
      @notification = FactoryBot.create(:notification, sender: @member,
                                                       recipient: @member)
      assign(:notifications, Kaminari.paginate_array([@notification, @notification]).page(1))
      render
    end

    it "renders a list of notifications" 


    it "links to sender's profile" 

  end

  context "no subject" do
    it "shows (no subject)" 

  end

  context "whitespace-only subject" do
    it "shows (no subject)" 

  end
end

