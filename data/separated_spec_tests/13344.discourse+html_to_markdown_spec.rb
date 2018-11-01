require 'rails_helper'
require 'html_to_markdown'

describe HtmlToMarkdown do

  def html_to_markdown(html, opts = {})
    HtmlToMarkdown.new(html, opts).to_markdown
  end

  it "remove whitespaces" 


  it "skips hidden tags" 


  it "converts <strong>" 


  it "converts <b>" 


  it "converts <em>" 


  it "converts <i>" 


  it "converts <a>" 


  it "removes empty & invalid <a>" 


  HTML_WITH_IMG     ||= %Q{<img src="https://www.discourse.org/logo.svg" alt="Discourse Logo">}
  HTML_WITH_CID_IMG ||= %Q{<img src="cid:ii_1525434659ddb4cb" alt="Discourse Logo">}

  it "converts <img>" 


  it "keeps <img> with 'keep_img_tags'" 


  it "removes empty & invalid <img>" 


  it "keeps <img> with src='cid:' whith 'keep_cid_imgs'" 


  it "skips hidden <img>" 


  (1..6).each do |n|
    it "converts <h#{n}>" 

  end

  it "converts <br>" 


  it "converts <hr>" 


  it "converts <tt>" 


  it "converts <code>" 


  it "supports <ins>" 


  it "supports <del>" 


  it "supports <sub>" 


  it "supports <sup>" 


  it "supports <small>" 


  it "supports <kbd>" 


  it "supports <abbr>" 


  it "supports <s>" 


  it "supports <strike>" 


  it "supports <blockquote>" 


  it "supports <ul>" 


  it "supports <ol>" 


  it "supports <p> inside <li>" 


  it "supports <ul> inside <ul>" 


  it "supports bare <li>" 


  it "supports <pre>" 


  it "supports <pre> inside <blockquote>" 


  it "works" 


  it "supports html document" 


  it "handles <p>" 


  it "handles <div>" 


  it "swallows <span>" 


  it "swallows <u>" 


  it "removes <script>" 


  it "removes <style>" 


  it "handles divs within spans" 


  context "with an oddly placed <br>" do

    it "handles <strong>" 


    it "handles <em>" 


  end

  context "with an empty tag" do

    it "handles <strong>" 


    it "handles <em>" 


  end

  context "with spaces around text" do

    it "handles <strong>" 


    it "handles <em>" 


  end

end

