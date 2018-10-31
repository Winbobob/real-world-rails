require "rails_helper"

RSpec.describe CodepenTag, type: :liquid_template do
  describe "#link" do
    let(:codepen_link) { "https://codepen.io/twhite96/pen/XKqrJX" }

    xss_links = %w(
      //evil.com/?codepen.io
      https://codepen.io.evil.com
      https://codepen.io/some_username/pen/" onload='alert("xss")'
    )

    def generate_new_liquid(link)
      Liquid::Template.register_tag("codepen", CodepenTag)
      Liquid::Template.parse("{% codepen #{link} %}")
    end

    it "accepts codepen link" 


    it "accepts codepen link with a / at the end" 


    it "rejects invalid codepen link" 


    it "rejects XSS attempts" 

  end
end

