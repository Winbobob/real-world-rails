require 'spec_helper'

describe "Meals" do

  let(:user) {Fabricate(:user)}

  describe "GET /meals" do
    context "when not signed in" do
      it "redirects" 

    end

    context "when signed in" do
      before(:each) do
        ApplicationController.any_instance.stub(:current_user).and_return(user)
        MealsController.any_instance.stub(:authenticate_user!).and_return(true)
      end

      it "returns 200" 

    end
  end

  describe "GET /meals/new" do
    context "when not signed in" do
      it "redirects" 

    end

    context "when signed in" do
      before(:each) do
        ApplicationController.any_instance.stub(:current_user).and_return(user)
        MealsController.any_instance.stub(:authenticate_user!).and_return(true)
      end

      it "returns 200" 

    end
  end
end

