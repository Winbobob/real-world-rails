# frozen_string_literal: true

require "rails_helper"
require "set"

RSpec.describe AutocompleteController, type: :controller do
  let(:user) { classroom_teacher }

  before do
    sign_in_as(user)
  end

  describe "GET #github_repos", :vcr do
    before do
      get :github_repos
    end

    it "returns success" 


    it "renders correct template" 

  end
end

