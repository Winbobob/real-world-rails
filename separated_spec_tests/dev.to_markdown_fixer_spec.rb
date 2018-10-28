require "rails_helper"

RSpec.describe MarkdownFixer do
  let(:sample_title) { Faker::Book.title }

  def create_sample_markdown(title)
    <<~HEREDOC
      ---
      title: #{title}
      ---
    HEREDOC
  end

  describe "::add_quotes_to_title" do
    it "escapes simple title" 


    it "does not escape titles that came pre-wrapped in single quotes" 


    it "does not escape titles that came pre-wrapped in double quotes" 


    it "handles complex title" 


    it "handles title with \r\n" 

  end
end

