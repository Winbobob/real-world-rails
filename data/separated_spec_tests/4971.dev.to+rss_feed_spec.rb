require "rails_helper"

RSpec.describe "RssFeed", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:organization) { FactoryBot.create(:organization) }
  let(:article) { FactoryBot.create(:article, user_id: user.id, featured: true) }

  describe "GET query page" do
    it "renders feed" 

    it "renders user feed" 

    it "renders organization feed" 

  end
end

