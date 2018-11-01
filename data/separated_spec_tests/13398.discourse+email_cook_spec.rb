require 'rails_helper'
require 'email_cook'
require 'pretty_text'

describe EmailCook do
  it "uses to PrettyText when there is no [plaintext] in raw" 


  it "adds linebreaks to short lines" 


  it "doesn't add linebreaks to long lines" 


  it "replaces a blank line with 2 linebreaks" 


  it "escapes HTML" 


  it "replaces indentation of more than 2 spaces with corresponding amount of non-breaking spaces" 


  it "creates oneboxed link when the line contains only a link" 


  it "autolinks without the beginning of a line" 


  it "autolinks without the end of a line" 


  it "links even within a quote" 


  it "it works and does not interpret Markdown in plaintext and elided" 


  it "works without attachments" 


  def cook(raw)
    EmailCook.new(raw).cook
  end

  def plaintext(text)
    "[plaintext]\n#{text}\n[/plaintext]"
  end
end

