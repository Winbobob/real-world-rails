# frozen_string_literal: true

require "rails_helper"

RSpec.describe RosterEntry::ShowView do
  let(:roster_entry) { create(:roster_entry) }

  subject { RosterEntry::ShowView.new(roster_entry: roster_entry) }

  describe "#linked", :vcr do
    context "has a user" do
      before do
        roster_entry.user = classroom_student
        roster_entry.save
      end

      it "returns true" 

    end

    context "does not have a user" do
      before do
        roster_entry.user = nil
        roster_entry.save
      end

      it "returns false" 

    end
  end

  describe "#github_handle_text", :vcr do
    context "when linked" do
      before do
        roster_entry.user = classroom_student
        roster_entry.save
      end

      it "returns the handle prefaced by an @" 

    end

    context "when not linked" do
      before do
        roster_entry.user = nil
        roster_entry.save
      end

      it 'returns "Not linked"' 

    end
  end

  describe "#button_text", :vcr do
    context "when linked" do
      before do
        roster_entry.user = classroom_student
        roster_entry.save
      end

      it "returns unlink text" 

    end

    context "when not linked" do
      before do
        roster_entry.user = nil
        roster_entry.save
      end

      it "returns link text" 

    end
  end

  describe "#button_class", :vcr do
    context "when linked" do
      before do
        roster_entry.user = classroom_student
        roster_entry.save
      end

      it "returns danger button class" 

    end

    context "when not linked" do
      before do
        roster_entry.user = nil
        roster_entry.save
      end

      it "returns outline button class" 

    end
  end
end

