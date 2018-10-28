require "rails_helper"

describe "Using the editor" do
  let(:user) { create(:user) }
  let(:raw_text) { "../support/fixtures/sample_article_template_spec.txt" }
  # what are these
  let(:dir) { "../support/fixtures/sample_article.txt" }
  let(:rich_dir) { "../support/fixtures/sample_rich_article.txt" }
  let(:template) { File.read(File.join(File.dirname(__FILE__), dir)) }
  let(:rich_template) { File.read(File.join(File.dirname(__FILE__), rich_dir)) }

  before do
    sign_in user
  end

  def read_from_file(dir)
    File.read(File.join(File.dirname(__FILE__), dir))
  end

  def fill_markdown_with(content)
    visit "/new"
    fill_in "article_body_markdown", with: content
  end

  describe "Previewing an article", js: true do
    after do
      page.evaluate_script("window.onbeforeunload = function(){}")
    end

    it "fill out form with ruch content and click preview" 

  end

  describe "Submitting an article" do
    it "fill out form and submit" 


    it "user write and publish an article" 


    it "user write and publish an article without a title" 

  end
end

