require "spec_helper"
require "controllers/api/api_helper"

include ApiHelper

describe Api::V2::BaseController, type: :controller do

  describe "batch_errors" do

    context "with no archivist" do
      it "should return the 'forbidden' status" 


      it "returns an error message" 

    end

    context "with a user who is not an archivist" do
      let(:not_archivist) { create(:user) }

      it "returns the 'forbidden' status" 


      it "returns an error message" 

    end
  end

  describe "batch_errors with a valid pseud" do
    let!(:archivist) { create(:archivist) }

    it "returns error messages with no items to import" 


    it "returns error messages with too many items to import" 


    it "returns OK status" 


    it "returns no error messages" 

  end
end

