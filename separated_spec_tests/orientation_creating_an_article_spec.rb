require "rails_helper"

RSpec.describe "Creating an article" do
  before { visit new_article_path }

  context "with valid parameters" do

    before do
      fill_in "article_title", with: "Test"
      fill_in "article_content", with: content
      click_button "Create Article"
    end

    context "and content" do
      let(:content) { "This is a test" }

      it "doesn't redirect to the new article page" 


      it "the author is subscribed" 

    end

    context "and no content" do
      let(:content) { "" }

      it "renders the new article page" 

    end
  end

  context "with invalid parameters" do
    context "with a reserved keyword" do
      before do
        fill_in "article_title", with: "new"
        fill_in "article_content", with: "Here is some content"
        click_button "Create Article"
      end

      it "renders the new article page" 

    end
  end
end

