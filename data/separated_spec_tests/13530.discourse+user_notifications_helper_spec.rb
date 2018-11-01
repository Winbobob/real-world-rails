require 'rails_helper'

describe UserNotificationsHelper do
  describe 'email_excerpt' do
    let(:paragraphs) { [
      "<p>This is the first paragraph, but you should read more.</p>",
      "<p>And here is its friend, the second paragraph.</p>"
    ] }

    let(:cooked) do
      paragraphs.join("\n")
    end

    it "can return the first paragraph" 


    it "can return another paragraph to satisfy digest_min_excerpt_length" 


    it "doesn't count emoji images" 


    it "only counts link text" 


    it "uses user quotes but not post quotes" 

  end
end

