require "rails_helper"

feature "Books" do
  let!(:author) { create_author! }
  let!(:book) { create_book! }

  before do
    actually_sign_in_as(author)
  end

  context "navigating" do
    it "sees a list of frontmatter / mainmatter / backmatter" 


    it "can navigate through all the book" 

  end
end

