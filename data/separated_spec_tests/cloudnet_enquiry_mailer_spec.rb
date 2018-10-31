require "rails_helper"

RSpec.describe EnquiryMailer, :type => :mailer do
  describe "contact_page" do
    let(:params) {{name: "John Dow", email: "john.dow@ibm.ru", 
                   phone: "07438 222 444", msg: "Hello. `I know you!"}}
    let(:mail) { EnquiryMailer.contact_page(params) }

    it "fills mailer queue" 

    
    it "renders the headers" 


    it "renders the body" 

  end

end

