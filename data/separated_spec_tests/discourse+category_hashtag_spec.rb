require 'rails_helper'

describe CategoryHashtag do
  describe '#query_from_hashtag_slug' do
    let(:parent_category) { Fabricate(:category) }
    let(:child_category) { Fabricate(:category, parent_category: parent_category) }

    it "should return the right result for a parent category slug" 


    it "should return the right result for a parent and child category slug" 


    it "should return nil for incorrect parent category slug" 


    it "should return nil for incorrect parent and child category slug" 


    it "should be case sensitive" 

  end
end

