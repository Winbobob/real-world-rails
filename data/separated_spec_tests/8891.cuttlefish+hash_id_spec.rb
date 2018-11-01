# frozen_string_literal: true

require "spec_helper"

describe HashId do
  it ".hash" 


  describe ".valid?" do
    it {
      expect(
        HashId.valid?("15", "29a6fc331a2dc6ebe86a055b91dfb19f6537f6c4")
      ).to be_truthy
    }
    it {
      expect(
        HashId.valid?("15", "this hash is wrong")
      ).to be_falsy
    }
    it {
      expect(
        HashId.valid?("14", "29a6fc331a2dc6ebe86a055b91dfb19f6537f6c4")
      ).to be_falsy
    }
  end
end

