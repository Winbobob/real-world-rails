require "rails_helper"

RSpec.describe ReadingList do
  let(:user) { create(:user) }
  let(:article) { create(:article) }
  let(:article2) { create(:article) }
  let(:article3) { create(:article) }

  def create_reaction(user, article)
    Reaction.create!(
      user_id: user.id,
      reactable_id: article.id,
      reactable_type: "Article",
      category: "readinglist",
    )
  end

  it "returns count of articles if they've been reacted to" 


  it "returns an article if it's been reacted to" 


  it "returns cached ids of articles that have been reacted to" 


  it "returns an empty count if no reacted article" 

end

