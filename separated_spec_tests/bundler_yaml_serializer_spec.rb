# frozen_string_literal: true

require "bundler/yaml_serializer"

RSpec.describe Bundler::YAMLSerializer do
  subject(:serializer) { Bundler::YAMLSerializer }

  describe "#dump" do
    it "works for simple hash" 


    it "handles nested hash" 


    it "array inside an hash" 

  end

  describe "#load" do
    it "works for simple hash" 


    it "works for nested hash" 


    it "handles colon in key/value" 


    it "handles arrays inside hashes" 


    it "handles windows-style CRLF line endings" 

  end

  describe "against yaml lib" do
    let(:hash) do
      {
        "a_joke" => {
          "my-stand" => "I can totally keep secrets",
          "but" => "The people I tell them to can't :P",
          "wouldn't it be funny if this string were empty?" => "",
        },
        "more" => {
          "first" => [
            "Can a kangaroo jump higher than a house?",
            "Of course, a house doesn't jump at all.",
          ],
          "second" => [
            "What did the sea say to the sand?",
            "Nothing, it simply waved.",
          ],
          "array with empty string" => [""],
        },
        "sales" => {
          "item" => "A Parachute",
          "description" => "Only used once, never opened.",
        },
        "one-more" => "I'd tell you a chemistry joke but I know I wouldn't get a reaction.",
      }
    end

    context "#load" do
      it "retrieves the original hash" 

    end

    context "#dump" do
      it "retrieves the original hash" 

    end
  end
end

