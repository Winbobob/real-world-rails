# http://localhost:3000/api/comments?a_id=23
require "rails_helper"

RSpec.describe "ArticlesApi", type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  before do
    user.update(secret: "TEST_SECRET")
    user.add_role(:super_admin)
  end

  describe "POST /api/reactions" do
    it "creates a new reactions" 


    it "rejects non-authorized users" 

  end
end

