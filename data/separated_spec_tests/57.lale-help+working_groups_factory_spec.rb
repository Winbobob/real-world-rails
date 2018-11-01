require 'rails_helper'

describe "Working group factory" do

  describe "the default factory" do

    let(:user_1) { create(:user) }
    let(:user_2) { create(:user) }
    let(:user_3) { create(:user) }

    context "when not giving attributes" do
      it "creates a simple working group" 

    end

    describe "adding admins" do
      context "when giving one" do
        it "correctly assigns the admins" 

      end

      context "when giving two" do
        it "correctly assigns the admins" 

      end
    end

    describe "adding members" do
      context "when giving one" do
        it "correctly assigns the members" 

      end

      context "when giving two" do
        it "correctly assigns the members" 

      end
    end

    describe "adding admins and members" do
      it "correctly assigns the admins and members" 

    end

    describe "the :with_members trait" do
      it "creates new users as volunteers" 

    end

    describe "the :with_admin trait" do
      it "creates a new user as admin" 

    end

  end

end

