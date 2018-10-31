require "rails_helper"

RSpec.describe Suggester::Articles::Classic do
  let(:user) { create(:user) }
  let(:tag) { create(:tag, supported: true) }
  let(:article) { create(:article, tags: [tag.name], featured: true) }
  let(:reaction) { create(:reaction, user_id: user.id, reactable_id: article.id) }

  it "returns an article" 


  it "does not return article if none exists with enough reactions" 


  # rubocop:disable RSpec/ExampleLength
  it "returns single article if multiple qualify" 

  # rubocop:enable RSpec/ExampleLength
end

