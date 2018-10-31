# frozen_string_literal: true

require "rails_helper"

RSpec.describe FormView do
  let(:assignment) { create(:assignment) }

  subject { FormView.new(subject: assignment) }

  describe "#errors_for?" do
    context "when there are errors" do
      before do
        assignment.errors.add(:title, "is all wrong")
      end

      it "returns true" 

    end

    context "when there are no errors" do
      it "returns false" 

    end

    context "when there are errors on other fields, but nothing on field" do
      before do
        assignment.errors.add(:slug, "is all wrong")
      end

      it "returns false" 

    end
  end

  describe "#form_class_for" do
    context "when there are errors" do
      before do
        assignment.errors.add(:title, "is all wrong")
      end

      it 'returns "form errored"' 

    end

    context "when there are no errors" do
      it 'returns "form"' 

    end
  end

  describe "#error_message" do
    context "when there are no errors" do
      it 'returns ""' 

    end

    context "when there are errors" do
      before do
        assignment.errors.add(:title, "is all wrong")
      end

      it "returns correct error message" 

    end
  end
end

