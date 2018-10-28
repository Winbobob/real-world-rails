require "rails_helper"

RSpec.describe GlitchTag, type: :liquid_template do
  describe "#id" do
    let(:valid_id) { "BXgGcAUjM39" }

    def generate_tag(id)
      Liquid::Template.register_tag("glitch", GlitchTag)
      Liquid::Template.parse("{% glitch #{id} %}")
    end

    it "accepts a valid id" 

  end
end

