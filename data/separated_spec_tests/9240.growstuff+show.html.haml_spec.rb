require 'rails_helper'

describe "photos/show" do
  let(:photo) { FactoryBot.create :photo, owner: member }
  before { @photo = photo }

  let(:member) { FactoryBot.create :member }

  let(:harvest) { FactoryBot.create :harvest, owner: member }
  let(:planting) { FactoryBot.create :planting, owner: member }
  let(:seed) { FactoryBot.create :seed, owner: member }
  let(:garden) { FactoryBot.create :garden, owner: member }

  shared_examples "photo data renders" do
    it "shows the image" 


    it "links to the owner's profile" 


    it "shows a link to the original image" 


    it "links to harvest" 

    it "links to planting" 

    it "links to garden" 

    it "links to seeds" 

  end

  shared_examples "No links to change data" do
    it "does not have a delete button" 

  end

  context "signed in as owner" do
    before(:each) do
      controller.stub(:current_user) { member }
      render
    end

    include_examples "photo data renders"

    it "has a delete button" 

  end

  context "signed in as another member" do
    before(:each) do
      controller.stub(:current_user) { FactoryBot.create :member }
      render
    end

    include_examples "photo data renders"
    include_examples "No links to change data"
  end

  context "not signed in" do
    before(:each) do
      controller.stub(:current_user) { nil }
      render
    end

    include_examples "photo data renders"
    include_examples "No links to change data"
  end

  context "CC-licensed photo" do
    before(:each) do
      controller.stub(:current_user) { nil }
      # @photo = assign(:photo, FactoryBot.create(:photo, owner: @member))
      @photo.harvests << harvest
      @photo.plantings << planting
      @photo.seeds << seed
      @photo.gardens << garden
      render
    end

    it "links to the CC license" 

  end

  context "unlicensed photo" do
    before(:each) do
      controller.stub(:current_user) { nil }
      @photo = assign(:photo, FactoryBot.create(:unlicensed_photo))
      render
    end

    it "contains the phrase 'All rights reserved'" 

  end
end

