require "active_support/core_ext/string/strip"

describe Qiita::Markdown::Processor do
  describe "#call" do
    subject do
      result[:output].to_s
    end

    let(:context) do
      { hostname: "example.com" }
    end

    let(:markdown) do
      raise NotImplementedError
    end

    let(:result) do
      described_class.new(context).call(markdown)
    end

    shared_examples_for "basic markdown syntax" do
      context "with valid condition" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            example
          EOS
        end

        it "returns a Hash with HTML output and other metadata" 

      end

      context "with HTML-characters" do
        let(:markdown) do
          "<>&"
        end

        it "sanitizes them" 

      end

      context "with email address" do
        let(:markdown) do
          "test@example.com"
        end

        it "replaces with mailto link" 

      end

      context "with headings" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            # a
            ## a
            ### a
            ### a
          EOS
        end

        it "adds ID for ToC" 

      end

      context "with heading whose title includes special HTML characters" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            # <b>R&amp;B</b>
          EOS
        end

        it "generates fragment identifier by sanitizing the special characters in the title" 

      end

      context "with manually inputted heading HTML tags without id attribute" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            <h1>foo</h1>
          EOS
        end

        it "does nothing" 

      end

      context "with code" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            ```foo.rb
            puts 'hello world'
            ```
          EOS
        end

        it "returns detected codes" 

      end

      context "with code & filename" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            ```example.rb
            1
            ```
          EOS
        end

        it "returns code-frame, code-lang, and highlighted pre element" 

      end

      context "with code & filename with .php" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            ```example.php
            1
            ```
          EOS
        end

        it "returns PHP code-frame" 

      end

      context "with code & no filename" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            ```ruby
            1
            ```
          EOS
        end

        it "returns code-frame and highlighted pre element" 

      end

      context "with undefined but aliased language" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            ```zsh
            true
            ```
          EOS
        end

        it "returns aliased language name" 

      end

      context "with code with leading and trailing newlines" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            ```

            foo

            ```
          EOS
        end

        it "does not strip the newlines" 

      end

      context "with mention" do
        let(:markdown) do
          "@alice"
        end

        it "replaces mention with link" 

      end

      context "with mention to short name user" do
        let(:markdown) do
          "@al"
        end

        it "replaces mention with link" 

      end

      context "with mentions in complex patterns" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            @alice

            ```
              @bob
            ```

            @charlie/@dave
            @ell_en
            @fran-k
            @Isaac
            @justin
            @justin
            @mallory@github
            @#{'o' * 33}
            @o
            @o-
            @-o
            @o_
            @_o
          EOS
        end

        it "extracts mentions correctly" 

      end

      context "with mention-like filename on code block" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            ```ruby:@alice
            1
            ```
          EOS
        end

        it "does not treat it as mention" 

      end

      context "with mention in blockquote" do
        let(:markdown) do
          "> @alice"
        end

        it "does not replace mention with link" 

      end

      context "with mention to user whose name starts and ends with underscore" do
        let(:markdown) do
          "@_alice_"
        end

        it "does not emphasize the name" 

      end

      context "with allowed_usernames context" do
        before do
          context[:allowed_usernames] = ["alice"]
        end

        let(:markdown) do
          <<-EOS.strip_heredoc
            @alice
            @bob
          EOS
        end

        it "limits mentions to allowed usernames" 

      end

      context "with @all and allowed_usernames context" do
        before do
          context[:allowed_usernames] = ["alice", "bob"]
        end

        let(:markdown) do
          "@all"
        end

        it "links it and reports all allowed users as mentioned user names" 

      end

      context "with @all and @alice" do
        before do
          context[:allowed_usernames] = ["alice", "bob"]
        end

        let(:markdown) do
          "@all @alice"
        end

        it "does not duplicate mentioned user names" 

      end

      context "with @all and no allowed_usernames context" do
        let(:markdown) do
          "@all"
        end

        it "does not repond to @all" 

      end

      context "with group mention without group_memberion_url_generator" do
        let(:markdown) do
          "@alice/bob"
        end

        it "does not replace it" 

      end

      context "with group mention" do
        let(:context) do
          super().merge(group_mention_url_generator: lambda do |group|
            "https://#{group[:team_url_name]}.example.com/groups/#{group[:group_url_name]}"
          end)
        end

        let(:markdown) do
          "@alice/bob"
        end

        it "replaces it with preferred link and updates :mentioned_groups" 

      end

      context "with group mention following another text" do
        let(:context) do
          super().merge(group_mention_url_generator: lambda do |group|
            "https://#{group[:team_url_name]}.example.com/groups/#{group[:group_url_name]}"
          end)
        end

        let(:markdown) do
          "FYI @alice/bob"
        end

        it "preserves space after preceding text" 

      end

      context "with normal link" do
        let(:markdown) do
          "[](/example)"
        end

        it "creates link for that" 

      end

      context "with anchor link" do
        let(:markdown) do
          "[](#example)"
        end

        it "creates link for that" 

      end

      context "with link with title" do
        let(:markdown) do
          '[](/example "Title")'
        end

        it "creates link for that with the title" 

      end

      context "with raw URL" do
        let(:markdown) do
          "http://example.com/search?q=日本語"
        end

        it "creates link for that with .autolink class" 

      end

      context "with javascript: link" do
        let(:markdown) do
          "[](javascript:alert(1))"
        end

        it "removes that link by creating empty a element" 

      end

      context "with emoji" do
        let(:markdown) do
          ":+1:"
        end

        it "replaces it with img element" 

      end

      context "with emoji in pre or code element" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            ```
            :+1:
            ```
          EOS
        end

        it "does not replace it" 

      end

      context "with image notation" do
        let(:markdown) do
          "![a](http://example.com/b.png)"
        end

        it "wraps it in a element" 

      end

      context "with image notation with title" do
        let(:markdown) do
          '![a](http://example.com/b.png "Title")'
        end

        it "generates <img> tag with the title" 

      end

      context "with <img> tag with width and height attribute (for Retina image)" do
        let(:markdown) do
          '<img width="80" height="48" alt="a" src="http://example.com/b.png">'
        end

        it "wraps it in a element while keeping the width attribute" 

      end

      context "with colon-only label" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            ```:
            1
            ```
          EOS
        end

        it "does not replace it" 

      end

      context "with font element with color attribute" do
        let(:markdown) do
          %[<font color="red">test</font>]
        end

        it "allows font element with color attribute" 

      end

      context "with task list" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            - [ ] a
            - [x] b
          EOS
        end

        it "inserts checkbox" 

      end

      context "with nested task list" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            - [ ] a
             - [ ] b
          EOS
        end

        it "inserts checkbox" 

      end

      context "with task list in code block" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            ```
            - [ ] a
            - [x] b
            ```
          EOS
        end

        it "does not replace checkbox" 

      end

      context "with empty line between task list" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            - [ ] a

            - [x] b
          EOS
        end

        it "inserts checkbox" 

      end

      context "with empty list" do
        let(:markdown) do
          "- \n"
        end

        it "inserts checkbox" 

      end

      context "with text-aligned table" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            | a  | b  | c   |
            |:---|---:|:---:|
            | a  | b  | c   |
          EOS
        end

        it "creates table element with text-align style" 

      end

      context "with footenotes syntax" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            [^1]
            [^1]: test
          EOS
        end

        it "generates footnotes elements" 

      end

      context "with manually written link inside of <sup> tag" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            <sup>[Example](http://example.com/)</sup>
          EOS
        end

        it "does not confuse the structure with automatically generated footnote reference" 

      end

      context "with manually written <a> tag with strange href inside of <sup> tag" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            <sup><a href="#foo.1">Link</a></sup>
          EOS
        end

        it "does not confuse the structure with automatically generated footnote reference" 

      end

      context "with markdown: { footnotes: false } context" do
        before do
          context[:markdown] = { footnotes: false }
        end

        let(:markdown) do
          <<-EOS.strip_heredoc
            [^1]
            [^1]: test
          EOS
        end

        it "does not generate footnote elements" 

      end

      context "with emoji_names and emoji_url_generator context" do
        before do
          context[:emoji_names] = %w(foo o)

          context[:emoji_url_generator] = proc do |emoji_name|
            "https://example.com/foo.png" if emoji_name == "foo"
          end
        end

        let(:markdown) do
          <<-EOS.strip_heredoc
            :foo: :o: :x:
          EOS
        end

        it "replaces only the specified emoji names with img elements with custom URL" 

      end

      context "with internal URL" do
        let(:markdown) do
          "http://qiita.com/?a=b"
        end

        let(:context) do
          { hostname: "qiita.com" }
        end

        it "creates link which does not have rel='nofollow noopener' and target='_blank'" 

      end

      context "with external URL" do
        let(:markdown) do
          "http://external.com/?a=b"
        end

        let(:context) do
          { hostname: "qiita.com" }
        end

        it "creates link which has rel='nofollow noopener' and target='_blank'" 

      end

      context "with internal anchor tag" do
        let(:markdown) do
          '<a href="http://qiita.com/?a=b">foobar</a>'
        end

        let(:context) do
          { hostname: "qiita.com" }
        end

        it "creates link which does not have rel='nofollow noopener' and target='_blank'" 

      end

      context "with external anchor tag" do
        let(:markdown) do
          '<a href="http://external.com/?a=b">foobar</a>'
        end

        let(:context) do
          { hostname: "qiita.com" }
        end

        it "creates link which has rel='nofollow noopener' and target='_blank'" 

      end

      context "with external URL which ends with the hostname parameter" do
        let(:markdown) do
          "http://qqqqqqiita.com/?a=b"
        end

        let(:context) do
          { hostname: "qiita.com" }
        end

        it "creates link which has rel='nofollow noopener' and target='_blank'" 

      end

      context "with external anchor tag which ends with the hostname parameter" do
        let(:markdown) do
          '<a href="http://qqqqqqiita.com/?a=b">foobar</a>'
        end

        let(:context) do
          { hostname: "qiita.com" }
        end

        it "creates link which has rel='nofollow noopener' and target='_blank'" 

      end

      context "with sub-domain URL of hostname parameter" do
        let(:markdown) do
          "http://sub.qiita.com/?a=b"
        end

        let(:context) do
          { hostname: "qiita.com" }
        end

        it "creates link which has rel='nofollow noopener' and target='_blank'" 

      end

      context "with external anchor tag which has rel attribute" do
        let(:markdown) do
          '<a href="http://external.com/?a=b" rel="url">foobar</a>'
        end

        let(:context) do
          { hostname: "qiita.com" }
        end

        it "creates link which has rel='nofollow noopener' and target='_blank', and rel value is overwritten" 

      end

      context "with blockquote syntax" do
        let(:markdown) do
          "> foo"
        end

        it "does not confuse it with HTML tag angle brackets" 

      end
    end

    shared_examples_for "script element" do |allowed:|
      context "with script element" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            <script>alert(1)</script>
          EOS
        end

        if allowed
          it "allows script element" 


          context "and allowed attributes" do
            let(:markdown) do
              <<-EOS.strip_heredoc
                <p><script async data-a="b" type="text/javascript">alert(1)</script></p>
              EOS
            end

            it "allows data-attributes" 

          end
        else
          it "removes script element" 

        end
      end
    end

    shared_examples_for "malicious script in filename" do |allowed:|
      context "with malicious script in filename" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            ```js:test<script>alert(1)</script>
            1
            ```
          EOS
        end

        if allowed
          it "does not sanitize script element" 

        else
          it "sanitizes script element" 

        end
      end
    end

    shared_examples_for "iframe element" do |allowed:|
      context "with iframe" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            <iframe width="1" height="2" src="//example.com" frameborder="0" allowfullscreen></iframe>
          EOS
        end

        if allowed
          it "allows iframe with some attributes" 

        else
          it "sanitizes iframe element" 

        end
      end
    end

    shared_examples_for "input element" do |allowed:|
      context "with input" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            <input type="checkbox"> foo
          EOS
        end

        if allowed
          it "allows input with some attributes" 

        else
          it "sanitizes input element" 

        end
      end
    end

    shared_examples_for "data-attributes" do |allowed:|
      context "with data-attributes" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            <div data-a="b"></div>
          EOS
        end

        if allowed
          it "does not sanitize data-attributes" 

        else
          it "sanitizes data-attributes" 

        end
      end
    end

    shared_examples_for "class attribute" do |allowed:|
      context "with class attribute for general tags" do
        let(:markdown) do
          '<i class="fa fa-user"></i>user'
        end

        if allowed
          it "does not sanitize the attribute" 

        else
          it "sanitizes the attribute" 

        end
      end

      context "with class attribute for <a> tag" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            <a href="foo" class="malicious-class">foo</a>
            http://qiita.com/
          EOS
        end

        if allowed
          it "does not sanitize the classes" 

        else
          it "sanitizes classes except `autolink`" 

        end
      end

      context "with class attribute for <blockquote> tag" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            <blockquote class="twitter-tweet malicious-class">foo</blockquote>
          EOS
        end

        if allowed
          it "does not sanitize the classes" 

        else
          it "sanitizes classes except `twitter-tweet`" 

        end
      end

      context "with class attribute for <div> tag" do
        let(:markdown) do
          <<-EOS.strip_heredoc
            <div class="footnotes malicious-class">foo</div>
          EOS
        end

        if allowed
          it "does not sanitize the classes" 

        else
          it "sanitizes classes except `footnotes`" 

        end
      end
    end

    context "without script and strict context" do
      let(:context) do
        super().merge(script: false, strict: false)
      end

      include_examples "basic markdown syntax"
      include_examples "script element", allowed: false
      include_examples "malicious script in filename", allowed: false
      include_examples "iframe element", allowed: false
      include_examples "input element", allowed: true
      include_examples "data-attributes", allowed: false
      include_examples "class attribute", allowed: true
    end

    context "with script context" do
      let(:context) do
        super().merge(script: true, strict: false)
      end

      include_examples "basic markdown syntax"
      include_examples "script element", allowed: true
      include_examples "malicious script in filename", allowed: true
      include_examples "iframe element", allowed: true
      include_examples "input element", allowed: true
      include_examples "data-attributes", allowed: true
      include_examples "class attribute", allowed: true
    end

    context "with strict context" do
      let(:context) do
        super().merge(script: false, strict: true)
      end

      include_examples "basic markdown syntax"
      include_examples "script element", allowed: false
      include_examples "malicious script in filename", allowed: false
      include_examples "iframe element", allowed: false
      include_examples "input element", allowed: false
      include_examples "data-attributes", allowed: false
      include_examples "class attribute", allowed: false
    end

    context "with script and strict context" do
      let(:context) do
        super().merge(script: true, strict: true)
      end

      include_examples "basic markdown syntax"
      include_examples "script element", allowed: false
      include_examples "malicious script in filename", allowed: true
      include_examples "iframe element", allowed: false
      include_examples "input element", allowed: false
      include_examples "data-attributes", allowed: false
      include_examples "class attribute", allowed: false
    end
  end
end

