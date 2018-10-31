require "rails_helper"

RSpec.describe AssetNotification, type: :mailer do
  fixtures :assets, :users

  describe "upload_notification" do
    let(:mail) { AssetNotification.upload_notification(assets(:valid_mp3), users(:sudara).email) }

    it "renders the headers" 


    it "includes the unfollow link" 


    it "includes the unsubscribe link" 

  end
end

