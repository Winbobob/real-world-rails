require 'rails_helper'
require 'email'

describe Email::Styles do

  def basic_fragment(html)
    styler = Email::Styles.new(html)
    styler.format_basic
    Nokogiri::HTML.fragment(styler.to_html)
  end

  def html_fragment(html)
    styler = Email::Styles.new(html)
    styler.format_basic
    styler.format_html
    Nokogiri::HTML.fragment(styler.to_html)
  end

  context "basic formatter" do

    it "works with an empty string" 


    it "adds a max-width to large images" 


    it "adds a width and height to emojis" 


    it "adds a width and height to custom emojis" 


    it "converts relative paths to absolute paths" 


    it "strips classes and ids" 


  end

  context "html template formatter" do
    it "works with an empty string" 


    it "attaches a style to h3 tags" 


    it "attaches a style to hr tags" 


    it "attaches a style to a tags" 


    it "attaches a style to a tags" 


    it "attaches a style to ul and li tags" 


    it "converts iframes to links" 


    it "won't allow non URLs in iframe src, strips them with no link" 


    it "won't allow empty iframe src, strips them with no link" 

  end

  context "rewriting protocol relative URLs to the forum" do
    it "doesn't rewrite a url to another site" 


    context "without https" do
      before do
        SiteSetting.force_https = false
      end

      it "rewrites the href to have http" 


      it "rewrites the href for attachment files to have http" 


      it "rewrites the src to have http" 

    end

    context "with https" do
      before do
        SiteSetting.force_https = true
      end

      it "rewrites the forum URL to have https" 


      it "rewrites the href for attachment files to have https" 


      it "rewrites the src to have https" 

    end

  end

  context "strip_avatars_and_emojis" do
    it "works for lonesome emoji with no title" 


    it "works for lonesome emoji with title" 


    it "works if img tag has no attrs" 

  end

  context "onebox_styles" do
    it "renders quote as <blockquote>" 

  end

end

