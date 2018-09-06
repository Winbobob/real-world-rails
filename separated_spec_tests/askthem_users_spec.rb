require 'spec_helper'
require File.expand_path("../features_helper.rb", __FILE__)

describe "users" do
  # aka a user's profile
  describe '#show' do
    context "has pending identity to be inspected" do
      let(:identity) { FactoryGirl.create(:identity, status: "being_inspected") }
      let(:user) { identity.user }

      context "when not signed in" do
        it "does not show verify and reject buttons" 

      end

      context "when the user has no questions" do
        it "returns none found" 

      end

      context "when the user has questions" do
        it "returns them" 

      end

      context "when the user has no signatures" do
        it "returns none found" 

      end

      context "when the user has signatures" do
        it "returns them" 

      end

      context "as a staff member" do
        before :each do
          @staff_member = FactoryGirl.create(:user)
          @staff_member.add_role :staff_member
        end

        it "can click verify and user is verified" 


        it "can click reject and user is rejected" 

      end
    end

    context "as a staff member" do
      let(:user) { FactoryGirl.create(:user) }

      before :each do
        @staff_member = FactoryGirl.create(:user)
        @staff_member.add_role :staff_member
      end

      it "can click make partner and user is made partner" 


      it "can click revoke and user partnership is dropped" 


      it "can click disable email and user's email is disabled" 


      it "can click revoke and user partnership is dropped" 

    end
  end
end

