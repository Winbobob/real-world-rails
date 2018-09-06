require "spec_helper"
require File.expand_path("../features_helper.rb", __FILE__)

describe "question" do
  before :each do
    @user = FactoryGirl.create(:user)
    @metadatum = Metadatum.create(name: "New York",
                                  abbreviation: "ny",
                                  chambers: {} )
    @person = FactoryGirl.create(:state_legislator_ny_sheldon_silver)
    @question = FactoryGirl.create(:question,
                                   state: @metadatum.abbreviation,
                                   person: @person)
    identity = FactoryGirl.create(:identity)
    identity.status = "being_inspected"
    identity.verify! @user
    @verified_user = User.find(identity.user_id)
  end

  describe "#show" do
    context "when signed in as responder" do

      it "allows that user to respond to the question" 


      it "displays the answer" 

    end
  end
end

