# http://localhost:3000/api/comments?a_id=23
require "rails_helper"

RSpec.describe "VideoStatesUpdate", type: :request do
  let(:authorized_user) { create(:user, :super_admin, secret: "TEST_SECRET") }
  let(:regular_user) { create(:user, secret: "TEST_SECRET") }
  let(:article) { create(:article, video_code: "DUMMY_VID_CODE") }

  describe "POST /video_states" do
    it "updates video state" 


    it "rejects non-authorized users" 

  end
end

