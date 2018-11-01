require 'rails_helper'
require 'onebox/engine/flash_video_onebox'

describe Onebox::Engine::FlashVideoOnebox do
  before do
    @o = Onebox::Engine::FlashVideoOnebox.new('http://player.56.com/v_OTMyNTk1MzE.swf')
  end

  context "when SiteSetting.enable_flash_video_onebox is true" do
    before do
      SiteSetting.enable_flash_video_onebox = true
    end

    it "generates a flash video" 

  end

  context "when SiteSetting.enable_flash_video_onebox is false" do
    before do
      SiteSetting.enable_flash_video_onebox = false
    end

    it "generates a link" 

  end
end

