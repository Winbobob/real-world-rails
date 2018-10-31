# frozen_string_literal: true

describe Diaspora::Taggable do
  include Rails.application.routes.url_helpers

  describe "#format_tags" do
    context "when there are no tags in the text" do
      it "returns the input text" 

    end

    context "when there is a tag in the text" do
      it "autolinks the hashtag" 


      it "autolinks #<3" 

    end

    context "with multiple tags" do
      it "autolinks the hashtags" 

    end

    context "good tags" do
      it "autolinks" 

    end

    context "bad tags" do
      it "doesn't autolink" 

    end
  end

  describe "#format_tags_for_mail" do
    context "when there are no tags in the text" do
      it "returns the input text" 

    end

    context "when there is a tag in the text" do
      it "autolinks and normalizes the hashtag" 


      it "autolinks #<3" 

    end

    context "with multiple tags" do
      it "autolinks the hashtags" 

    end
  end
end

