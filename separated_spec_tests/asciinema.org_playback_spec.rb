require 'rails_helper'

describe 'Asciicast playback', js: true, slow: true do

  describe "from fixture" do
    before do
      @old_wait_time = Capybara.default_wait_time
      Capybara.default_wait_time = 15
    end

    after do
      Capybara.default_wait_time = @old_wait_time
    end

    context "for public asciicast" do
      let(:asciicast) { create(:asciicast, private: false) }

      it "is successful" 

    end

    context "for private asciicast" do
      let(:asciicast) { create(:asciicast, private: true) }

      it "is successful" 

    end
  end

end

