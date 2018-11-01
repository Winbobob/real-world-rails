require 'rails_helper'

describe EventPolicy do
  describe "#publishable / #see_unpublished?" do
    let!(:notable_chapter) { create(:chapter) }
    let!(:notable_chapter_event) { create(:event, chapter: notable_chapter) }
    let!(:other_event) { create(:event) }

    it "does not allow unprivileged users to see any events" 


    it "allows publishers to see all events" 


    it "allows admins to see unpublished events" 


    it "allows chapter leaders to see unpublished events" 


    it "allows organization leaders to see unpublished events" 

  end

  describe "#publish?" do
    let!(:event) { create(:event) }

    it "allows admins to publish an event" 


    it "allows chapter leaders to publish an event" 


    it "allows organization leaders to publish an event" 


    it "does not allow strangers to edit an event" 

  end

  describe "#update?" do
    let!(:event) { create(:event) }

    it "allows admins to edit an event" 


    it "allows organizers to edit an event" 


    it "allows chapter leaders to edit an event" 


    it "does not allow strangers to edit an event" 

  end
end

