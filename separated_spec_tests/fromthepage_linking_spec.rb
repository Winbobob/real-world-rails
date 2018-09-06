require 'spec_helper'

describe "subject linking" do

  before :all do
    @owner = User.find_by(login: OWNER)
    @user = User.find_by(login: USER)
    @collections = Collection.all
    @collection = @collections.first
    @work = @collection.works.first
  end

  before :each do
    login_as(@user, :scope => :user)
  end    

  #it checks to make sure the subject is on the page
  it "looks at subjects in a collection" 


  it "edits a subject's description" do 
    article = Article.first
    visit "/article/show?article_id=#{article.id}"
    expect(page).to have_content("Description")
    #this will fail if a description is already entered
    click_link("Edit the description in the settings tab")
    expect(page).to have_content("Description")
    expect(page).not_to have_content("Related Subjects")
    expect(page).not_to have_content("Delete Subject")
    page.fill_in 'article_source_text', with: "This is the text about my article."
    click_button('Save Changes')
    expect(page).to have_content("This is the text about my article.")
  end

  it "deletes a subject" 


  it "links a categorized subject" 


  it "enters a bad link - no closing braces" 


  it "enters a bad link - no text" 


  it "enters a bad link - single starting bracket" 


  it "enters a bad link - triple brackets" 


  it "creates a link that includes quotes" 


  it "links subjects on a translation" 


  it "tests autolinking in transcription" 


  it "tests autolinking in translation" 


  it "checks the number of subject links" 


end

