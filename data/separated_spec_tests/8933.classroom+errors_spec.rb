# frozen_string_literal: true

require "rails_helper"

describe GitHub::Errors do
  subject { described_class }

  describe "#with_error_handling" do
    describe "failbot" do
      before(:each) do
        Failbot.reports.clear
      end

      it "reports 1 report after 1 failed request" 

    end

    context "Octokit::Forbidden is raised" do
      it "raises GitHub::Forbidden" 

    end

    context "Octokit::NotFound is raised" do
      before(:each) do
        Failbot.reports.clear
      end

      it "raises GitHub::NotFound" 


      it "does not report a NotFound error" 

    end

    context "Octokit::ServerError is raised" do
      it "raises GitHub::Error" 

    end

    context "Octokit::Forbidden is raised" do
      it "raises GitHub::Forbidden" 

    end
  end
end

