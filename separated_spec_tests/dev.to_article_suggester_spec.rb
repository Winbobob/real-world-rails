require "rails_helper"

RSpec.describe ArticleSuggester do
  let(:user) { create(:user) }

  before do
    create(:article, user_id: user.id, featured: true)
    create(:article, user_id: user.id, featured: true)
    create(:article, user_id: user.id, featured: true)
    create(:article, user_id: user.id, featured: true)
  end

  it "returns proper number of articles with post with tags" 


  it "returns proper number of articles with post without tags" 


  it "returns proper number articles if number is passed" 

end

