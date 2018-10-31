require 'spec_helper'

describe CollectionItemsController do
  include LoginMacros
  include RedirectExpectationHelper

  describe "GET #index" do
    let(:user) { create(:user) }
    before(:each) do
      @collection = create(:collection)
      @rejected_work = create(:work)
      @approved_work = create(:work)
      @invited_work = create(:work)
      @approved_work.add_to_collection(@collection) && @approved_work.save
      @approved_work_item = CollectionItem.find_by_item_id(@approved_work.id)
      @rejected_work_item = create(:collection_item, collection_id: @collection.id, item_id: @rejected_work.id)
      @rejected_work_item.collection_approval_status = -1
      @rejected_work_item.save
      @invited_work_item = create(:collection_item, collection_id: @collection.id, item_id: @invited_work.id)
      @invited_work_item.user_approval_status = 0
      @invited_work_item.save
    end

    context "where the user is not a maintainer" do
      it "redirects and shows an error message" 

    end

    context "rejected parameter for collection with items in" do
      let(:owner) { @collection.owners.first.user }

      it "includes rejected items" 


      it "excludes approved and invited items" 

    end

    context "invited parameter for collection with items in" do
      let(:owner) { @collection.owners.first.user }

      it "includes invited items" 


      it "excludes approved and rejected items" 

    end

    context "for collection with items in, default approved parameter" do
      let(:owner) { @collection.owners.first.user }

      it "includes approved items" 


      it "excludes invited and rejected items" 

    end
  end

  describe "GET #create" do
    context "creation" do
      let (:collection) { FactoryGirl.create(:collection) }

      it "fails if collection names missing" 


      it "fails if items missing" 

    end
  end

  describe "#destroy" do
    before(:each) do
      @collection = FactoryGirl.create(:collection)
      @approved_work = FactoryGirl.create(:work)
      @approved_work.add_to_collection(@collection) && @approved_work.save
    end

    context "destroy" do
      let(:owner) { @collection.owners.first.user }

      it "removes things" 

    end
  end
end

