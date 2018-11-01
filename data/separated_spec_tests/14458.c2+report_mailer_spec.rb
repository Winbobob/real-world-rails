describe ReportMailer, :email do
  include EnvVarSpecHelper

  describe "#daily_budget_report" do
    it "works with no data" 


    it "reports on work orders" 

  end

  describe "#weekly_fiscal_year_report" do
    it "works with no data" 

  end

  describe "#scheduled_report" do
    it "mails report on schedule", :elasticsearch do
      deliveries.clear
      owner = create(:user)
      report = create(:report, query: { text: "something" }.to_json, user: owner)
      scheduled_report = create(:scheduled_report, frequency: "daily", user: owner, report: report)

      proposals = 3.times.map do |i|
        tcr = create(:test_client_request, project_title: "something #{i}")
        tcr.proposal.update(requester: owner)
        tcr.proposal.reindex
        tcr.proposal
      end
      Proposal.__elasticsearch__.refresh_index!

      email = ReportMailer.scheduled_report(scheduled_report.name, scheduled_report.report, scheduled_report.user)

      expect(email.to).to eq([owner.email_address])
      expect(email.attachments.size).to eq(1)
      expect(email.attachments.first).to be_a_kind_of(Mail::Part)

      csv = email.attachments.first.decode_body
      expect(csv).to include("something 1")
      expect(csv).to include("something 2")
      expect(csv.split(/\n/).size).to eq(4)
    end
  end
end

