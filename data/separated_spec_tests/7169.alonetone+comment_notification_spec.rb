require "rails_helper"

RSpec.describe CommentNotification, type: :mailer do
  fixtures :comments, :assets

  describe "new_comment by user" do
    let(:asset) { assets(:valid_mp3) }
    let(:comment) { comments(:valid_comment_on_asset_by_user) }
    let(:mail) { CommentNotification.new_comment(comment, asset)}

    it "renders the headers" 


    it "renders the body" 


    it "includes the unsubscribe link" 

  end

  describe "new_comment by guest" do
    let(:asset) { assets(:valid_mp3) }
    let(:comment) { comments(:valid_comment_on_asset_by_guest) }
    let(:mail) { CommentNotification.new_comment(comment, asset)}

    it "renders the headers" 


    it "renders the body" 


    it "includes the unsubscribe link" 

  end
end

