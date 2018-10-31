require "rails_helper"

RSpec.describe Suggester::Articles::Boosted do
  let(:user) { create(:user) }
  let(:organization) { create(:organization) }
  let(:tag) { create(:tag, supported: true) }
  let(:article) { create(:article, tags: [tag.name], featured: true) }
  let(:reaction) { create(:reaction, user_id: user.id, reactable_id: article.id) }

  it "returns an article" 

end

