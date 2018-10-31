require 'spec_helper'

describe HtmlFormatting, 'Should apply our special Markdown' do
  
  subject do
    user = Factory.create(:user)
    comment = Comment.new :body => description
    comment.user = user
    comment.save!
    comment.body_html.strip
  end

  it "Did you know trololo? http://youtu.be/iwGFalTRHDA It's awesome." 


  it "Did you know [trololo](http://youtube.com/watch?v=iwGFalTRHDA)? It's awesome." 


  it "Did you know trololo? http://youtube.com/watch?v=iwGFalTRHDA It's awesome." 


  it "Random video http://www.youtube.com/watch?v=JDRabp-iGtg&feature=rec-LGOUT-exp_fresh+div-1r-5-HM" 


  it "Did you know trololo? http://www.youtube.com/watch?v=iwGFalTRHDA&feature=related It's awesome." 


  it "This is a table. <table><tr><th>Foo</th></tr><tr><td>Bar</td></tr></table> This is another regular paragraph." 


  it "should remove <div> block" 


  it "some **bold** text" 

  
  it "some *italic* text" 

  
  it "She used to mean:\n\n* So\n* much\n* to\n * me!" 


  it "she@couchsurfing.org used to mean so much to www.teambox.com" 


  it %(I loved that quote: ["I like the Divers, but they want me want to go to a war."](http://www.shmoop.com/tender-is-the-night/tommy-barban.html) Great page, too.) do
    should == %Q{<p>I loved that quote: <a href="http://www.shmoop.com/tender-is-the-night/tommy-barban.html">"I like the Divers, but they want me want to go to a war."</a> Great page, too.</p>}
  end

  it "I'd link my competitors' mistakes (www.failblog.org) but that'd give them free traffic. So instead I link www.google.com." 


  it 'Did you know the logo from Teambox has <a href="http://en.wikipedia.org/wiki/Color_theory">carefully selected colors</a>? <img src="http://app.teambox.com/images/header_logo_large.jpg"/>' 


  it 'This commit needs a spec: http://github.com/teambox/teambox/blob/4b54c555d118cd3bc4d4d80fbc59b1eed79b4e80/lib/html_formatting.rb' 


  it 'This commit needs a spec: http://github.com/teambox/teambox/commit/4b54c555d118cd3bc4d4d80fbc59b1eed79b4e8' 


  it "Lorem ipsum dolor sit amet.\n\n<pre>*lorem* _ipsum_ weird_var_name</pre>\n\nExcepteur sint occaecat cupidatat non proident." 


  it "This is a comment\nwith multiple lines\n\nJordi." 

  
  it "Can somebody spec and fix this?\n\nA comment line \"**text**\ntext\" should return a line break with a br tag." 


  it "This is a comment with an_underscored_word" 

  
  it "Why don't you\nhttp://www.google.co.uk/images/logos/ps_logo2.png\nIt?" 

  
  it "Why don't you\nJust http://www.google.co.uk/images/logos/ps_logo2.png\nIt?" 


  it "Should not allow <script>alert(1)</script> tags or weird <a href=\"#\" onmouseover='alert(1)'>tricks</a>" 

  
  context "Add http:// to links" do
    it "The internet is made of [lolcats](icanhascheezburger.com)" 


    it "The internet is made of [memes](www.4chan.org)" 


    it "The internet is made of [random](www.4chan.org/b)" 

    
    it "The internet is made of [google](http://google.com)" 

  end

end

