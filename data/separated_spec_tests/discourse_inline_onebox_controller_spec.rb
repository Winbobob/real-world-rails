require 'rails_helper'

describe InlineOneboxController do

  it "requires the user to be logged in" 


  context "logged in" do
    let!(:user) { log_in(:user) }

    it "returns empty JSON for empty input" 


    context "topic link" do
      let(:topic) { Fabricate(:topic) }

      it "returns information for a valid link" 

    end

  end

end

