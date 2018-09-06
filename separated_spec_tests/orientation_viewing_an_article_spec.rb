require "rails_helper"

RSpec.describe "Viewing an article" do
  let(:article) { create(:article) }

  subject(:article_visit) { visit article_path(article) }

  it "increments the visits for this article by 1" 


  context "when visiting an article" do
    let(:article) { create(:article) }

    before { visit article_path(article) }

    it "shows the article" 


    context "that is stale" do
      let(:article) { create(:article, :stale) }

      it "displays an outdated banner" 

    end

    context "that is outdated" do
      let(:article) { create(:article, :outdated) }

      it "displays an outdated banner" 

    end

    context "with a heading" do
      let(:article) { create(:article, content: "## Heading") } 

      it "displays a table of contents" 

    end
  end

  context "when visiting an article with an old slug" do
    let(:article) { create(:article, title: "Old Title") }
    let(:old_url) { article_path(article) }

    before do
      visit edit_article_path(article)
      fill_in "article_title", with: "New Title"
      click_button "Update Article"
    end

    it "redirects from the old url" 

  end

  context "when visiting an article url that doesn't exist" do
    let(:title) { "Foo" }

    before { visit article_path(title) }

    it "redirects to the new article page with the title" 

  end
end



