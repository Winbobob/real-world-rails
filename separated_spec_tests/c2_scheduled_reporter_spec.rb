describe ScheduledReporter do
  describe "#new" do
    it "requires a Time object instantiation" 


    it "raises exception if arg is not a Time" 

  end

  describe "#run", elasticsearch: true, email: true do
    it "always sends dailes" 


    it "sends weeklies on Mondays" 


    it "only sends weeklies on Mondays" 


    it "sends monthlies on first day of the month" 


    it "sends monthlies only on first day of the month" 

  end

  def create_weekly_scheduled_report
    owner = create(:user)
    report = create(:report, query: { text: "something" }.to_json, user: owner)
    create(:scheduled_report, frequency: "weekly", user: owner, report: report)
  end

  def create_monthly_scheduled_report
    owner = create(:user)
    report = create(:report, query: { text: "something" }.to_json, user: owner)
    create(:scheduled_report, frequency: "monthly", user: owner, report: report)
  end
end

