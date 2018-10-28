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

  context "when an image is used" do
    it "wraps image in link" 

  end
end

