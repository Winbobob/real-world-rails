require "spec_helper"

describe "ActsAsSpammable", "ActiveRecord" do

  before(:all) do
    User.destroy_all
    @user = User.make!
    Rakismet.disabled = false
  end

  after(:all) do
    Rakismet.disabled = true
  end

  it "recognizes spam" 


  it "recognizes non-spam" 


  it "knows when things have been flagged as spam" 


  it "knows when things have been flagged as spam when flags have been preloaded" 


  it "knows when thing have not been flagged as spam" 


  it "resolved flags are not spam" 


  it "does not check for spam unless a spammable field is modified" 


  it "does not check for spam all fields are blank" 


  it "creates a spam flag when the akismet check fails" 


  it "ultimately updates the users spam count" 


  it "knows which models are spammable" 


  it "identifies flagged content as known_spam?" 


  it "identifies guide taxa as not spam if its sections aren't spam" 


  it "identifies guide taxa as known_spam? if its sections are spam" 


  it "identifies spammer-owned content as owned_by_spammer?" 


  it "users are spam if they are spammers" 


  it "all models respond to known_spam?" 


  it "all models respond to spam_or_owned_by_spammer?" 


  it "does not allow spammers to create objects" 


  describe "User Exceptions" do
    it "checks users for spam when they have descriptions" 


    it "does not check user life lists that have default values" 


    it "does not users with no description" 


    it "knows when LifeLists have default values" 

  end

  describe "not_flagged_as_spam" do
    it "includes records not flagged as spam" 


    it "includes records by users with unknown spammer status" 


    it "excludes records flagged as spam" 


    it "excludes records not flagged as spam by spammers" 

  end

  describe "spam" do
    it "tells akismet about spam" 


    it "does not tell akismet about spam if there is no content" 


    it "does not tell akismet about spam if they already flagged it" 


    it "tells akismet when they did flag it, but that flag is resolved" 


    it "does not tell akismet about spam flags they created" 

  end

  describe "ham" do
    it "tells akismet about false positive ham on resolved akismet flags" 


    it "tells akismet about ham on destroyed akismet flags" 


    it "does not tell akismet about ham if there is no content" 


    it "does not tell akismet about ham on resolved or destroyed user flags" 


  end

end

