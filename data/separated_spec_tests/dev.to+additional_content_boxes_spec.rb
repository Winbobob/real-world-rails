require "rails_helper"

RSpec.describe "AdditionalContentBoxes", type: :request do
  let(:tag) { create(:tag) }
  let(:user) { create(:user) }
  let(:regular_article) { create(:article, user: user, tags: [tag.name]) }

  describe "GET /additional_content_boxes" do
    it "returns an article if there is a published/featured one" 


    it "returns no article if not published/featured" 


    it "returns boosted article if available" 

  end
end

