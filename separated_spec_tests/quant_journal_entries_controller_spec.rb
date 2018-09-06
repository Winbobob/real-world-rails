require 'spec_helper'

describe JournalEntriesController do
  let(:user) { Fabricate(:user) }
  let(:valid_attributes) { 
    { 
      "happiness" => "1",
      "strategies" => "test string",
      "feelings" => "test string"
    } 
  }
  
  describe "GET index" do 
    context "when a user isn't signed in" do
      it "redirects" 

    end

    context "when a user is signed in" do
      before(:each) do
        sign_in user
      end

      it "assigns all journal entries as @journal_entries" 

    end
  end

end

