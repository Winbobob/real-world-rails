require 'rails_helper'

RSpec.describe GuidePresenter, type: :presenter do

  let(:file_names)   { ['my/path/some_text.md', 'my/path/and_more_text.md'] }
  let(:renderer)     { instance_double("MarkdownRenderer", render: "some_content") }
  let(:mock_content) { "just some content.." }

  let(:guide_presenter)      { described_class.new(file_names, renderer) }

  describe "#each_rendered_file" do
    it "return result based on block for params" 


    it "passes the files basename and rendered content to the block argument" 

  end

  describe "#file_names" do
    it "returns all filenames extracted from the paths without file extensions" 

  end

end

