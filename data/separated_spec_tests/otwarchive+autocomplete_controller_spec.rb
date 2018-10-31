require "spec_helper"

describe AutocompleteController do
  describe "tag" do
    let!(:tag1) { create(:canonical_fandom, name: "Match") }
    let!(:tag2) { create(:canonical_fandom, name: "Blargh") }

    it "returns only matching tags" 

  end
end

