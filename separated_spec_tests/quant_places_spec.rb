require 'spec_helper'

describe "Places" do

  let(:user) {Fabricate(:user)}

  describe "GET /places" do
    context "when not signed in" do
      it "redirects" 

    end

    context "when signed in" do
      before(:each) do
        ApplicationController.any_instance.stub(:current_user).and_return(user)
        PlacesController.any_instance.stub(:authenticate_user!).and_return(true)
      end

      it "returns 200" 

    end
  end

  describe "GET /places/new" do
    context "when not signed in" do
      it "redirects" 

    end

    context "when signed in" do
      before(:each) do
        ApplicationController.any_instance.stub(:current_user).and_return(user)
        PlacesController.any_instance.stub(:authenticate_user!).and_return(true)
      end

      it "returns 200" 

    end
  end
end

