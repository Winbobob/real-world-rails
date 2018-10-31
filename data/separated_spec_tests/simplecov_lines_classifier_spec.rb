# frozen_string_literal: true

require "helper"
require "simplecov/lines_classifier"

describe SimpleCov::LinesClassifier do
  describe "#classify" do
    describe "relevant lines" do
      it "determines code as relevant" 


      it "determines invalid UTF-8 byte sequences as relevant" 

    end

    describe "not-relevant lines" do
      it "determines whitespace is not-relevant" 


      describe "comments" do
        it "determines comments are not-relevant" 


        it "doesn't mistake interpolation as a comment" 

      end

      describe ":nocov: blocks" do
        it "determines :nocov: blocks are not-relevant" 


        it "determines all lines after a non-closing :nocov: as not-relevant" 

      end
    end
  end

  RSpec::Matchers.define :be_relevant do
    match do |actual|
      actual == SimpleCov::LinesClassifier::RELEVANT
    end
  end

  RSpec::Matchers.define :be_irrelevant do
    match do |actual|
      actual == SimpleCov::LinesClassifier::NOT_RELEVANT
    end
  end
end

