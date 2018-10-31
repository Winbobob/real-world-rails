require 'rails_helper'
require 'quote_comparer'

describe QuoteComparer do

  describe "#modified?" do
    let(:post) { Fabricate(:post, raw: "This has **text** we _are_ matching") }

    def qc(text)
      QuoteComparer.new(post.topic_id, post.post_number, text)
    end

    it "returns true for no post" 


    it "returns true for nil text" 


    it "returns true for empty text" 


    it "returns true for modified text" 


    it "return false when the text matches exactly" 


    it "return false when there's a substring" 


    it "return false when there's extra space" 

  end
end

