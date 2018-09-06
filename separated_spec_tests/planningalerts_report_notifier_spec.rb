require "spec_helper"

describe ReportNotifier do
  before :each do
    @comment = VCR.use_cassette('planningalerts') do
      build(:comment,
            application: build(:application, id: 2),
            text: "I'm saying something abusive",
            name: "Jack Rude",
            email: "rude@foo.com",
            id: "23")
    end
    @report = build(:report,
                     name: "Joe Reporter",
                     email: "reporter@foo.com",
                     comment: @comment,
                     details: "It's very rude!")
    @notifier = ReportNotifier.notify(@report)
  end
  
  it "should come from the moderator's email address" 


  it "should have a replyto of the reporter's email address" 

  
  it "should go to the moderator email address" 

  
  it "should tell the moderator what the email is about" 

  
  it "should tell the moderator everything they need to know to decide on what to do with the report" 


  it "doesn’t include the commenters email as this could lead to data leak" 

end

