require "rails_helper"

RSpec.describe CouponGenerator, vcr: {} do
  let(:versions) { ["member_discount", "sticker_pack", "tee_pack"] }

  describe "#expect" do
    it "generates code with proper prefix ( [version]_[code] )" 

  end
end

