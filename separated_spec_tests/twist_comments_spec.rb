require 'rails_helper'

describe 'commenting' do 
  let!(:author) { create_author! }
  let!(:reviewer) { create_user! }
  let!(:book) { create_book! }
  let!(:chapter) { book.chapters.first }
  let!(:element) { chapter.elements.first }
  let!(:note) { element.notes.create(:user => reviewer, :text => "My favourite element.", :number => 1) }
  let!(:comment_text) { "This is a typical comment" }

  def assert_comment_form_blank!
    expect(find("#comment_text").text).to be_blank
  end

  def assert_comment_present!
    within("#comments") do
      expect(page).to have_content(comment_text)
    end
  end

  context "as an author" do
    before do
      actually_sign_in_as(author)
      visit book_note_path(book, note)
      fill_in "comment_text", :with => comment_text
    end

    it "a normal comment" 


    it "accepting a note" 


    it "rejecting a note" 

  end
end

