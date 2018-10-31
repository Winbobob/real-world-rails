# frozen_string_literal: true

describe PeopleController, type: :request do
  context "for the current user" do
    before do
      sign_in alice
    end

    it "displays the publisher for user profile path" 


    it "displays the publisher for people path" 


    it "doesn't display the publisher for people photos path" 

  end

  context "for another user" do
    before do
      sign_in bob
    end

    it "doesn't display the publisher for user profile path" 


    it "doesn't display the publisher for people path" 

  end

  context "with no user signed in" do
    it "doesn't display the publisher for user profile path" 


    it "doesn't display the publisher for people path" 

  end
end

