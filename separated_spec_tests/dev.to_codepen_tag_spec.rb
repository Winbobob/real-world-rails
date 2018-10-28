require "rails_helper"

RSpec.describe CodepenTag, type: :liquid_template do
  describe "#link" do
    let(:codepen_link) { "https://codepen.io/twhite96/pen/XKqrJX" }

    def generate_new_liquid(link)
      Liquid::Template.register_tag("codepen", CodepenTag)
      Liquid::Template.parse("{% codepen #{link} %}")
    end

    it "accepts codepen link" 


    it "rejects invalid codepen link" 

  end
end

