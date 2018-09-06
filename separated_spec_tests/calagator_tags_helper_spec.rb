require 'spec_helper'

module Calagator

describe TagsHelper, type: :helper do
  describe "#tag_links_for" do
    it "renders tag links for the supplied model" 

  end

  describe "#display_tag_icons" do
    before do
      @event = FactoryGirl.create(:event, :tag_list => ['ruby', 'pizza'])
      @event2 = FactoryGirl.create(:event, :tag_list => ['no_image', 'also_no_image'])
      @untagged_event = Event.new
    end

    it "should render nothing if no image tags" 


    it "should render nothing if event has no tags" 

  end
end

end

