require "spec_helper"
require "controllers/api/api_helper"

include ApiHelper

describe Api::V1::BaseController, type: :controller do

  describe "batch_errors" do

    context "with no archivist" do
      it "should return the 'forbidden' status" 


      it "should return an error message" 

    end

    context "with a user who is not an archivist" do
      let(:not_archivist) { create(:user) }

      it "should return the 'forbidden' status" 


      it "should return an error message" 

    end
  end

  describe "batch_errors with a valid pseud" do
    let(:archivist) { create(:archivist) }

    it "should return error messages with no items to import" 


    it "should return error messages with too many items to import" 


    it "should return OK status" 


    it "should return no error messages" 

  end
end

