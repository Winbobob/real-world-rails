require 'rails_helper'

describe InlineOneboxController do

  it "requires the user to be logged in" 


  context "logged in" do
    let!(:user) { sign_in(Fabricate(:user)) }

    it "returns empty JSON for empty input" 


    context "topic link" do
      let(:topic) { Fabricate(:topic) }

      it "returns information for a valid link" 

    end
  end
end

