describe MeetingsHelper do

  describe "get_meeting_members" do
    let(:meeting){FactoryBot.create(:meeting, id:1)}
    let(:current_user) { FactoryBot.create(:meeting_member, meeting: meeting).user }

    it "displays not attending with a link to join" 


    it "displays attending with a link to leave" 


    it "displays there is one spot to join with a link" 


    it "displays there are spots to join with a link" 


    it "displays there is no room to join " 

  end
end

