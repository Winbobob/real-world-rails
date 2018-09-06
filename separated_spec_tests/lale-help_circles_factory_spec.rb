require 'rails_helper'

describe "Circle factory" do

  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }
  let(:user_3) { create(:user) }

  describe "default" do
    context "when not giving attributes" do
      it "creates a simple circle" 

    end
  end

  describe "adding admins" do
    context "when giving one" do
      it "correctly assigns the admins" 

    end

    context "when giving two" do
      it "correctly assigns the admins" 

    end

  end

  describe "adding volunteers" do
    context "when giving one" do
      it "correctly assigns the volunteers" 

    end

    context "when giving two" do
      it "correctly assigns the volunteers" 

    end
  end

  describe "adding admins and volunteers" do
    it "correctly assigns the admins and volunteers" 

  end

  describe "the :with_admin trait" do
    it "assigns a new user as admin" 

  end

  describe "the :with_volunteer trait" do
    it "assigns a new user as volunteer" 


    describe "combining with :with_admin trait" do
      it "correctly assigns the admins and volunteers" 

    end

  end

  describe "the :with_admin_and_working_group trait" do
    it "assigns a new user as admin" 

    it "creates a working group" 

    it "makes the circle admin member of the working group" 

  end
  
  describe "the :with_volunteer_and_working_group trait" do
    it "assigns a new user as volunteer" 

    it "creates a working group" 

    it "makes the circle volunteer member of the working group" 

  end



end

