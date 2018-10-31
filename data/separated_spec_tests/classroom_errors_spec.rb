# frozen_string_literal: true

require "rails_helper"

describe GitHub::Errors do
  subject { described_class }

  describe "#with_error_handling" do
    context "Octokit::Forbidden is raised" do
      it "raises GitHub::Forbidden" 

    end

    context "Octokit::NotFound is raised" do
      it "raises GitHub::NotFound" 

    end

    context "Octokit::ServerError is raised" do
      it "raises GitHub::Error" 

    end

    context "Octokit::Forbidden is raised" do
      it "raises GitHub::Forbidden" 

    end
  end
end

