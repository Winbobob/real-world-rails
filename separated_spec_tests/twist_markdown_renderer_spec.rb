require 'rails_helper'
require 'markdown_renderer'

describe MarkdownRenderer do
  let(:renderer) { Redcarpet::Markdown.new(MarkdownRenderer, :fenced_code_blocks => true) }

  def render(element)
    Nokogiri::HTML(renderer.render(element))
  end

  it "can parse a paragraph" 


  it "can parse a tip" 


  it "can parse a warning" 


  it "can parse an error" 


  it "can parse an information box" 


  it "can parse a question box" 


  it "can parse a discussion box" 


  it "can parse a exercise box" 


  it "can parse an aside" 


  it "can parse a titleized code listing" 


  it "maintains line breaks in code listing" 


  it "can parse a titleized code listing with multiple underscores" 


  it "can parse a titleized code listing with a paragraph following" 

end
    }.strip)

    expect(output.css("p").last.text).to eq("This is just some text. Nothing to be too concerned about.")
  end

  it "can process a footnote" 


  it "can process a multi-char" 


  it "can process a footnote within a paragraph" 


  it "can process a multi-char footnote within a paragraph" 

end

