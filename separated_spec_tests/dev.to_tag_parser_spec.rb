require "rails_helper"

RSpec.describe ActsAsTaggableOn::TagParser do
  let(:tag0) { create(:tag, name: "things") }
  let(:tag1) { create(:tag, name: "peter") }

  let(:tag2) { create(:tag, name: "stuff", alias_for: tag0.name) }

  let(:tag3) { create(:tag, name: "mac", alias_for: tag1.name) }

  def create_tag_parser(tag_arr)
    described_class.new(tag_arr).parse
  end
  describe "#parse" do
    it "removes spaces" 


    it "does not allow dashes" 

    it "allows only alphanumeric characters" 

    it "returns nothing if nothing is recieved" 

    it "uses tag alias if one exists" 

  end
end

