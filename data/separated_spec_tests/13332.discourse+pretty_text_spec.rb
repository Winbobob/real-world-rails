require 'rails_helper'
require 'pretty_text'

describe PrettyText do

  before do
    SiteSetting.enable_markdown_typographer = false
  end

  def n(html)
    html.strip
  end

  def cook(*args)
    PrettyText.cook(*args)
  end

  let(:wrapped_image) { "<div class=\"lightbox-wrapper\"><a href=\"//localhost:3000/uploads/default/4399/33691397e78b4d75.png\" class=\"lightbox\" title=\"Screen Shot 2014-04-14 at 9.47.10 PM.png\"><img src=\"//localhost:3000/uploads/default/_optimized/bd9/b20/bbbcd6a0c0_655x500.png\" width=\"655\" height=\"500\"><div class=\"meta\">\n<span class=\"filename\">Screen Shot 2014-04-14 at 9.47.10 PM.png</span><span class=\"informations\">966x737 1.47 MB</span><span class=\"expand\"></span>\n</div></a></div>" }
  let(:wrapped_image_excerpt) {}

  describe "Quoting" do

    describe "with avatar" do
      let(:default_avatar) { "//test.localhost/uploads/default/avatars/42d/57c/46ce7ee487/{size}.png" }
      let(:user) { Fabricate(:user) }

      before do
        User.stubs(:default_template).returns(default_avatar)
      end

      it "do off topic quoting with emoji unescape" 


      it "indifferent about missing quotations" 


      it "indifferent about curlies and no curlies" 


      it "trims spaces on quote params" 

    end

    describe "with primary user group" do
      let(:default_avatar) { "//test.localhost/uploads/default/avatars/42d/57c/46ce7ee487/{size}.png" }
      let(:group) { Fabricate(:group) }
      let!(:user) { Fabricate(:user, primary_group: group) }

      before do
        User.stubs(:default_template).returns(default_avatar)
      end

      it "adds primary group class to referenced users quote" 

    end

    it "can handle inline block bbcode" 


    it "handles bbcode edge cases" 


    it "can handle quote edge cases" 


    describe "with letter avatar" do
      let(:user) { Fabricate(:user) }

      context "subfolder" do
        before do
          GlobalSetting.stubs(:relative_url_root).returns("/forum")
          Discourse.stubs(:base_uri).returns("/forum")
        end

        it "should have correct avatar url" 

      end
    end
  end

  describe "Mentions" do

    it "can handle mentions after abbr" 


    it "should handle 3 mentions in a row" 


    it "can handle mention edge cases" 


    it "can handle mention with hyperlinks" 


    it "can handle mentions inside a hyperlink" 


    it "can handle mentions inside a hyperlink" 


    it "can handle a list of mentions" 


    it "should handle group mentions with a hyphen and without" 


    it 'should allow for @mentions to have punctuation' 


    it 'should not treat a medium link as a mention' 


  end

  describe "code fences" do
    it 'indents code correctly' 


    it "doesn't replace emoji in code blocks with our emoji sets if emoji is enabled" 


    it 'can include code class correctly' 


    it 'indents code correctly' 


    it 'does censor code fences' 

  end

  describe "rel nofollow" do
    before do
      SiteSetting.add_rel_nofollow_to_user_content = true
      SiteSetting.exclude_rel_nofollow_domains = "foo.com|bar.com"
    end

    it "should inject nofollow in all user provided links" 


    it "should not inject nofollow in all local links" 


    it "should not inject nofollow in all subdomain links" 


    it "should inject nofollow in all non subdomain links" 


    it "should not inject nofollow for foo.com" 


    it "should inject nofollow for afoo.com" 


    it "should not inject nofollow for bar.foo.com" 


    it "should not inject nofollow if omit_nofollow option is given" 

  end

  describe "Excerpt" do

    it "sanitizes attempts to inject invalid attributes" 


    context "images" do

      it "should dump images" 


      context 'alt tags' do
        it "should keep alt tags" 


        describe 'when alt tag is empty' do
          it "should not keep alt tags" 

        end
      end

      context 'title tags' do
        it "should keep title tags" 


        describe 'when title tag is empty' do
          it "should not keep title tags" 

        end
      end

      it "should convert images to markdown if the option is set" 


      it "should keep spoilers" 


      it "should keep details if too long" 


      it "doesn't disable details if short enough" 


      it "should remove meta informations" 


      it "should strip images when option is set" 


      it "should strip images, but keep emojis when option is set" 

    end

    it "should have an option to strip links" 


    it "should preserve links" 


    it "should deal with special keys properly" 


    it "should truncate stuff properly" 


    it "should insert a space between to Ps" 


    it "should strip quotes" 


    it "should not count the surrounds of a link" 


    it "uses an ellipsis instead of html entities if provided with the option" 


    it "should truncate links" 


    it "doesn't extract empty quotes as links" 


    it "doesn't extract links from elided parts" 


    def extract_urls(text)
      PrettyText.extract_links(text).map(&:url).to_a
    end

    it "should be able to extract links" 


    it "should extract links to topics" 


    it "should lazyYT videos" 


    it "should extract links to posts" 


    it "should not extract links to anchors" 


    it "should not extract links inside quotes" 


    it "should not preserve tags in code blocks" 


    it "should handle nil" 


    it "handles span excerpt at the beginning of a post" 


    it "ignores max excerpt length if a span excerpt is specified" 


    it "unescapes html entities when we want text entities" 


    it "should have an option to preserve emoji images" 


    it "should have an option to remap emoji to code points" 


    it "should have an option to preserve emoji codes" 


    context 'option to preserve onebox source' do
      it "should return the right excerpt" 


      it 'should continue to strip quotes' 

    end
  end

  describe "strip links" do
    it "returns blank for blank input" 


    it "does nothing to a string without links" 


    it "strips links but leaves the text content" 


    it "escapes the text content" 

  end

  describe "strip_image_wrapping" do
    def strip_image_wrapping(html)
      doc = Nokogiri::HTML.fragment(html)
      described_class.strip_image_wrapping(doc)
      doc.to_html
    end

    it "doesn't change HTML when there's no wrapped image" 


    it "strips the metadata" 

  end

  describe 'format_for_email' do
    let(:base_url) { "http://baseurl.net" }
    let(:post) { Fabricate(:post) }

    before do
      Discourse.stubs(:base_url).returns(base_url)
    end

    it 'does not crash' 


    it "adds base url to relative links" 


    it "doesn't change external absolute links" 


    it "doesn't change internal absolute links" 


    it "can tolerate invalid URLs" 


    it "doesn't change mailto" 

  end

  it 'Is smart about linebreaks and IMG tags' 


  describe 's3_cdn' do

    def test_s3_cdn
      # add extra img tag to ensure it does not blow up
      raw = <<~HTML
        <img>
        <img src='https:#{Discourse.store.absolute_base_url}/original/9/9/99c9384b8b6d87f8509f8395571bc7512ca3cad1.jpg'>
        <img src='http:#{Discourse.store.absolute_base_url}/original/9/9/99c9384b8b6d87f8509f8395571bc7512ca3cad1.jpg'>
        <img src='#{Discourse.store.absolute_base_url}/original/9/9/99c9384b8b6d87f8509f8395571bc7512ca3cad1.jpg'>
      HTML

      html = <<~HTML
        <p><img><br>
        <img src="https://awesome.cdn/original/9/9/99c9384b8b6d87f8509f8395571bc7512ca3cad1.jpg"><br>
        <img src="https://awesome.cdn/original/9/9/99c9384b8b6d87f8509f8395571bc7512ca3cad1.jpg"><br>
        <img src="https://awesome.cdn/original/9/9/99c9384b8b6d87f8509f8395571bc7512ca3cad1.jpg"></p>
      HTML

      expect(PrettyText.cook(raw)).to eq(html.strip)
    end

    before do
      GlobalSetting.reset_s3_cache!
    end

    after do
      GlobalSetting.reset_s3_cache!
    end

    it 'can substitute s3 cdn when added via global setting' 


    it 'can substitute s3 cdn correctly' 


    def test_s3_with_subfolder_cdn
      raw = <<~RAW
        <img src='https:#{Discourse.store.absolute_base_url}/subfolder/original/9/9/99c9384b8b6d87f8509f8395571bc7512ca3cad1.jpg'>
      RAW

      html = <<~HTML
        <p><img src="https://awesome.cdn/subfolder/original/9/9/99c9384b8b6d87f8509f8395571bc7512ca3cad1.jpg"></p>
      HTML

      expect(PrettyText.cook(raw)).to eq(html.strip)
    end

    it 'can substitute s3 with subfolder cdn when added via global setting' 

  end

  describe "emoji" do
    it "replaces unicode emoji with our emoji sets if emoji is enabled" 


    it "doesn't replace emoji in inline code blocks with our emoji sets if emoji is enabled" 


    it "replaces some glyphs that are not in the emoji range" 


    it "doesn't replace unicode emoji if emoji is disabled" 


    it "doesn't replace emoji if emoji is disabled" 


    it "doesn't replace shortcuts if disabled" 


    it "does replace shortcuts if enabled" 


    it "replaces skin toned emoji" 


    it "correctly strips VARIATION SELECTOR-16 character (ufe0f) from some emojis" 

  end

  describe "custom emoji" do
    it "replaces the custom emoji" 

  end

  it "replaces skin toned emoji" 


  it "should not treat a non emoji as an emoji" 


  it "supports href schemes" 


  it "supports forbidden schemes" 


  it 'allows only tel URL scheme to start with a plus character' 


  it "produces hashtag links" 


  it "can handle mixed lists" 


  it "can handle traditional vs non traditional newlines" 


  it "can handle emoji by name" 


  it "handles emoji boundaries correctly" 


  it "can handle emoji by translation" 


  it "can handle multiple emojis by translation" 


  it "handles emoji boundries correctly" 


  it 'can censor words correctly' 


  it 'supports typographer' 


  it 'handles onebox correctly' 


  it 'handles mini onebox' 


  it 'handles mini onebox with query param' 


  it 'skips mini onebox for primary domain' 


  it "can handle bbcode" 


  it "can handle bbcode after a newline" 


  it "can onebox local topics" 


  it "supports tables" 


  it "supports img bbcode" 


  it "provides safety for img bbcode" 


  it "supports email bbcode" 


  it "supports url bbcode" 


  it "supports nesting tags in url" 


  it "supports query params in bbcode url" 


  it "supports inline code bbcode" 


  it "supports block code bbcode" 


  it "support special handling for space in urls" 


  it "supports onebox for decoded urls" 


  it "should sanitize the html" 


  it "should not onebox magically linked urls" 


  it "should sanitize the html" 


  it "should strip SCRIPT" 


  it "should allow sanitize bypass" 


  # custom rule used to specify image dimensions via alt tags
  describe "image dimensions" do
    it "allows title plus dimensions" 


    it "allows whitespace before the percent scaler" 


  end

  describe "inline onebox" do
    it "includes the topic title" 


    it "invalidates the onebox url" 

  end

  describe "image decoding" do

    it "can decode upload:// for default setup" 


    it "can place a blank image if we can not find the upload" 


  end

  it "can properly whitelist iframes" 


  it "You can disable linkify" 


  it "has a proper data whitlist on div" 


  it "whitelists lang attribute" 


  it "whitelists ruby tags" 


end

