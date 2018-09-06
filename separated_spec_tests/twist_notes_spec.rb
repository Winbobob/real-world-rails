require 'rails_helper'

describe "notes" do
  let(:author) { create_author! }
  let(:book) { create_book! }
  before do
    login_as(author)
  end
    
  it "can add a new note to a paragraph", :js => true do
    visit book_chapter_path(book, book.chapters.first)
    element = book.chapters.first.elements.first

    within "#note_button_#{element.nickname}" do
      click_link "0 notes +"
    end

    comment_box = find(".note_comments_text textarea")
    comment_box.set("This is a **test** note!")
    click_button "Leave Note"
    expect(page).to have_content("1 note +")
    click_link "All notes for this chapter"
    click_link "This is a test note!"
    expect(page).to have_content("#{author.email} commented less than a minute ago")
    # Ensure note text shows up correctly in processed markdown.

    within ".comment" do
      within(".body") do
        within("strong") { expect(page).to have_content("test") }
      end
    end

    # And the rest of it.
    expect(page).to have_content("This is a test note!")
    
  end
  
  it "can view all notes for a book" 


  context "changing a note's state" do
    before do
      chapter = book.chapters.first
      element = chapter.elements.first
      @note = element.notes.create!(
        user: author, 
        number: 1
      )
      @note.comments.create!(
        text: "This is a test note!",
        user: author
      )
      
      visit book_path(book)
      click_link "All notes for this book"
      click_link "This is a test note!"
    end

    it "can accept a note" 


    it "can reject a note" 

  end

  it "can reopen a note" 


end

