require "rails_helper"

RSpec.describe NullTag, type: :liquid_template do
  describe "#initialize" do
    tags = %w(assign capture case comment cycle for if ifchanged include unless)

    setup { tags.each { |tag| Liquid::Template.register_tag(tag, NullTag) } }

    def generate_given_tag(tag)
      Liquid::Template.parse("{% #{tag} %}")
    end

    context "when attempting the tags" do
      it "prevents the tag from being used" 

    end
  end
end

