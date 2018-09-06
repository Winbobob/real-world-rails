require "spec_helper"

describe User, "spam" do

  it "flags users with a high spam count as spammers" 


  it "suspends spammers" 


  it "knows what content has been flagged as spam" 


  it "doesn't count resolved flags toward spam content" 


  it "updates spam count when content is flagged" 


  it "decrements spam count when flags are resolved" 


  it "knows all the spam flags on a users content" 


  it "does not consider spam flags on a user a flag on another users content" 


  it "does not check for spam if description is blank" 


  describe "set_as_non_spammer_if_meets_criteria" do
    it "should set spammer to false after 3 research grade observations" 

  end
end

