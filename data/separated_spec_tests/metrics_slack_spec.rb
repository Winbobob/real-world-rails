describe "POST /slack" do
  let!(:user) { create(:user, slack_id: "123", slack_name: "steve") }

  context "data point creation" do
    let!(:metric) { create(:metric, pattern: '^((?<user>[^ ]+) )?swore( (?<howbad>badly))?( (?<number>\d+(\.\d+)?) times)?$') }

    it "creates a data point for the matching metric" 


    it "creates a data point with a different number" 


    it "creates a data point with a different user" 


    it "creates a data point with a different number and user" 


    it "accepts decimal numbers" 


    it "saves custom data outside of number and user" 


    it "bombs if the text matches no metric" 


    it "bombs if the text matches multiple metrics" 


    it "bombs if the referenced user is unknown" 


    it "creates a data point for a very simple metric pattern" 


    it "accepts first person pronouns as references to self" 


    it "works case-insensitively" 


    it "returns a custom message" 

  end

  it "provides a help message" 


  it "orders the help message by most recent data point" 

end

