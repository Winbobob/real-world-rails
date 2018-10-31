require "rails_helper"

RSpec.describe ReplitTag, type: :liquid_template do
  describe "#id" do
    let(:replit_id) { "@WigWog/PositiveFineOpensource" }

    def generate_new_liquid(id)
      Liquid::Template.register_tag("replit", ReplitTag)
      Liquid::Template.parse("{% replit #{id} %}")
    end

    it "accepts replit id" 


    it "renders iframe" 

  end
end

