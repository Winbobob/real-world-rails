# encoding: utf-8
require "rails_helper"
require "support/helpers/features/user_accounts"

RSpec.describe "Study page" do
  let(:study) { FactoryGirl.create(:study) }

  it "exists" 


  context "when the user is an admin" do
    let(:admin) { FactoryGirl.create(:admin_user) }

    it "lets you edit the study in the admin" 

  end

  describe "editing the study stage" do
    let(:pi) { FactoryGirl.create(:user) }
    let(:rm) { FactoryGirl.create(:user) }
    let(:admin) { FactoryGirl.create(:admin_user) }
    let(:other) { FactoryGirl.create(:user) }

    before do
      study.principal_investigator = pi
      study.research_manager = rm
      study.save!
    end

    context "when the study is in the protocol_erb stage" do
      before do
        study.study_stage = "protocol_erb"
        study.protocol_needed = true
        study.erb_status = FactoryGirl.create(:accept)
        study.save!
      end

      it "can be progressed to the delivery stage by allowed users" 


      it "is hidden from other users" 


      it "is hidden from anonymous users" 

    end

    context "when the study is in the delivery stage" do
      before do
        study.study_stage = "delivery"
        study.protocol_needed = true
        study.erb_status = FactoryGirl.create(:accept)
        study.save!
      end

      it "can be progressed to the completion stage by allowed users" 


      it "is hidden from other users" 


      it "is hidden from anonymous users" 

    end
  end
end

