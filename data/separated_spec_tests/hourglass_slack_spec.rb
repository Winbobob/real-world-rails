describe "Slack Command" do
  describe "POST /slack" do
    let!(:user) { create(:user) }

    before do
      Timecop.travel(Date.new(2015, 4, 10)) # Friday
      today = Date.current

      create(:day, {
        user: user,
        date: today, # 2015-04-10
        client_hours: 0.0,
        internal_hours: 0.1
      })
      create(:day, {
        user: user,
        date: today - 1.day, # 2015-04-09
        client_hours: 0.1,
        internal_hours: 0.2
      })
      create(:day, {
        user: user,
        date: today.monday, # 2015-04-06
        client_hours: 0.2,
        internal_hours: 0.4
      })
      create(:day, {
        user: user,
        date: today.monday - 1.week, # 2015-03-30
        client_hours: 0.4,
        internal_hours: 0.8
      })
      create(:day, {
        user: user,
        date: today.beginning_of_month, # 2015-04-01
        client_hours: 0.8,
        internal_hours: 1.6
      })
      create(:day, {
        user: user,
        date: today.beginning_of_month - 1.month, # 2015-03-01
        client_hours: 1.6,
        internal_hours: 3.2
      })
      create(:day, {
        user: user,
        date: today.beginning_of_month - 1.month - 1.day, # 2015-02-28
        client_hours: 3.2,
        internal_hours: 6.4
      })
    end

    it "returns the user's hours for today" 


    it "returns the user's hours for yesterday" 


    it "returns the user's hours for a given weekday" 


    it "returns the user's hours for this week" 


    it "returns the user's hours for last week" 


    it "returns the user's hours for this month" 


    it "returns the user's hours for last month" 


    it "returns help text for an invalid command" 

  end
end

