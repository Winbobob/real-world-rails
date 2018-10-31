require 'spec_helper'

describe "Sleeps" do

  let(:user) {Fabricate(:user)}

  describe "GET /sleeps" do
    context "when not signed in" do
      it "redirects" 

    end

    context "when signed in" do
      before(:each) do
        ApplicationController.any_instance.stub(:current_user).and_return(user)
        SleepsController.any_instance.stub(:authenticate_user!).and_return(true)
      end

      it "returns 200" 

    end
  end

  describe "GET /sleeps/new" do
    context "when not signed in" do
      it "redirects" 

    end

    context "when signed in" do
      before(:each) do
        ApplicationController.any_instance.stub(:current_user).and_return(user)
        SleepsController.any_instance.stub(:authenticate_user!).and_return(true)
      end

      it "returns 200" 

    end
  end
end

