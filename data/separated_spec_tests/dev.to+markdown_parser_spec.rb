require "rails_helper"

RSpec.describe MarkdownParser do
  let(:random_word) { Faker::Lorem.word }
  let(:basic_parsed_markdown) { described_class.new(random_word) }

  def generate_and_parse_markdown(raw_markdown)
    described_class.new(raw_markdown).finalize
  end

  it "works" 


  it "escape liquid tags in codeblock" 


  it "escape liquid tags in inline code" 


  context "when provided with a link in inline code" do
    inline_code = "[dev.to](https://dev.to)"
    let(:evaluated_markdown) { described_class.new(inline_code).evaluate_inline_markdown }

    it "renders with target _blank" 


    it "avoids the traget _blank vulnerability" 

  end

  context "when provided with an @username" do
    it "links to a user if user exist" 


    it "doesn't link to a user if user doesn't exist" 

  end

  context "when provided with nested links" do
    it "does not generated nested link tags" 

  end

  context "when provided with liquid tags" do
    it "raises error if liquid tag was used incorrectly" 

  end

  describe "#tags_used" do
    let(:parsed_markdown) { described_class.new("{% youtube oHg5SJYRHA0 %}") }

    it "returns empty if no tag was used" 


    it "return tags used if it was used" 

  end

  context "when using gifs from Giphy as images" do
    let(:giphy_markdown_texts) do
      %w(
        ![source](https://media.giphy.com/media/3ow0TN2M8TH2aAn67F/giphy.gif)
        ![social](https://media.giphy.com/media/3ow0TN2M8TH2aAn67F/giphy.gif)
        ![small](https://media.giphy.com/media/3ow0TN2M8TH2aAn67F/200w_d.gif)
      )
    end

    it "does not wrap giphy images with Cloudinary" 


    it "uses the raw gif from i.giphy.com" 

  end

  context "when an image is used" do
    let(:markdown_with_img) { "![](https://image.com/image.jpg)" }

    it "wraps image in link" 


    it "wraps the image with Cloudinary" 

  end

  context "when using Liquid variables" do
    it "prevents Liquid variables" 


    it "allows Liquid variables in codeblocks" 


    it "renders the text in the codeblock properly" 


    it "allows Liquid variables within inline code" 


    it "renders the inline code with the text properly" 


    it "renders nested lists without linebreaks" 


    it "permits abbr and aside tags" 

  end
end

