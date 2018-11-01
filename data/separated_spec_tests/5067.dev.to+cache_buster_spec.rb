require "rails_helper"

RSpec.describe CacheBuster do
  let(:user) { create(:user) }
  let(:article) { create(:article, user_id: user.id) }
  let(:comment) { create(:comment, user_id: user.id, commentable_id: article.id) }

  it "busts comment" 

  it "busts article" 

  it "busts featured article" 

end

