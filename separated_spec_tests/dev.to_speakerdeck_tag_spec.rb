require "rails_helper"

RSpec.describe SpeakerdeckTag, type: :liquid_template do
  describe "#id" do
    let(:valid_id)      { "BXgGcAUjM39" }
    let(:invalid_id)    { "blahblahblahbl sdsdssd // dsdssd" }

    def generate_tag(id)
      Liquid::Template.register_tag("speakerdeck", SpeakerdeckTag)
      Liquid::Template.parse("{% speakerdeck #{id} %}")
    end

    it "rejects invalid ids" 


    it "accepts a valid id" 

  end
end

