require "spec_helper"

describe SignaturesController do
  describe "#create" do
    # @warn can't use let because of mongoid teardown
    before :each do
      @user = FactoryGirl.create(:user)
      @person = FactoryGirl.create(:state_legislator_ny_sheldon_silver)
      @question = FactoryGirl.create(:question, person: @person)
      @question.signature_count = @question.person.signature_threshold - 1
      @question.save
      sign_in @user
    end

    it "ensures an email is sent to person when signature threshold is met" 


    it "ensures an email is sent to staff when signature threshold is met" 

  end

  context "#index viewing a question's signatures" do
    before do
      @question = FactoryGirl.create(:question)
    end

    context "and logged out" do
      it "should refuse access" 

    end

    context "and not logged in as staff member or partner user" do
      before do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end

      it "should refuse access" 

    end

    context "and logged in as staff or partner" do
      before do
        @staff_member = FactoryGirl.create(:user)
        @staff_member.add_role :staff_member
        sign_in @staff_member
      end

      it "returns csv rows" 

    end

    after do
      sign_out :user
    end
  end
end

