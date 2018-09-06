# frozen_string_literal: true

require "rails_helper"

describe GitHub::Search do
  let(:user) { classroom_student }

  subject { described_class.new(user.token) }

  describe "#search_github_repositories", :vcr do
    it "queries the github repo search api" 


    it "returns search results of a query" 

  end
end

