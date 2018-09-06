require 'spec_helper'
describe AdminMailer do
  context "abuse_reports with email" do
    let(:report) { create(:abuse_report) }
    let(:mail) { AdminMailer.abuse_report(report.id) }

    it "has the correct subject" 


    it "delivers to the correct address" 


    it "delivers from the correct address" 


    it "body text contains the comment" 


    it "body text contains the email" 


    it "has the url of the page with abuse" 


  end

  context "abuse_reports sends copy to submitter" do
    let(:report) { create(:abuse_report, email: "cc_me@email.com") }
    let(:mail) { AdminMailer.abuse_report(report.id) }
    let(:mail2) { UserMailer.abuse_report(report.id) }


   it "has the correct subject" 


   it "delivers to the correct address" 


   it "ccs the user who filed the report" 


   it "delivers from the correct address" 


   it "body text contains the comment" 


   it "has the url of the page with abuse" 

  end


end

