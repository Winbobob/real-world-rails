require "rails_helper"

RSpec.describe AlbumNotification, type: :mailer do
  fixtures :playlists, :users

  describe "album_release" do
    let(:mail) { AlbumNotification.album_release(playlists(:owp), users(:sudara).email) }

    it "renders the headers" 


    it "includes the unfollow link" 


    it "includes the unsubscribe link" 

  end
end

