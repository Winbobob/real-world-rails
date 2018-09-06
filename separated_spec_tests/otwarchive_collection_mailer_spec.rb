require 'spec_helper'

describe CollectionMailer do
  describe "basic collection emails" do

    before(:each) do
      @collection = FactoryGirl.create(:collection)
      @collection.email = "test@testing.com"
      @collection.save
      @work = FactoryGirl.create(:work)
    end

    let(:email) { CollectionMailer.item_added_notification(@work.id, @collection.id, "Work").deliver }

    it "should have a valid from line" 

  end
end

