require 'spec_helper'

def update_collection_setting(collection, setting, value)
  collection.collection_preference.send("#{setting}=", value)
  collection.collection_preference.save
end

describe Collectible do

  # TO-DO: update this to test the code for all types of collectibles,
  # bookmarks, works, etc

  it "should not be put into a nonexistent collection" 


  it "should return collections for approved_collections scope" 


  context "approved_collections have more than one work" do
    it "should return distinct collections for approved_collections scope" 

  end

  context "being posted to a collection", focus: true do
    let(:collection) { create(:collection) }
    # build but don't save so we can change the collection settings
    let(:work) { build(:work, collection_names: collection.name) }
    subject { work }

    describe "once added" do

      it "should be in that collection" 


      it "should be removable" 


      it "should be automatically approved when there is no current user" 


    end

    %w(unrevealed anonymous).each do |state|
      describe "which is #{state}" do
        before do
          # set the state of the collection and then save to put the work into the collection
          update_collection_setting(collection, state, true)
          work.save!
        end

        it "should be #{state}" 


        describe "and when the collection is no longer #{state}" do
          before do
            collection.collection_preference.send("#{state}=",false)
            collection.collection_preference.save
            work.reload
          end

          it "should not be #{state}" 

        end

        describe "when the work is removed from the collection" do
          before do
            work.collection_names = ""
            work.save
          end

          it "should not be #{state}" 

        end
        describe "when the work's collection item is individually changed" do
          before do
            ci = work.collection_items.first
            ci.send("#{state}=", false)
            ci.save
            work.reload
          end

          xit "should no longer be #{state}" do
            expect(work.send("in_#{state == 'anonymous' ? 'anon' : state}_collection")).not_to be_truthy
          end
        end
      end
    end
  end

end

