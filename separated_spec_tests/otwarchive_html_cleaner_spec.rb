# -*- coding: utf-8 -*-
require 'spec_helper'
require 'nokogiri'

describe HtmlCleaner do
  include HtmlCleaner

  describe "TagStack" do
    let(:stack) { TagStack.new }

    describe "inside paragraph?" do
      it "should return false" 


      it "should recognise paragraph in combination with i" 


      it "should recognise paragraph in combination with i" 


      it "should recognise single paragraph" 

    end

    describe "open_paragraph_tags" do
      it "should open tags" 


      it "should open tags" 


      it "should handle attributes" 


      it "should ignore text nodes" 


      it "should return empty string when not inside paragraph" 


    end

    describe "close_paragraph_tags" do
      it "should close tags" 


      it "should close tags" 


      it "should handle attributes" 


      it "should ignore text nodes" 


      it "should return empty string when not inside paragraph" 

    end

    describe "close_and_pop_last" do
      it "should close tags" 

    end

  end

  describe "close_unclosed_tag" do

    it "should close tag at end of line" 


    %w(br col hr img).each do |tag|
      it "should not touch self-closing #{tag} tag" 

    end

    %w(col colgroup dl h1 h2 h3 h4 h5 h6 hr ol p pre table ul).each do |tag|
      it "should not touch #{tag} tags that don't go inside p tags" 

    end

    it "should close tag before next opening tag" 


    it "should close tag before next closing tag" 


    it "should close tag before next closing tag" 


    it "should close second opening tag" 


    it "should only close specified tag" 

  end

  describe "sanitize_value" do
    
    context "Sanitize tags allowed only in the content field" do
      %w{youtube.com youtube-nocookie.com vimeo.com player.vimeo.com static.ning.com ning.com dailymotion.com
         metacafe.com vidders.net criticalcommons.org google.com archiveofourown.org podfic.com archive.org
         open.spotify.com spotify.com 8tracks.com w.soundcloud.com soundcloud.com viddertube.com}.each do |source|

        it "should allow embeds from #{source}" 

      end

      %w{youtube.com youtube-nocookie.com vimeo.com player.vimeo.com
         archiveofourown.org archive.org dailymotion.com 8tracks.com podfic.com
         open.spotify.com spotify.com w.soundcloud.com soundcloud.com viddertube.com}.each do |source|

        it "should convert to https for #{source}" 

      end

      it "should allow google player embeds" 


      it "should not allow embeds with unknown source" 


      %w(metacafe.com vidders.net criticalcommons.org static.ning.com ning.com).each do |source|
        it "should not convert to https for #{source}" 

      end
    end
    
    context "Strip out tags not allowed in text fields other than content" do
      [:endnotes, :notes, :summary].each do |field|
        it "should strip iframes" 

      end
    end

    [:content, :endnotes, :notes, :summary].each do |field|
      context "Sanitize #{field} field" do
  
        it "should keep html" 

  
        it "should keep valid unicode chars as is" 

  
        it "should allow classes with letters, numbers and hyphens" 

  
        it "should not allow CSS classes starting with numbers" 

  
        it "should not allow classes starting with hyphens" 

  
        it "should not allow classes with special characters" 

  
        it "should allow two classes" 

  
        it "should allow RTL content in p" 

  
        it "should allow RTL content in div" 

  
        it "should not allow iframes with unknown source" 

  
        ["'';!--\"<XSS>=&{()}",
         '<XSS STYLE="behavior: url(xss.htc);">'
        ].each do |value|
          it "should strip xss tags: #{value}" 

        end
  
        ["<SCRIPT SRC=http://ha.ckers.org/xss.js></SCRIPT>",
         '<<SCRIPT>alert("XSS");//<</SCRIPT>',
         "<SCRIPT SRC=http://ha.ckers.org/xss.js?<B>",
         "<SCRIPT SRC=//ha.ckers.org/.j>",
         "<SCRIPT>alert(/XSS/.source)</SCRIPT>",
         '</TITLE><SCRIPT>alert("XSS");</SCRIPT>',
         '<SCRIPT SRC="http://ha.ckers.org/xss.jpg"></SCRIPT>'
        ].each do |value|
          it "should strip script tags: #{value}" 

        end
  
        ["\\\";alert('XSS');//",
         "xss:expr/*blah*/ession(alert('XSS'))",
         "xss:expression(alert('XSS'))"
         ].each do |value|
          it "should keep text: #{value}" 

        end
  
        it "should strip iframe tags" 

  
        ["<IMG SRC=\"javascript:alert('XSS');\">",
         "<IMG SRC=JaVaScRiPt:alert('XSS')>",
         "<IMG SRC=javascript:alert(String.fromCharCode(88,83,83))>",
         "<IMG SRC=&#106;&#97;&#118;&#97;&#115;&#99;&#114;&#105;&#112;&#116;&#58;&#97;&#108;&#101;&#114;&#116;&#40;&#39;&#88;&#83;&#83;&#39;&#41;>",
         "<IMG SRC=&#0000106&#0000097&#0000118&#0000097&#0000115&#0000099&#0000114&#0000105&#0000112&#0000116&#0000058&#0000097&#0000108&#0000101&#0000114&#0000116&#0000040&#0000039&#0000088&#0000083&#0000083&#0000039&#0000041>",
         "<IMG SRC=&#x6A&#x61&#x76&#x61&#x73&#x63&#x72&#x69&#x70&#x74&#x3A&#x61&#x6C&#x65&#x72&#x74&#x28&#x27&#x58&#x53&#x53&#x27&#x29>",
         "<IMG SRC=\" &#14;  javascript:alert('XSS');\">",
         "<IMG SRC=\"javascript:alert('XSS')\"",
         "<INPUT TYPE=\"IMAGE\" SRC=\"javascript:alert('XSS');\">",
         "<IMG SRC=\"jav	ascript:alert('XSS');\">",
         "<IMG SRC=\"jav&#x09;ascript:alert('XSS');\">",
         "<IMG SRC=\"jav&#x0A;ascript:alert('XSS');\">",
         "<IMG SRC=\"jav&#x0D;ascript:alert('XSS');\">",
        ].each do |value|
  
          it "should strip javascript in img src attribute: #{value[0..40]}" 

        end
  
        ['<META HTTP-EQUIV="Link" Content="<http://ha.ckers.org/xss.css>; REL=stylesheet">',
         "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0;url=javascript:alert('XSS');\">",
         '<META HTTP-EQUIV="refresh" CONTENT="0;url=data:text/html;base64,PHNjcmlwdD5hbGVydCgnWFNTJyk8L3NjcmlwdD4K">',
         "<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=http://;URL=javascript:alert('XSS');\">",
         "<META HTTP-EQUIV=\"Set-Cookie\" Content=\"USERID=&lt;SCRIPT&gt;alert('XSS')&lt;/SCRIPT&gt;\">"
        ].each do |value|
          it "should strip xss in meta tags: #{value[0..40]}" 

        end
  
        it "should strip xss inside tags" 

  
        it "should strip script/xss tags" 

  
        it "should strip script/src tags" 

  
        it "should strip xss in body background" 

  
        ["<BODY ONLOAD=alert('XSS')>",
         '<BODY onload!#$%&()*~+-_.,:;?@[/|\]^`=alert("XSS")>',
        ].each do |value|
          it "should strip xss in body onload: #{value}" 

        end
  
        it "should strip style tag" 

  
        it "should handle lone @imports" 

  
        it "should handle lone borked @imports" 

  
        it "should strip javascript from img dynsrc" 

  
        it "should strip javascript from img lowsrc" 

  
        it "should strip javascript from bgsound src" 

  
        it "should strip javascript from br size" 

  
        it "should strip javascript from link href" 

  
        it "should strip xss from link href" 

  
        it "should strip namespace tags" 

  
        it "should strip javascript in style=background-image" 

  
        it "should strip script tags" 

  
        ["<!--#exec cmd=\"/bin/echo '<SCR'\"-->",
         "<!--#exec cmd=\"/bin/echo 'IPT SRC=http://ha.ckers.org/xss.js></SCRIPT>'\"-->"
        ].each do |value|
          it "should strip #exec: #{value[0..40]}" 

        end
  
        # TODO: Ones with all types of quote marks:
        # "<IMG SRC=`javascript:alert("RSnake says, 'XSS'")`>"
  
  
        it "should escape ampersands" 

        
        context "add rel=nofollow to all links to defeat spammers' SEO plans" do
          it "adds rel=nofollow to links with no rel attribute" 

          
          it "adds rel=nofollow to links with a rel attribute" 

        end
      end
    end
  end

  describe "fix_bad_characters" do

    it "should not touch normal text" 


    it "should not touch normal text with valid unicode chars" 


    it "should remove invalid unicode chars" 


    it "should escape <3" 


    it "should convert \r\n to \n" 


    it "should remove the spacer" 


    it "should remove unicode chars in the 'other, format' category" 

  end

  describe "add_paragraphs_to_text" do

    %w(a abbr acronym address).each do |tag|
      it "should not add extraneous paragraph breaks after #{tag} tags" 

    end

    it "should not convert linebreaks after p tags" 


    %w(dl h1 h2 h3 h4 h5 h6 ol pre table ul).each do |tag|
      it "should not convert linebreaks after #{tag} tags" 

    end

    %w(blockquote center div).each do |tag|
      it "should not convert linebreaks after #{tag} tags" 

    end

    it "should not convert linebreaks after br tags" 


    it "should not convert linebreaks after hr tags" 


    %w(dl h1 h2 h3 h4 h5 h6 ol pre table ul).each do |tag|
      it "should not wrap #{tag} in p tags" 

    end

    ["ol", "ul"].each do |tag|
      it "should not convert linebreaks inside #{tag} lists" 

    end

    it "should not convert linebreaks inside tables" 


    it "should not convert linebreaks inside definition lists" 


    %w(address h1 h2 h3 h4 h5 h6 p pre).each do |tag|
      it "should not wrap in p and not convert linebreaks inside #{tag} tags" 

    end

    %w(a abbr acronym).each do |tag|
      it "should wrap in p and not convert linebreaks inside #{tag} tags" 

    end

    it "should wrap plain text in p tags" 


    it "should convert single linebreak to br" 


    it "should convert double linebreaks to paragraph break" 


    it "should convert triple linebreaks into blank paragraph" 


    it "should convert double br tags into paragraph break" 


    it "should convert triple br tags into blank paragraph" 


    it "should not convert double br tags inside p tags" 


    it "should not convert triple br tags inside p tags" 


    %w(b big cite code del dfn em i ins kbd q s samp
     small span strike strong sub sup tt u var).each do |tag|

      it "should handle #{tag} inline tags spanning double line breaks" 

    end

    it "should handle nested inline tags spanning double line breaks" 


    it "should handle nested inline tags spanning double line breaks" 


    %w(blockquote center div).each do |tag|
      it "should convert double linebreaks inside #{tag} tag" 

    end

    it "should wrap text in p before and after existing p tag" 


    it "should keep attributes of block elements" 


    it "should keep attributes of inline elements across paragraphs" 


    it "should handle two classes" 


    it "should close unclosed inline tags before double linebreak" 


    it "should close unclosed tag withing other tag" 


    it "should re-nest mis-nested tags" 


    it "should handle mixed uppercase/lowecase html tags" 


    %w(b big cite code del dfn em i ins kbd q s samp
     small span strike strong sub sup tt u var).each do |tag|
      it "should wrap consecutive #{tag} inline tags in one paragraph " 

    end

    %w(&gt; &lt; &amp;).each do |entity|
      it "should handle #{entity}" 

    end

    it "should not add empty p tags" 


    it "should not leave p inside i" 


    it "should deal with br tags at the beginning" 



    it "should handle table tags that don't need closing" 


    %w(script style).each do |tag|
      it "should keep #{tag} tags as is" 

    end

    it "should fail gracefully for missing ending quotation marks" 


    it "should fail gracefully for missing starting quotation marks" 


  end
end

