require "rails_helper"

RSpec.describe GistTag, type: :liquid_template do
  describe "#link" do
    let(:gist_link) { "https://gist.github.com/vaidehijoshi/6536e03b81e93a78c56537117791c3f1" }
    let(:bad_links) do
      [
        "//pastebin.com/raw/b77FrXUA#gist.github.com",
        "https://gist.github.com@evil.com",
        "https://gist.github.com.evil.com",
        "https://gist.github.com/string/string/raw/string/file",
      ]
    end

    def generate_new_liquid(link)
      Liquid::Template.register_tag("gist", GistTag)
      Liquid::Template.parse("{% gist #{link} %}")
    end

    def generate_script(link)
      html = <<~HTML
        <div class="ltag_gist-liquid-tag">
            <script id="gist-ltag" src="#{link}.js"></script>
        </div>
      HTML
      html.gsub("\n", " ").delete(" ")
    end

    it "accepts proper gist url" 


    it "rejects invalid gist url" 


    it "rejects XSS attempts" 

  end
end

