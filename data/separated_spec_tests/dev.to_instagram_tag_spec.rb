require "rails_helper"

RSpec.describe InstagramTag, type: :liquid_template do
  describe "#id" do
    let(:valid_id)      { "BXgGcAUjM39" }
    let(:invalid_id)    { "blahblahblahbl" }

    def generate_instagram_tag(id)
      Liquid::Template.register_tag("instagram", InstagramTag)
      Liquid::Template.parse("{% instagram #{id} %}")
    end

    it "checks that the tag is properly parsed" 


    it "rejects invalid ids" 


    it "accepts a valid id" 

  end
end

