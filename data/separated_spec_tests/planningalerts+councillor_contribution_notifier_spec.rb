require 'spec_helper'

describe CouncillorContributionNotifier do
  describe "notice of councillor contribution for admin" do
    let(:authority) { create(:authority, full_name: "Casey City Council") }
    let(:councillor_contribution) { create(:councillor_contribution, authority: authority, id: 1) }
    let(:mailer) { CouncillorContributionNotifier.notify(councillor_contribution) }

    it "should come from the moderator's email address" 


    it "should go to the moderator email address" 


    it "should tell the moderator what the email is about" 


    it "should contain the authority name of the councillor contribution" 


    it "should contain the link to the admin show page of the councillor contribition" 

  end
end

