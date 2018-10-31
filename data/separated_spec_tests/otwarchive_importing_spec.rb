# frozen_string_literal: true
require "spec_helper"

describe WorksController do
  include LoginMacros

  describe "import" do
    context "should return the right error messages" do
      let(:user) { create(:user) }

      before do
        fake_login_known_user(user)
      end

      it "when urls are empty" 


      it "there is an external author name but importing_for_others is NOT turned on" 


      it "there is an external author email but importing_for_others is NOT turned on" 


      context "the current user is NOT an archivist" do
        it "should error when importing_for_others is turned on" 


        it "should error when importing over the maximum number of works" 

      end

      context "the current user is an archivist" do
        it "should error when importing over the maximum number of works" 


        it "should error when importing over the maximum number of chapters" 

      end
    end
  end

  # note: this non-action method renders a template before returning which Rspec can't process,
  # so calling the method directly requires a rescue to swallow the Rspec error
  describe "import_single" do
    it "should display the correct error when a timeout occurs" 


    it "should display the correct error when a StoryParser error occurs" 

  end

  # note: this non-action method renders a template before returning which Rspec can't process,
  # so calling the method directly requires a rescue to swallow the Rspec error
  describe "import_multiple" do
    it "should display the correct error when an error occurs" 

  end
end

