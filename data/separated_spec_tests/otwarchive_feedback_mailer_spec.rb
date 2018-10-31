require 'spec_helper'

describe AdminMailer do

  context "feedback with email" do
     let(:feedback) {create(:feedback)}
     let(:mail) {AdminMailer.feedback(feedback.id)}

     it "has the correct subject" 


     it "delivers to the correct address" 


     it "delivers from the correct address" 


     it "body text contains the comment" 


     it "body text contains the summary" 


  end
end

